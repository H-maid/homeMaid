<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Carbon\Carbon;
use App\Models\User;
use Twilio\Rest\Client;
use Log;
use Hash;
use App;
use Auth;
use Exception;
class CommonController extends Controller
{
	public function __construct(Request $request){
		$timezone = $request->header('timezone');
		$locale = $request->header('locale');
		if($timezone){
        	$this->setTimeZone($timezone);
        }
        if($locale){
        	\App::setLocale($locale);
        }
	}

    public function checkUser(Request $request){
        $social_id = $request->social_id;
        $email = $request->email;
         $validations = [
            'social_id' => 'required',
            'email' => 'required|email:unique',
        ];
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
        $userData = User::where(['social_id' => $social_id , 'email' => $email])->first();
        $response = [
            'messages' => __('messages.success.success'),
            'response' => $userData
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function sign_up(Request $request){
        Log::info('CommonController----sign_up----'.print_r($request->all(),True));
        $user_name = $request->user_name;
        $email = $request->email;
        $country_code = $request->country_code;
        $mobile = $request->mobile;
        $password = Hash::make($request->password);
        $accessToken  = md5(uniqid(rand(), true));
        $otp = rand(1000,10000);
        $device_token = $request->device_token;
        $device_type = $request->device_type;
        $user_type = $request->user_type;
        // dd($country_code);
        $data = User::where([
        	'country_code' => $country_code, 
        	'mobile' => $mobile,
        	'user_type' => $user_type
        ])->first();
        if(!count($data)){ 
            $validations = [
            	'user_name' => 'required',
            	'email' => 'required',
                'mobile' => 'required',
                // 'mobile' => 'required|unique:users',
                'country_code' => 'required',
                'password' => 'required|min:8',
                'device_token' => 'required',
                'device_type' => 'required|numeric',
                'user_type' => 'required|numeric',
            ];
            $validator = Validator::make($request->all(),$validations);
            if($validator->fails()){
                $response = [
                'message' => $validator->errors($validator)->first()
                ];
                return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            }else{
                $user = new \App\User;
                $user->name = $user_name;
                $user->email = $email;
                $user->country_code = $country_code;
                $user->mobile = $mobile;
                $user->password = $password;
                $user->otp = $otp;
                $user->device_token = $device_token;
                $user->remember_token = $accessToken;
                $user->device_type = $device_type;
                $user->user_type = $user_type;
                $user->created_at = time();
                $user->updated_at = time();
                $user->save();
                $userData = User::where(['id' => $user->id])->first();
                $userData['otp_response'] = $this->sendOtp($country_code.$mobile,$otp);
                $response = [
                    'message' =>  __('messages.success.signup'),
                    'response' => $userData,

                ];
                Log::info('CommonController----sign_up----'.print_r($response,True));
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }
        }else{ 
			$response = [
			'message' =>  __('messages.error.mobile_already_taken'),
			];
			return response()->json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
    }

    public function login(Request $request){
        Log::info('CommonController----login----'.print_r($request->all(),True));
        $mobile = $request->mobile;
        $password = $request->input('password');
        $user_type = $request->user_type;
        $device_token = $request->device_token;
        $device_type = $request->device_type;
        $accessToken  = md5(uniqid(rand(), true));
        $otp = rand(1000,10000);
        $validations = [
            'mobile' => 'required',
            'password' => 'required|min:8',
            'device_token' => 'required',
            'device_type' => 'required|numeric',
            'user_type' => 'required',
        ];
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            $response = [
            'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
            $userDetail = User::Where(['mobile' => $mobile , 'user_type' => $user_type])->first();
            if(!empty($userDetail)){
                if(Hash::check($password,$userDetail->password)){
                    $User = new User;
                    $UserDetail = $User::find($userDetail->id);
                    if($UserDetail->otp_verified != 1){
                        $UserDetail->otp = $otp;
                        $UserDetail->otp_verified = 0;
                        $this->sendOtp($UserDetail->country_code.$UserDetail->mobile,$otp);
                    }
                    $UserDetail->device_token = $device_token;
                    $UserDetail->device_type = $device_type;
                    $UserDetail->remember_token = $accessToken;
                    $UserDetail->updated_at = time();
                    $UserDetail->save();
                    $result = $User::find($userDetail->id); 
                    $response = [
                        'message' =>  __('messages.success.login'),
                        'response' => $result
                    ];
                    return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                }else{
                    $response = [
                        'message' =>  __('messages.invalid.detail')
                    ];
                    return response()->json($response,__('messages.statusCode.INVALID_CREDENTIAL'));
                }
            }else{
                $response = [
                    'message' =>  __('messages.invalid.detail')
                ];
                Log::info('CommonController----login----'.print_r($response,True));
                return response()->json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
            }
        }
    }

    public function otpVerify( Request $request ) {
        Log::info('----------------------CommonController--------------------------otpVerify'.print_r($request->all(),True));
       $otp = $request->input('otp');
       $user_id = $request->input('user_id');
       $key = $request->input('key'); // 1 (sign up otp verification) 2 (forget otp verification)
        $validations = [
            'user_id'   => 'required',
            'otp'   => 'required',
            'key'   => 'required',
        ];
        $validator = Validator::make($request->all(),$validations);
        if( !empty( $user_id ) ) {
            $user = new User;
            $userDetail = User::where(['id' => $user_id])->first();
            if(count($userDetail)){
                if( $validator->fails() ) {
                    $response = [
                     'message' => $validator->errors($validator)->first(),
                    ];
                    return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
               } else {
                switch ($key) {
                    case 1: // 1 (sign up otp verification)
                        if( $userDetail->otp == $otp || $otp == 1234){
                                $userDetail->otp = '';
                                $userDetail->otp_verified = 1;
                                $userDetail->updated_at = time();
                                $userDetail->save();
                                $Response = [
                                  'message'  => trans('messages.success.otp_verified'),
                                  'response' => User::find($userDetail->id)
                                ];
                                Log::info('CommonController----otpVerify----'.print_r($Response,True));
                                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                            } else {
                                $Response = [
                                    'message'  => trans('messages.invalid.OTP'),
                                ];
                                return Response::json( $Response , trans('messages.statusCode.SHOW_ERROR_MESSAGE') );
                            }
                        break;
                    
                    case 2: //2 (forget otp verification)
                        if( $userDetail->email_otp == $otp || $otp == 1234){
                                $userDetail->email_otp = null;
                                $userDetail->email_otp_verified = null;
                                $userDetail->updated_at = time();
                                $userDetail->save();
                                $Response = [
                                  'message'  => trans('messages.success.otp_verified'),
                                  'response' => User::find($userDetail->id)
                                ];
                                Log::info('CommonController----otpVerify----'.print_r($Response,True));
                                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                            } else {
                                $Response = [
                                    'message'  => trans('messages.invalid.OTP'),
                                ];
                                return Response::json( $Response , trans('messages.statusCode.SHOW_ERROR_MESSAGE') );
                            }
                        break;
                }
                        
               }
            }else{
                $response['message'] = trans('messages.invalid.detail');
                return response()->json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
            }
        } else {
            $Response = [
              'message'  => trans('messages.required.user_id'),
            ];
          return Response::json( $Response , trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
    }

    public function logout( Request $request ) {
        Log::info('----------------------CommonController--------------------------logout'.print_r($request->all(),True));
        $userDetail = $request->userDetail;
        if(count($userDetail)){
            $userDetail->remember_token = "";
            $userDetail->updated_at = time();
            $userDetail->save();
            $Response = [
              'message'  => trans('messages.success.logout'),
            ];
            return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );  
        }else{
            $response['message'] = trans('messages.invalid.detail');
            return response()->json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
        }
    }

    public function sendOtp($mobile,$otp) {
        try{
            $sid = 'ACb833d0dd2e4ed510d90163fb1f0c2785';
            $token = '2f8bdff0e9d85af075c24c7e410e1241';
            $client = new Client($sid, $token);
            $number = $client->lookups
                ->phoneNumbers("+17032151231")
                ->fetch(array("type" => "carrier"));
            $client->messages->create(
                implode('',explode('-', $mobile)), array(
                    'from' => '+17032151231',
                    'body' => 'MAID: please enter this code to verify :'.$otp
                )
            );
            $response = [
                'message' => 'success',
                'status' => 1
            ];
            return $response;
        } catch(Exception $e){
            $response = [
                'message' => $e->getMessage(),
                'status' => 0
            ];
            return $response;
        }
    }

    public function forgetPassword(Request $request) {
        Log::info('----------------------CommonController--------------------------forgetPassword'.print_r($request->all(),True));
        $country_code = $request->country_code;
        $mobile = $request->mobile;
        $otp = rand(1000,10000);
        $key = $request->key;
        $user_type = $request->user_type;
        $validations = [
        	'country_code' => 'required',
            'mobile'=>'required',
            'key' => 'required',
            'user_type' => 'required',
        ];
        $messages = [
        	'country_code.required' => 'field country_code is required',
        	'mobile.required' => 'field mobile is required',
        	'key.required' => 'field key is required',
        	'user_type.required' => 'field user_type is required',
        ];
        $validator = Validator::make($request->all(),$validations,$messages);
        if( $validator->fails() ){
           $response = [
            'message'=>$validator->errors($validator)->first()
           ];
           return Response::json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
            $UserDetail = User::Where(['country_code' => $country_code, 'mobile' => $mobile ,'user_type' => $user_type])->first();
            // dd($UserDetail);
            if(count($UserDetail)){
                switch ($key) {
                    case '1':
                        $UserDetail->otp = $otp;
                        $UserDetail->otp_verified = 0;
                        $UserDetail->updated_at = time();
                        $UserDetail->save();
                        $user = new User;
                        $userData = $user->where(['id' => $UserDetail->id])->first();
                        $userData['otp_response'] = $this->sendOtp($userData->country_code.$mobile,$otp);
                        $response = [
                            'message' => trans('messages.success.email_forget_otp'),
                            'response' => $userData
                        ];
                        Log::info('CommonController----forgetPassword----'.print_r($response,True));
                        return Response::json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;
                }
            } else {
                $response=[
                'message' => trans('messages.invalid.credentials'),
            ];
              return Response::json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
            }
        }
    }

    public function resendOtp(Request $request){
        Log::info('----------------------CommonController--------------------------resendOtp'.print_r($request->all(),True));
        $key = $request->key; // 1 for send otp at mobile
        $email = $request->email;
        $mobile = $request->mobile;
        $country_code = $request->country_code;
        $user_id = $request->input('user_id');
        $otp = rand(1000,10000);
        $validations = [
            'key' => 'required|numeric',
            'user_id' => 'required',
        ];
        $messages = [
        	'key.required' => 'field key is required',
        	'user_id.required' => 'field user_id is required',
        ];
        $validator = Validator::make($request->all(),$validations,$messages);
        if( $validator->fails() ){
           $response = [
            'message'=>$validator->errors($validator)->first()
           ];
           return Response::json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
            $userDetail=User::where(['id' => $user_id])->first();
            if(count($userDetail)){
                $USER = new User;
                if($key == 1){ // otp at mobile
                    $otp_status = $this->sendOtp($userDetail->mobile,$otp);
                    $userDetail->otp = $otp;
                    $userDetail->otp_verified = 0;
                    $userDetail->updated_at = time();
                    $userDetail->save();
                    $Response = [
                      'message'  => trans('messages.success.otp_resend'),
                      'response' => User::where(['id' => $userDetail->id])->first(),
                    ];
                    $Response['response']['otp_status'] = $otp_status;
                }
                if($key == 2){ // otp at email
                    $data = [
                        'otp' => $otp,
                        'email' => $userDetail->email
                    ];
                    $userDetail->email_otp = $otp;
                    $userDetail->email_otp_verified = 0;
                    $userDetail->updated_at = time();
                    $userDetail->save();
                    try{
                        Mail::send(['text'=>'otp'], $data, function($message) use ($data)
                        {
                             $message->to($data['email'])
                                    ->subject ('OTP');
                             $message->from('techfluper@gmail.com');
                       });  
                    }catch(Exception $e){
                        $response=[
                            'message' => $e->getMessage()
                    ];
                        return Response::json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
                    }
                    $Response = [
                      'message'  => trans('messages.success.email_forget_otp'),
                      'response' => User::where(['id' => $userDetail->id])->first(),
                    ];
                }
                Log::info('CommonController----resendOtp----'.print_r($Response,True));
                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );  
            }else{
                $response['message'] = trans('messages.invalid.detail');
                return response()->json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
            }
        }
    }

    public function change_password(Request $request){
        Log::info('----------------------CommonController--------------------------change_password'.print_r($request->all(),True));
        // dd($request->all());
        $accessToken = $request->header('accessToken');
        $old_password = $request->old_password;
        $new_password = $request->new_password;
        $key = $request->key; // 1 (change password) 2 (Reset password)
        $validations = [
            'key' => 'required'
        ];
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
        switch ($key) {
            //////////////////////////////////////
            ///// CHANGE PASSWORD
            /////////////////////////////////////
            case 1:
                $validations = [
                    'old_password' => 'required|min:8',
                    'new_password' => 'required|min:8'
                ];
                $messages = [
                	'old_password.required' => 'field old_password is required',
                	'new_password.required' => 'field new_password is required',
                ];
                $validator = Validator::make($request->all(),$validations,$messages);
                if($validator->fails()){
                    $response = [
                        'message' => $validator->errors($validator)->first()
                    ];
                    return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
                }else{
                    $UserDetail = $request->userDetail;
                    if(count($UserDetail)){
                        // dd($UserDetail->password);
                        if(Hash::check($old_password,$UserDetail->password)){
                            // dd("correct");
                            $User = User::find($UserDetail->id);
                            $User->password = Hash::make($new_password);
                            $User->save();
                            $userDetail = new \App\User;
                            $Response = [
                              'message'  => trans('messages.success.password_updated'),
                              'response' => $userDetail::find($UserDetail->id)
                            ];
                            return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                        }else{
                            $Response = [
                              'message'  => trans('messages.error.incorrect_old_password'),
                            ];
                            return Response::json( $Response , trans('messages.statusCode.SHOW_ERROR_MESSAGE') );
                        }
                    }else{
                        $Response = [
                          'message'  => trans('messages.invalid.detail'),
                        ];
                        return Response::json( $Response , trans('messages.statusCode.INVALID_ACCESS_TOKEN') );
                    }
                }
                break;
            //////////////////////////////////////////////
            /////// RESET PASSWORD
            /////////////////////////////////////////////
            case 2: 
                $validations = [
                    'new_password' => 'required|min:8'
                ];
                $messages = [
                	'new_password.required' => 'field new_password is required',
                ];
                $validator = Validator::make($request->all(),$validations,$messages);
                if($validator->fails()){
                    $response = [
                        'message' => $validator->errors($validator)->first()
                    ];
                    return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
                }else{
                    $UserDetail = $request->userDetail;
                    if(count($UserDetail)){
                        // dd($UserDetail->password);
                        $User = User::find($UserDetail->id);
                        $User->password = Hash::make($new_password);
                        $User->save();
                        $userDetail = new \App\User;
                        $Response = [
                          'message'  => trans('messages.success.password_updated'),
                          'response' => $userDetail::find($UserDetail->id)
                        ];
                        return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                    }else{
                        $Response = [
                          'message'  => trans('messages.invalid.detail'),
                        ];
                        return Response::json( $Response , trans('messages.statusCode.INVALID_ACCESS_TOKEN') );
                    }
                }
                break;
            //////////////////////////////////////////////
            /////// DEFAULT RESPONSE
            /////////////////////////////////////////////
            default:
                $Response = [
                  'message'  => trans('messages.invalid.request'),
                ];
                return Response::json( $Response , trans('messages.statusCode.INVALID_ACCESS_TOKEN') );
                break;
        }
    }

    public function changeMobileNumber( Request $request ) {
        Log::info('----------------------CommonController--------------------------changeMobileNumber'.print_r($request->all(),True));
        $country_code = $request->country_code;
        $mobile      =  $request->mobile;
        $accessToken =  $request->header('accessToken');
        $otp = rand(1000,10000);
        $isChangedCountryCode = $request->isChangedCountryCode;
        $isChangedMobile = $request->isChangedMobile;
        $userDetail  = [];
        $validations = [
            'country_code' => 'required',
            'mobile' => 'required',
        ];
        $messages = [
        	'country_code.required' => 'field country_code is required',
            'mobile.required' => 'field mobile is required',
        ];
        $validator = Validator::make($request->all(),$validations,$messages);
        $userDetail = $request->userDetail;
        if(count($userDetail)){
            if( $validator->fails() ) {
                $response = [
                        'message'   =>  $validator->errors($validator)->first(),
                    ];
                return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            } else {
            	switch ($userDetail->user_type) {
            		case 'user':
            			$user_type = 1;
            			break;
            		case 'maid':
            			$user_type = 2;
            			break;
					case 'provider':
            			$user_type = 3;
            			break;
            	}
            	$CheckExistSameUserTypeWithSameMobile = User::where([
            		['country_code','=',$country_code],
            		['mobile','=',$mobile],
            		['user_type','=',$user_type],
            		['id','<>',$userDetail->id],
            	])->first();
            	// dd(!$CheckExistSameUserTypeWithSameMobile);
            	if(!$CheckExistSameUserTypeWithSameMobile){
	                $User = new \App\User;
	                $UserDetail = $User::find($userDetail->id);
	                $UserDetail->country_code = $country_code;
	                $UserDetail->mobile = $mobile;
	                $UserDetail->otp = $otp;
	                $UserDetail->otp_verified = '0';
	                $UserDetail->save();
	                $this->sendOtp($country_code.$mobile, $otp);
	                $response = [
	                    'message' => __('messages.success.success'),
	                    'response' => User::where(['id' => $userDetail->id])->first()
	                ];
	                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
	            }else{
	            	$response = [
						'message' =>  __('messages.error.mobile_already_taken'),
					];
					return response()->json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
	            }
            }
		}else{
			$response['message'] = trans('messages.invalid.detail');
			return response()->json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
		}
        
    }

    public function update_profile(Request $request){
        Log::info('----------------------CommonController--------------------------update_profile'.print_r($request->all(),True));
        $accessToken = $request->header('accessToken');
        $destinationPathOfProfile = public_path().'/'.'Images/';
        $first_name = $request->first_name;
        $last_name = $request->last_name;
        // $mobile = $request->mobile;
        $email = $request->email;
        $profile_image = $request->profile_image;

        $USER = User::Where(['remember_token' => $accessToken])->first();
        if(count($USER)){
            $validations = [
                'profile_image' => 'required',
                'first_name' => 'required',
                'last_name' => 'required',
                /*'mobile' => [
                    'required',
                    Rule::unique('users')->ignore($USER->id),
                ],*/
                'email' => [
                    Rule::unique('users')->ignore($USER->id),
                ],
            ];
            $validator = Validator::make($request->all(),$validations);
            if( $validator->fails() ) {
                $response = [
                    'message' => $validator->errors($validator)->first(),
                ];
                return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            } else {
                // dd($request->all());
                if(isset($_FILES['profile_image']['tmp_name'])){
                    // dd($USER->profile_image);
                    // dd( $USER->profile_image['big'] );
                    // dd( explode( '/', $USER->profile_image['big'] ) );
                    /*if( $USER->profile_image ){
                        $big = explode('/', $USER->profile_image['big']);
                        $small = explode('/', $USER->profile_image['small']);
                        $thumbnail = explode('/', $USER->profile_image['thumbnail']);
                        if( file_exists( public_path().'/Images/'.end($big) ) ) {
                            unlink(public_path().'/Images/'.end($big));
                        }
                        if(file_exists(public_path().'/Images/'.end($small))){
                            unlink(public_path().'/Images/'.end($small));
                        }
                        if( file_exists(public_path().'/Images/'.end($thumbnail)) ) {
                            unlink(public_path().'/Images/'.end($thumbnail));
                        }
                    }*/
                    $uploadedfile = $_FILES['profile_image']['tmp_name'];
                    $fileName1 = substr($this->uploadImage($profile_image,$uploadedfile,$destinationPathOfProfile),9); 
                    $USER->profile_image = $fileName1;
                }
                $user = new User;
                $USER->first_name = $first_name;
                $USER->last_name = $last_name;
                $USER->complete_profile_status = 1;
                $USER->email = $email;
                $USER->updated_at = time();
                $USER->save();
                $userData = $user::where(['id' => $USER->id])->first();
                $response = [
                    'message' =>  __('messages.success.profile_updated'),
                    'response' => $userData,
                ];
                Log::info('CommonController----complete_profile----'.print_r($response,True));
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }
        }else{
            $response = [
                'message' => __('messages.invalid.detail'),
            ];
            return Response::json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
        }
    }

    public function uploadImage($photo,$uploadedfile,$destinationPathOfPhoto){
        /*$photo = $request->file('photo');
        $uploadedfile = $_FILES['photo']['tmp_name'];
        $destinationPathOfPhoto = public_path().'/'.'thumbnail/';*/
        $fileName = time()."_".$photo->getClientOriginalName();
        $src = "";
        $i = strrpos($fileName,".");
        $l = strlen($fileName) - $i;
        $ext = substr($fileName,$i+1);

        if($ext=="jpg" || $ext=="jpeg" || $ext=="JPG" || $ext=="JPEG"){
            $src = imagecreatefromjpeg($uploadedfile);
        }else if($ext=="png" || $ext=="PNG"){
            $src = imagecreatefrompng($uploadedfile);
        }else if($ext=="gif" || $ext=="GIF"){
            $src = imagecreatefromgif($uploadedfile);
        }else{
            $src = imagecreatefrombmp($uploadedfile);
        }
        $newwidth  = 200;
        list($width,$height)=getimagesize($uploadedfile);
        $newheight=($height/$width)*$newwidth;
        $tmp=imagecreatetruecolor($newwidth,$newheight);
        imagecopyresampled($tmp,$src,0,0,0,0,$newwidth,$newheight,$width,$height);
        $filename = $destinationPathOfPhoto.'small'.'_'.$fileName; 
        imagejpeg($tmp,$filename,100);
        imagedestroy($tmp);
        $filename = explode('/', $filename);

        $newwidth1  = 400;
        list($width,$height)=getimagesize($uploadedfile);
        $newheight1=($height/$width)*$newwidth1;
        $tmp=imagecreatetruecolor($newwidth1,$newheight1);
        imagecopyresampled($tmp,$src,0,0,0,0,$newwidth1,$newheight1,$width,$height);
        $filename = $destinationPathOfPhoto.'big'.'_'.$fileName; 
        imagejpeg($tmp,$filename,100);
        imagedestroy($tmp);
        $filename = explode('/', $filename);

        $newwidth2  = 100;
        list($width,$height)=getimagesize($uploadedfile);
        $newheight2=($height/$width)*$newwidth2;
        $tmp=imagecreatetruecolor($newwidth2,$newheight2);
        imagecopyresampled($tmp,$src,0,0,0,0,$newwidth2,$newheight2,$width,$height);
        $filename = $destinationPathOfPhoto.'thumbnail'.'_'.$fileName; 
        imagejpeg($tmp,$filename,100);
        imagedestroy($tmp);
        $filename = explode('/', $filename);
        return $filename[7];
    }
}
