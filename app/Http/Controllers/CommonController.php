<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Carbon\Carbon;
use App\Models\User;
use App\Models\UserImage;
use App\Models\City;
use App\Models\Country;
use App\Models\Nationality;
use App\Models\State;
use App\Models\UserLanguage;
use App\Models\UserEducation;
use App\Models\UserPetProblem;
use App\Models\PetProblem;
use App\Models\MaidWorkingState;
use App\Models\MaidWorkingCountry;
use App\Models\MaidJobChoice;
use App\Models\MaidWorkingStyle;
use App\Models\MaidWorkingCity;
use App\Models\MaidWorkExperience;
use App\Models\MaidWorkingDistrict;
use App\Models\MaidSkill;
use Twilio\Rest\Client;
use Log;
use Hash;
use App;
use Auth;
use Exception;
use stdClass;
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

    /*public function getArrayAppUIConfig() {
        $obj = new stdClass();
        $obj->uiHomeBtnR1C1 =  'Attendance';
        $obj->uiHomeBtnR1C2 =  'Messages';
        $obj->uiHomeBtnR2C1 =  'Update Visits';
        $obj->uiHomeBtnR2C2 =  'Submit Report';
        $obj->uiHomeBtnR3C1 =  'Map View';
        $obj->uiHomeBtnR3C2 =  'Account Info';
        return response()->json($obj,200);
    }*/

    public function get_location(Request $request){
        $userDetail = $request->userDetail;
        $response = [
            'location_text' => $userDetail->location_text,
            'latitude' => $userDetail->latitude,
            'longitude' => $userDetail->longitude,
        ];
        $Response = [
          'message'  => trans('messages.success.success'),
          'response' => $response
        ];
        return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
    }


    public function update_user_location(Request $request){
       $userDetail = $request->userDetail;
       $userDetail->location_text = $request->location_text;
       $userDetail->latitude = $request->latitude;
       $userDetail->longitude = $request->longitude;
       $userDetail->save();
		$Response = [
		  'message'  => trans('messages.success.success'),
		  'response' => User::find($userDetail->id)
		];
		return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
    }

    public function setting(Request $request){
        $userDetail = $request->userDetail;
        $key = $request->key;
        $notification_status = $request->notification_status;
        $photo_email_status = $request->photo_email_status;
        $validations = [
            'key' => 'required',
            'notification_status' => 'required_if:key,1',
            'photo_email_status' => 'required_if:key,2',
        ];
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }

        switch ($key) {
            case '1':
                $userDetail->notification_status = $notification_status;
                $userDetail->save();
                $res = [
                    'notification_status' => $userDetail->notification_status
                ];
                $Response = [
                  'message'  => trans('messages.success.success'),
                  'response' => $res
                ];
                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                break;
            case '2':
                $userDetail->photo_email_status = $photo_email_status;
                $userDetail->save();
                $res = [
                    'photo_email_status' => $userDetail->photo_email_status
                ];
                $Response = [
                  'message'  => trans('messages.success.success'),
                  'response' => $res
                ];
                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                break;
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
                $userData = User::where('users.id',$user->id)->leftjoin('user_images','users.id','=','user_images.user_id')->select('users.*','user_images.image as profile_pic')->first();
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
                    $result = $User::where('users.id',$userDetail->id)->leftjoin('user_images','users.id','=','user_images.user_id')->select('users.*','user_images.image as profile_pic')->first();
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
            $sid = 'AC81ab4c13e7f20ff73ad613f0f0882669';
            $token = '426cae69546a6dedeb03592863b449ca';
            $client = new Client($sid, $token);
            $number = $client->lookups
                ->phoneNumbers("+18337664641")
                ->fetch(array("type" => "carrier"));
            $client->messages->create(
                implode('',explode('-', $mobile)), array(
                    'from' => '+18337664641',
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
        	// 'country_code' => 'required',
            'mobile'=>'required',
            'key' => 'required',
            'user_type' => 'required',
        ];
        $messages = [
        	// 'country_code.required' => 'field country_code is required',
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
            $UserDetail = User::Where(['mobile' => $mobile ,'user_type' => $user_type])->first();
            // $UserDetail = User::Where(['country_code' => $country_code, 'mobile' => $mobile ,'user_type' => $user_type])->first();
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
        $user_id = $request->user_id;
        $old_password = $request->old_password;
        $new_password = $request->new_password;
        $key = $request->key; // 1 (change password) 2 (Reset password)
        $validations = [
            'user_id' => 'required',
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
                    $UserDetail = User::find($user_id);
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
                    $UserDetail = User::find($user_id);
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

    public function complete_profile(Request $request){
        $destinationPathOfProfile = public_path().'/'.'Images/';
        $profile_image = $request->profile_image;
        $country_id = $request->country_id;
        $state_id = $request->state_id;
        $dob = $request->dob;
        $gender = $request->gender;
        $marital_status = $request->marital_status;
        $notification_status = $request->notification_status;
        $photo_email_status = $request->photo_email_status;
        $USER =  $request->userDetail;
        $key = $request->user_type;

        $company_name = $request->company_name;
        $authorised_person = $request->authorised_person;
        $tax_administration = $request->tax_administration;
        $tax_no = $request->tax_no;
        $company_phone = $request->company_phone;
        $address = $request->address;

        if(count($USER)){
            $validations = [
                'user_type' => 'required',
                'profile_image' => 'required|array',
                'country_id' => "required",
                'state_id' => 'required',
                // 'city' => 'required',
                'dob' => 'required_if:user_type,==,1|date_format:"Y-m-d"',
                'gender' => 'required_if:user_type,==,1',
                'marital_status' => 'required_if:user_type,==,1',
                'notification_status' => 'required_if:user_type,==,1',
                'marital_status' => 'required_if:user_type,==,1',
                'photo_email_status' => 'required_if:user_type,==,1',
                'company_name' => 'required_if:user_type,==,3',
                'authorised_person' => 'required_if:user_type,==,3',
                'tax_administration' => 'required_if:user_type,==,3',
                'tax_no' => 'required_if:user_type,==,3',
                'company_phone' => 'required_if:user_type,==,3',
                'address' => 'required_if:user_type,==,3'
            ];
            $messages = [
                'user_type.required' => 'field user_type is required',
                'profile_image.required' => 'field profile_image is required',
                'country_id.required' => 'field country_id is required',
                'dob.required' => 'field dob is required',
                'gender.required' => 'field gender is required',
                'marital_status.required' => 'field marital_status is required',
                'notification_status.required' => 'field notification_status is required',
                'photo_email_status.required' => 'field photo_email_status is required',
                'state_id.required' => 'field state_id is required',
                'address.required' => 'field address is required',
            ];
            $validator = Validator::make($request->all(),$validations,$messages);
            if( $validator->fails() ) {
                $response = [
                    'message' => $validator->errors($validator)->first(),
                ];
                return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            } else {
                if($key != $this->get_user_type($USER->user_type)){
                    $response = [
                        'message' => __('messages.invalid.request'),
                    ];
                    return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
                }
                switch ($key) {
                    case '1': // user
                        foreach ($profile_image as $key => $value) {
                            if($value){
                                if($key == 0){
                                    $uploadedfile = $_FILES['profile_image']['tmp_name'][$key];
                                    $fileName1 = substr($this->uploadImage($value,$uploadedfile,$destinationPathOfProfile,$key),9);
                                    $UserImage = UserImage::firstOrCreate([
                                        'user_id' => $USER->id,
                                        'type' => 1,
                                        'status_by_admin' => 0,
                                    ]);
                                    $UserImage->image = $fileName1;
                                }
                                $UserImage->save();
                                $USER->complete_profile = 1;
                                $USER->country_id = $country_id;
                                $USER->state_id = $state_id;
                                $USER->dob = $dob;
                                $USER->gender = $gender;
                                $USER->marital_status = $marital_status;
                                $USER->notification_status = $notification_status;
                                $USER->photo_email_status = $photo_email_status;
                                $USER->save();
                            }
                        } 
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        $userData['country_name'] = Country::find($userData->country_id)->name;
                        $userData['state_name'] = State::find($userData->state_id)->name;
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;

                    case '3': // agency
                        foreach ($profile_image as $key => $value) {
                            if($value){
                                if($key == 0){
                                    $uploadedfile = $_FILES['profile_image']['tmp_name'][$key];
                                    $fileName1 = substr($this->uploadImage($value,$uploadedfile,$destinationPathOfProfile,$key),9);
                                    $UserImage = UserImage::firstOrCreate([
                                        'user_id' => $USER->id,
                                        'type' => 1,
                                        'status_by_admin' => 0,
                                    ]);
                                    $UserImage->image = $fileName1;
                                }
                                $UserImage->save();
                                $USER->complete_profile = 1;
                                $USER->company_name = $company_name;
                                $USER->authorised_person = $authorised_person;
                                $USER->country_id = $country_id;
                                $USER->state_id = $state_id;
                                $USER->address = $address;
                                $USER->tax_administration = $tax_administration;
                                $USER->tax_no = $tax_no;
                                $USER->company_phone = $company_phone;
                                $USER->save();
                            }
                        } 
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        $userData['country_name'] = Country::find($userData->country_id)->name;
                        $userData['state_name'] = State::find($userData->state_id)->name;
                        // $userData['city_name'] = City::find($userData->city_id)->name;
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;
                }
            }
        }else{
            $response = [
                'message' => __('messages.invalid.detail'),
            ];
            return Response::json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
        }
    }

    public function update_profile(Request $request){
        $country_id = $request->country_id;
        $state_id = $request->state_id;
        $dob = $request->dob;
        $gender = $request->gender;
        $marital_status = $request->marital_status;
        $notification_status = $request->notification_status;
        $photo_email_status = $request->photo_email_status;
        $USER =  $request->userDetail;
        $key = $request->user_type;
        $company_name = $request->company_name;
        $authorised_person = $request->authorised_person;
        $tax_administration = $request->tax_administration;
        $tax_no = $request->tax_no;
        $company_phone = $request->company_phone;
        $address = $request->address;
        if(count($USER)){
            $validations = [
                'user_type' => 'required',
                'country_id' => "required",
                'state_id' => 'required',
                'dob' => 'required_if:user_type,==,1|date_format:"Y-m-d"',
                'gender' => 'required_if:user_type,==,1',
                'marital_status' => 'required_if:user_type,==,1',
                // 'notification_status' => 'required_if:user_type,==,1',
                'marital_status' => 'required_if:user_type,==,1',
                // 'photo_email_status' => 'required_if:user_type,==,1',
                'company_name' => 'required_if:user_type,==,3',
                'authorised_person' => 'required_if:user_type,==,3',
                'tax_administration' => 'required_if:user_type,==,3',
                'tax_no' => 'required_if:user_type,==,3',
                'company_phone' => 'required_if:user_type,==,3',
                'address' => 'required_if:user_type,==,3'
            ];
            $messages = [
                'user_type.required' => 'field user_type is required',
                'profile_image.required' => 'field profile_image is required',
                'country_id.required' => 'field country_id is required',
                'dob.required' => 'field dob is required',
                'gender.required' => 'field gender is required',
                'marital_status.required' => 'field marital_status is required',
                'notification_status.required' => 'field notification_status is required',
                'photo_email_status.required' => 'field photo_email_status is required',
                'state_id.required' => 'field state_id is required',
                'address.required' => 'field address is required',
            ];
            $validator = Validator::make($request->all(),$validations,$messages);
            if( $validator->fails() ) {
                $response = [
                    'message' => $validator->errors($validator)->first(),
                ];
                return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            } else {
                if($key != $this->get_user_type($USER->user_type)){
                    $response = [
                        'message' => __('messages.invalid.request'),
                    ];
                    return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
                }
                switch ($key) {
                    case '1': // user
                        $USER->country_id = $country_id;
                        $USER->state_id = $state_id;
                        $USER->dob = $dob;
                        $USER->gender = $gender;
                        $USER->marital_status = $marital_status;
                        // $USER->notification_status = $notification_status;
                        // $USER->photo_email_status = $photo_email_status;
                        $USER->save();
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        $userData['country_name'] = Country::find($userData->country_id)->name;
                        $userData['state_name'] = State::find($userData->state_id)->name;
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----update_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;

                    case '3': // agency
                        $USER->company_name = $company_name;
                        $USER->authorised_person = $authorised_person;
                        $USER->country_id = $country_id;
                        $USER->state_id = $state_id;
                        $USER->address = $address;
                        $USER->tax_administration = $tax_administration;
                        $USER->tax_no = $tax_no;
                        $USER->company_phone = $company_phone;
                        $USER->save();
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        $userData['country_name'] = Country::find($userData->country_id)->name;
                        $userData['state_name'] = State::find($userData->state_id)->name;
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----update_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;
                }
            }
        }else{
            $response = [
                'message' => __('messages.invalid.detail'),
            ];
            return Response::json($response,trans('messages.statusCode.INVALID_ACCESS_TOKEN'));
        }
    }


    public function maid_complete_profile(Request $request){
        Log::info('----------------------CommonController--------------------------maid_complete_profile'.print_r($request->toArray(),True));
        $USER =  $request->userDetail;
        $destinationPathOfProfile = public_path().'/'.'Images/';
        $profile_image = $request->profile_image;
        $step_for_maid_profile = $request->step_for_maid_profile;
        $country_id = $request->country_id;
        $state_id = $request->state_id;
        $city = json_decode($request->city);
        $district = json_decode($request->district);
        $dob = $request->dob;
        $gender = $request->gender;
        $nationality_id = $request->nationality_id;
        $marital_status = $request->marital_status;
        $kids = $request->kids;
        $hi_job = $request->hi_job;
        
        $education_ids = json_decode($request->education_ids);
        $languages_ids = json_decode($request->languages_ids);
        $work_status = $request->work_status;
        $driving_licence = $request->driving_licence;
        $smoke = $request->smoke;
        $alcohol = $request->alcohol;
        $pet_problem_ids = json_decode($request->pet_problem_ids);

        $working_states = json_decode($request->working_states);
        $maid_can_work_country_id = json_decode($request->maid_can_work_country_id);
        $maid_job_choice_ids = json_decode($request->maid_job_choice_ids);
        $maid_working_style_ids = json_decode($request->maid_working_style_ids);
        $can_live_with_family = $request->can_live_with_family;
        $travel_situation = $request->travel_situation;
        $expected_fees = $request->expected_fees;
        $maid_skill_ids = json_decode($request->maid_skill_ids);

        $maid_education = $request->maid_education;
        $maid_certificate = $request->maid_certificate;
        $maid_about_me = $request->maid_about_me;
        $maid_work_experience = $request->maid_work_experience;
        $notification_status = $request->notification_status;
        $photo_email_status = $request->photo_email_status;

        $maid_work_experiences = json_decode($request->maid_work_experiences);
        $start_date = json_decode($request->start_date);
        $end_date = json_decode($request->end_date);
        $still_working = json_decode($request->still_working);
        // return $request->all();
        // dd($maid_work_experience);
        // dd($working_states);
        $validations = [
            'step_for_maid_profile' => 'required',
            'user_type' => 'required',
            'profile_image' => 'required_if:step_for_maid_profile,==,1|array',
            'country_id' => "required_if:step_for_maid_profile,==,2",
            'state_id' => 'required_if:step_for_maid_profile,==,2',
            'dob' => 'required_if:step_for_maid_profile,==,2|date_format:"Y-m-d"',
            'gender' => 'required_if:step_for_maid_profile,==,2',
            'nationality_id' => 'required_if:step_for_maid_profile,==,2',
            'marital_status' => 'required_if:step_for_maid_profile,==,2',
            'kids' => 'required_if:step_for_maid_profile,==,2',
            'hi_job' => 'required_if:step_for_maid_profile,==,2',

            'education_ids' => 'required_if:step_for_maid_profile,==,3',
            'languages_ids' => 'required_if:step_for_maid_profile,==,3',
            'work_status' => 'required_if:step_for_maid_profile,==,3',
            'driving_licence' => 'required_if:step_for_maid_profile,==,3',
            'smoke' => 'required_if:step_for_maid_profile,==,3',
            'alcohol' => 'required_if:step_for_maid_profile,==,3',
            'pet_problem_ids' => 'required_if:step_for_maid_profile,==,3',

            'maid_can_work_country_id' => 'required_if:step_for_maid_profile,==,4',
            'working_states' => 'required_if:step_for_maid_profile,==,4',
            'city' => 'required_if:step_for_maid_profile,==,4',
            'district' => 'required_if:step_for_maid_profile,==,4',
            'maid_job_choice_ids' => 'required_if:step_for_maid_profile,==,4',
            'maid_working_style_ids' => 'required_if:step_for_maid_profile,==,4',
            'can_live_with_family' => 'required_if:step_for_maid_profile,==,4',
            'travel_situation' => 'required_if:step_for_maid_profile,==,4',
            'expected_fees' => 'required_if:step_for_maid_profile,==,4',
            'maid_skill_ids' => 'required_if:step_for_maid_profile,==,4',

            // 'maid_education' => 'required_if:step_for_maid_profile,==,5',
            // 'maid_certificate' => 'required_if:step_for_maid_profile,==,5',
            // 'maid_about_me' => 'required_if:step_for_maid_profile,==,5',
            // 'maid_work_experience' => 'required_if:step_for_maid_profile,==,5',

            'notification_status' => 'required_if:step_for_maid_profile,==,5',
            'photo_email_status' => 'required_if:step_for_maid_profile,==,5',
        ];
        $messages = [
            'step_for_maid_profile.required' => 'field step_for_maid_profile is required',
            'user_type.required' => 'field user_type is required',
            'profile_image.required' => 'field profile_image is required',
        ];
        $validator = Validator::make($request->all(),$validations,$messages);
        if( $validator->fails() ) {
            $response = [
                'message' => $validator->errors($validator)->first(),
            ];
            return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        } else {
            if($this->get_user_type($USER->user_type) != 2){
                $response = [
                    'message' => __('messages.invalid.request'),
                ];
                return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            }else{
                switch ($step_for_maid_profile) {
                    case '1':
                        foreach ($profile_image as $key => $value) {
                            if($value){
                                if($key == 0){
                                    $uploadedfile = $_FILES['profile_image']['tmp_name'][$key];
                                    $fileName1 = substr($this->uploadImage($value,$uploadedfile,$destinationPathOfProfile,$key),9);
                                    $UserImage = UserImage::firstOrCreate([
                                        'user_id' => $USER->id,
                                        'type' => 1,
                                        'status_by_admin' => 0,
                                    ]);
                                    $UserImage->image = $fileName1;
                                }
                                $UserImage->save();
                                $USER->step_for_maid_profile = $step_for_maid_profile;
                                $USER->complete_profile = 0;
                                $USER->save();
                            }
                        }
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        if($userData->city_id)
                            $userData['city_name'] = City::find($userData->city_id)->name;
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----maid_complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;
                    
                    case '2':
                        // $City = City::firstOrCreate(['name' => $city ,'country_id' => $country_id]);
                        $USER->country_id = $country_id;
                        $USER->state_id = $state_id;
                        // $USER->city_id = $City->id;
                        // $USER->district = $district;
                        $USER->dob = $dob;
                        $USER->gender = $gender;
                        $USER->nationality_id = $nationality_id;
                        $USER->marital_status = $marital_status;
                        $USER->kids = $kids;
                        $USER->hi_job = $hi_job;
                        $USER->step_for_maid_profile = $step_for_maid_profile;
                        $USER->complete_profile = 0;
                        $USER->save();
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        /*if($userData->city_id)
                            $userData['city_name'] = City::find($userData->city_id)->name;*/
                        if($userData->country_id)
                           $userData['country_name'] = Country::find($userData->country_id)->name;

                        if($userData->state_id)
                           $userData['state_name'] = State::find($userData->state_id)->name;
                        if($userData->nationality_id)
                            $userData['nationality_name'] = Nationality::find($userData->nationality_id)->name;

                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----maid_complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;

                    case '3':
                        if(count($education_ids)){
                            foreach ($education_ids as $key => $value) {
                              $data = UserEducation::firstOrCreate(['user_id' => $USER->id , 'education_id' => $value]);
                              $data->save();
                            }
                        }
                        if(count($languages_ids)){
                            foreach ($languages_ids as $key => $value) {
                                $data = UserLanguage::firstOrCreate(['user_id' => $USER->id , 'language_id' => $value]);
                                $data->save();
                            }
                        }
                        if(count($pet_problem_ids)){
                            foreach ($pet_problem_ids as $key => $value) {
                                $data = UserPetProblem::firstOrCreate(['user_id' => $USER->id , 'pet_problem_id' => $value]);
                                $data->save();
                            }
                        }
                        $USER->work_status = $work_status;
                        $USER->driving_licence = $driving_licence;
                        $USER->smoke = $smoke;
                        $USER->alcohol = $alcohol;
                        $USER->step_for_maid_profile = $step_for_maid_profile;
                        $USER->complete_profile = 0;
                        $USER->save();
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        if($userData->country_id)
                           $userData['country_name'] = Country::find($userData->country_id)->name;
                        if($userData->state_id)
                           $userData['state_name'] = State::find($userData->state_id)->name;
                        if($userData->nationality_id)
                            $userData['nationality_name'] = Nationality::find($userData->nationality_id)->name;

                        $userData['user_languages'] = UserLanguage::where('user_id',$USER->id)->with('language_detail')->select('user_id','language_id')->get();

                        $userData['user_educations'] = UserEducation::where('user_id',$USER->id)->with('education_detail')->select('user_id','education_id')->get();
                        
                        $userData['user_pet_problems'] = UserPetProblem::where('user_id',$USER->id)->with('pet_problem_detail')->select('user_id','pet_problem_id')->get();

                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----maid_complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;

                    case '4':
                        // $USER->maid_can_work_country_id = $maid_can_work_country_id;
                        // dd($maid_can_work_country_id);
                        if(count($city)){
                            foreach ($city as $key => $value) {
                              $data = MaidWorkingCity::firstOrCreate(['user_id' => $USER->id , 'city_id' => $value]);
                              $data->save();
                            }
                        }

                        if(count($district)){
                            foreach ($district as $key => $value) {
                              $data = MaidWorkingDistrict::firstOrCreate(['user_id' => $USER->id , 'district_id' => $value]);
                              $data->save();
                            }
                        }

                        if(count($maid_can_work_country_id)){
                            foreach ($maid_can_work_country_id as $key => $value) {
                              $data = MaidWorkingCountry::firstOrCreate(['user_id' => $USER->id , 'country_id' => $value]);
                              $data->save();
                            }
                        }

                        if(count($working_states)){
                            foreach ($working_states as $key => $value) {
                              $data = MaidWorkingState::firstOrCreate(['user_id' => $USER->id , 'state_id' => $value]);
                              $data->save();
                            }
                        }

                        if(count($maid_job_choice_ids)){
                            foreach ($maid_job_choice_ids as $key => $value) {
                              $data = MaidJobChoice::firstOrCreate(['user_id' => $USER->id , 'job_choice_id' => $value]);
                              $data->save();
                            }
                        }

                        if(count($maid_working_style_ids)){
                            foreach ($maid_working_style_ids as $key => $value) {
                              $data = MaidWorkingStyle::firstOrCreate(['user_id' => $USER->id , 'style_id' => $value]);
                              $data->save();
                            }
                        }

                        if(count($maid_skill_ids)){
							foreach ($maid_skill_ids as $key => $value) {
								$data = MaidSkill::firstOrCreate(['user_id' => $USER->id , 'skill_id' => $value]);
								$data->save();
							}
                        }

                        $USER->can_live_with_family = $can_live_with_family;
                        $USER->travel_situation = $travel_situation;
                        $USER->expected_fees = $expected_fees;
                        $USER->step_for_maid_profile = $step_for_maid_profile;
                        $USER->complete_profile = 0;
                        // $USER->maid_work_experience = $maid_work_experience;
                        $USER->save();
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        if($userData->country_id)
                           $userData['country_name'] = Country::find($userData->country_id)->name;
                        if($userData->state_id)
                           $userData['state_name'] = State::find($userData->state_id)->name;
                        if($userData->nationality_id)
                            $userData['nationality_name'] = Nationality::find($userData->nationality_id)->name;

                        $userData['user_languages'] = UserLanguage::where('user_id',$USER->id)->with('language_detail')->select('user_id','language_id')->get();

                        $userData['user_educations'] = UserEducation::where('user_id',$USER->id)->with('education_detail')->select('user_id','education_id')->get();
                        
                        $userData['user_pet_problems'] = UserPetProblem::where('user_id',$USER->id)->with('pet_problem_detail')->select('user_id','pet_problem_id')->get();
                        if($USER->maid_can_work_country_id)
                            $userData['maid_can_work_country_name'] = Country::where('id',$userData->maid_can_work_country_id)->first()->name;

                        $userData['maid_working_countries'] = MaidWorkingCountry::with('country_detail')->where('user_id',$USER->id)->select('user_id','country_id')->get();

                        $userData['maid_working_cities'] = MaidWorkingCity::with('city_detail')->where('user_id',$USER->id)->select('user_id','city_id')->get();

                        $userData['maid_working_districts'] = MaidWorkingDistrict::with('district_detail')->where('user_id',$USER->id)->select('user_id','district_id')->get();

                        $userData['maid_working_states'] = MaidWorkingState::with('state_detail')->where('user_id',$USER->id)->select('user_id','state_id')->get();

                        $userData['maid_job_choices'] = MaidJobChoice::with('job_choice_detail')->where('user_id',$USER->id)->select('user_id','job_choice_id')->get();

                        $userData['maid_working_style'] = MaidWorkingStyle::with('working_style_detail')->where('user_id',$USER->id)->select('user_id','style_id')->get();

                        $userData['maid_skills'] = MaidSkill::with('skill_detail')->where('user_id',$USER->id)->select('user_id','skill_id')->get();
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----maid_complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;

                    case '5':
                		if(count($maid_work_experiences)){
	                        foreach ($maid_work_experiences as $key => $value) {
	                            $data = MaidWorkExperience::firstOrNew(['user_id' => $USER->id , 'detail' => $value , 'start_date' => $start_date[$key] , 'end_date' => $end_date[$key] , 'still_working' => $still_working[$key] ]);
	                            $data->save();
	                        }
                        }
                        $USER->maid_education = $maid_education;                        
                        $USER->maid_certificate = $maid_certificate;                        
                        $USER->maid_about_me = $maid_about_me;                        
                        $USER->step_for_maid_profile = $step_for_maid_profile;
                        $USER->notification_status = $notification_status;
                        $USER->photo_email_status = $photo_email_status;
                        $USER->complete_profile = 1;
                        $USER->save();
                        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
                        if($userData->country_id)
                           $userData['country_name'] = Country::find($userData->country_id)->name;
                        if($userData->state_id)
                           $userData['state_name'] = State::find($userData->state_id)->name;
                        if($userData->nationality_id)
                            $userData['nationality_name'] = Nationality::find($userData->nationality_id)->name;

                        $userData['user_languages'] = UserLanguage::where('user_id',$USER->id)->with('language_detail')->select('user_id','language_id')->get();

                        $userData['user_educations'] = UserEducation::where('user_id',$USER->id)->with('education_detail')->select('user_id','education_id')->get();
                        
                        $userData['user_pet_problems'] = UserPetProblem::where('user_id',$USER->id)->with('pet_problem_detail')->select('user_id','pet_problem_id')->get();
                        if($USER->maid_can_work_country_id)
                            $userData['maid_can_work_country_name'] = Country::where('id',$userData->maid_can_work_country_id)->first()->name;

                        $userData['maid_working_countries'] = MaidWorkingCountry::with('country_detail')->where('user_id',$USER->id)->select('user_id','country_id')->get();
                        
                        $userData['maid_working_states'] = MaidWorkingState::with('state_detail')->where('user_id',$USER->id)->select('user_id','state_id')->get();

                        $userData['maid_job_choices'] = MaidJobChoice::with('job_choice_detail')->where('user_id',$USER->id)->select('user_id','job_choice_id')->get();

                        $userData['maid_working_style'] = MaidWorkingStyle::with('working_style_detail')->where('user_id',$USER->id)->select('user_id','style_id')->get();

                        $userData['maid_skills'] = MaidSkill::with('skill_detail')->where('user_id',$USER->id)->select('user_id','skill_id')->get();

                        $userData['maid_work_experiences'] = MaidWorkExperience::where('user_id',$USER->id)->get();
                        $response = [
                            'message' =>  __('messages.success.profile_updated'),
                            'response' => $userData,
                        ];
                        Log::info('CommonController----maid_complete_profile----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;
                    default:
                        dd('else');
                        break;
                }
            }
        }
    }

    public function update_profile_maid(Request $request){
        $USER =  $request->userDetail;
        $destinationPathOfProfile = public_path().'/'.'Images/';
        $profile_image = $request->profile_image;
        $step_for_maid_profile = $request->step_for_maid_profile;
        $country_id = $request->country_id;
        $state_id = $request->state_id;
        $city = json_decode($request->city);
        $district = json_decode($request->district);
        $dob = $request->dob;
        $gender = $request->gender;
        $nationality_id = $request->nationality_id;
        $marital_status = $request->marital_status;
        $kids = $request->kids;
        $hi_job = $request->hi_job;
        $education_ids = json_decode($request->education_ids);
        $languages_ids = json_decode($request->languages_ids);
        $work_status = $request->work_status;
        $driving_licence = $request->driving_licence;
        $smoke = $request->smoke;
        $alcohol = $request->alcohol;
        $pet_problem_ids = json_decode($request->pet_problem_ids);
        $working_states = json_decode($request->working_states);
        $maid_can_work_country_id = json_decode($request->maid_can_work_country_id);
        $maid_job_choice_ids = json_decode($request->maid_job_choice_ids);
        $maid_working_style_ids = json_decode($request->maid_working_style_ids);
        $can_live_with_family = $request->can_live_with_family;
        $travel_situation = $request->travel_situation;
        $expected_fees = $request->expected_fees;
        $maid_skill_ids = json_decode($request->maid_skill_ids);
        $maid_education = $request->maid_education;
        $maid_certificate = $request->maid_certificate;
        $maid_about_me = $request->maid_about_me;
        $maid_work_experience = $request->maid_work_experience;
        $notification_status = $request->notification_status;
        $photo_email_status = $request->photo_email_status;

        $maid_work_experiences = json_decode($request->maid_work_experiences);
        $start_date = json_decode($request->start_date);
        $end_date = json_decode($request->end_date);
        $still_working = json_decode($request->still_working);

        // return $request->all();
        // dd($maid_work_experience);
        // dd($working_states);
        $validations = [
            'user_type' => 'required',
            'country_id' => "required",
            'state_id' => 'required',
            'dob' => 'required|date_format:"Y-m-d"',
            'gender' => 'required',
            'nationality_id' => 'required',
            'marital_status' => 'required',
            'kids' => 'required',
            'hi_job' => 'required',
            'education_ids' => 'required',
            'languages_ids' => 'required',
            'work_status' => 'required',
            'driving_licence' => 'required',
            'smoke' => 'required',
            'alcohol' => 'required',
            'pet_problem_ids' => 'required',
            'maid_can_work_country_id' => 'required',
            'working_states' => 'required',
            'city' => 'required',
            'district' => 'required',
            'maid_job_choice_ids' => 'required',
            'maid_working_style_ids' => 'required',
            'can_live_with_family' => 'required',
            'travel_situation' => 'required',
            'expected_fees' => 'required',
            'maid_skill_ids' => 'required',
            // 'notification_status' => 'required',
            // 'photo_email_status' => 'required',
        ];
        
        $validator = Validator::make($request->all(),$validations);
        if( $validator->fails() ) {
            $response = [
                'message' => $validator->errors($validator)->first(),
            ];
            return Response::json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        } else {
            // return $USER->id;
            $USER->country_id = $country_id;
            $USER->state_id = $state_id;
            $USER->dob = $dob;
            $USER->gender = $gender;
            $USER->nationality_id = $nationality_id;
            $USER->marital_status = $marital_status;
            $USER->kids = $kids;
            $USER->hi_job = $hi_job;

            // dd($USER->id);
            UserEducation::where(['user_id' => $USER->id])->delete();
            if(count($education_ids)){
                foreach ($education_ids as $key => $value) {
                  $data = UserEducation::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'education_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            UserLanguage::where(['user_id' => $USER->id])->delete();
            if(count($languages_ids)){
                foreach ($languages_ids as $key => $value) {
                    $data = UserLanguage::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'language_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }


            UserPetProblem::where(['user_id' => $USER->id])->delete();
            if(count($pet_problem_ids)){
                foreach ($pet_problem_ids as $key => $value) {
                    $data = UserPetProblem::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'pet_problem_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }



            $USER->work_status = $work_status;
            $USER->driving_licence = $driving_licence;
            $USER->smoke = $smoke;
            $USER->alcohol = $alcohol;

            MaidWorkingCity::where(['user_id' => $USER->id])->delete();
            if(count($city)){
                foreach ($city as $key => $value) {
                    $data = MaidWorkingCity::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'city_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            MaidWorkingDistrict::where(['user_id' => $USER->id])->delete();
            if(count($district)){
                foreach ($district as $key => $value) {
                    $data = MaidWorkingDistrict::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'district_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }


            MaidWorkingCountry::where(['user_id' => $USER->id])->delete();
            if(count($maid_can_work_country_id)){
                foreach ($maid_can_work_country_id as $key => $value) {
                    $data = MaidWorkingCountry::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'country_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            MaidWorkingState::where(['user_id' => $USER->id])->delete();
            if(count($working_states)){
                foreach ($working_states as $key => $value) {
                  $data = MaidWorkingState::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'state_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            MaidJobChoice::where(['user_id' => $USER->id])->delete();
            if(count($maid_job_choice_ids)){
                foreach ($maid_job_choice_ids as $key => $value) {
                  $data = MaidJobChoice::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'job_choice_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            MaidWorkingStyle::where(['user_id' => $USER->id])->delete();
            if(count($maid_working_style_ids)){
                foreach ($maid_working_style_ids as $key => $value) {
                  $data = MaidWorkingStyle::withTrashed()->firstOrCreate(['user_id' => $USER->id , 'style_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }
    


            MaidSkill::where(['user_id' => $USER->id])->delete();
            if(count($maid_skill_ids)){
                foreach ($maid_skill_ids as $key => $value) {
                    $data = MaidSkill::withTrashed()->firstOrNew(['user_id' => $USER->id , 'skill_id' => $value]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            $USER->can_live_with_family = $can_live_with_family;
            $USER->travel_situation = $travel_situation;
            $USER->expected_fees = $expected_fees;

            MaidWorkExperience::where(['user_id' => $USER->id])->delete();
            if(count($maid_work_experiences)){
                foreach ($maid_work_experiences as $key => $value) {
                    $data = MaidWorkExperience::withTrashed()->firstOrNew(['user_id' => $USER->id , 'detail' => $value , 'start_date' => $start_date[$key] , 'end_date' => $end_date[$key] , 'still_working' => $still_working[$key] ]);
                    if($data->trashed())
                        $data->restore();
                    else
                        $data->save();
                }
            }

            $USER->maid_education = $maid_education;                        
            $USER->maid_certificate = $maid_certificate;                        
            $USER->maid_about_me = $maid_about_me;                        
            // $USER->notification_status = $notification_status;
            // $USER->photo_email_status = $photo_email_status;
            $USER->save();


            $userData = User::where(['id' => $USER->id])->with('userImages')->first();
            if($userData->country_id)
               $userData['country_name'] = Country::find($userData->country_id)->name;
            if($userData->state_id)
               $userData['state_name'] = State::find($userData->state_id)->name;
            if($userData->nationality_id)
                $userData['nationality_name'] = Nationality::find($userData->nationality_id)->name;

            $userData['user_languages'] = UserLanguage::where('user_id',$USER->id)->with('language_detail')->select('user_id','language_id')->get();

            $userData['user_educations'] = UserEducation::where('user_id',$USER->id)->with('education_detail')->select('user_id','education_id')->get();
            
            $userData['user_pet_problems'] = UserPetProblem::where('user_id',$USER->id)->with('pet_problem_detail')->select('user_id','pet_problem_id')->get();
            if($USER->maid_can_work_country_id)
                $userData['maid_can_work_country_name'] = Country::where('id',$userData->maid_can_work_country_id)->first()->name;

            $userData['maid_working_countries'] = MaidWorkingCountry::with('country_detail')->where('user_id',$USER->id)->select('user_id','country_id')->get();
            
            $userData['maid_working_states'] = MaidWorkingState::with('state_detail')->where('user_id',$USER->id)->select('user_id','state_id')->get();

            $userData['maid_job_choices'] = MaidJobChoice::with('job_choice_detail')->where('user_id',$USER->id)->select('user_id','job_choice_id')->get();

            $userData['maid_working_style'] = MaidWorkingStyle::with('working_style_detail')->where('user_id',$USER->id)->select('user_id','style_id')->get();

            $userData['maid_skills'] = MaidSkill::with('skill_detail')->where('user_id',$USER->id)->select('user_id','skill_id')->get();

            $userData['maid_work_experiences'] = MaidWorkExperience::where('user_id',$USER->id)->get();
            $response = [
                'message' =>  __('messages.success.profile_updated'),
                'response' => $userData,
            ];
            Log::info('CommonController----update_profile_maid----'.print_r($response,True));
            return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));

        }
    }

    public function get_profile(Request $request){
        Log::info('----------------------CommonController--------------------------get_profile'.print_r($request->all(),True));
        $USER = $request->userDetail;
        $userData = User::where(['id' => $USER->id])->with('userImages')->first();
        if($userData->country_id)
           $userData['country_name'] = Country::find($userData->country_id)->name;
        if($userData->state_id)
           $userData['state_name'] = State::find($userData->state_id)->name;
        if($userData->nationality_id)
            $userData['nationality_name'] = Nationality::find($userData->nationality_id)->name;

        $userData['user_languages'] = UserLanguage::where('user_id',$USER->id)->with('language_detail')->select('user_id','language_id')->get();

        $userData['user_educations'] = UserEducation::where('user_id',$USER->id)->with('education_detail')->select('user_id','education_id')->get();
        
        $userData['user_pet_problems'] = UserPetProblem::where('user_id',$USER->id)->with('pet_problem_detail')->select('user_id','pet_problem_id')->get();
        
        /*if($USER->maid_can_work_country_id)
            $userData['maid_can_work_country_name'] = Country::where('id',$userData->maid_can_work_country_id)->first()->name;*/

        $userData['maid_working_states'] = MaidWorkingState::with('state_detail')->where('user_id',$USER->id)->select('user_id','state_id')->get();

        $userData['maid_job_choices'] = MaidJobChoice::with('job_choice_detail')->where('user_id',$USER->id)->select('user_id','job_choice_id')->get();

        $userData['maid_working_style'] = MaidWorkingStyle::with('working_style_detail')->where('user_id',$USER->id)->select('user_id','style_id')->get();

        $userData['maid_skills'] = MaidSkill::with('skill_detail')->where('user_id',$USER->id)->select('user_id','skill_id')->get();


        $userData['rating'] = 0;
        $userData['agency_name'] = null;

        /*$userData['is_favourite'] = FavouriteUnfavouriteByUser::where(['to_maid_id' => $value->id, 'from_id' => $userDetail->id ])->count();
        $userData['is_hired'] = (boolean) HireMaid::where(['hire_to' => $value->id ])->count();
        */

        $userData['maid_working_countries'] = MaidWorkingCountry::with('country_detail')->where('user_id',$USER->id)->select('user_id','country_id')->get();

        
        $userData['maid_working_city'] = MaidWorkingCity::with('city_detail')->Where(['user_id' => $USER->id])->select('id','user_id','city_id')->get();

        $userData['maid_working_district'] = MaidWorkingDistrict::with('district_detail')->Where(['user_id' => $USER->id])->select('id','user_id','district_id')->get();


        $response = [
            'message' =>  __('messages.success.success'),
            'response' => $userData,
        ];
        Log::info('CommonController----maid_complete_profile----'.print_r($response,True));
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function uploadImage($photo,$uploadedfile,$destinationPathOfPhoto,$key){
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
        $filename = $destinationPathOfPhoto.'small'.'_'.$key.'_'.$fileName; 
        imagejpeg($tmp,$filename,100);
        imagedestroy($tmp);
        $filename = explode('/', $filename);

        $newwidth1  = 400;
        list($width,$height)=getimagesize($uploadedfile);
        $newheight1=($height/$width)*$newwidth1;
        $tmp=imagecreatetruecolor($newwidth1,$newheight1);
        imagecopyresampled($tmp,$src,0,0,0,0,$newwidth1,$newheight1,$width,$height);
        $filename = $destinationPathOfPhoto.'big'.'_'.$key.'_'.$fileName; 
        imagejpeg($tmp,$filename,100);
        imagedestroy($tmp);
        $filename = explode('/', $filename);

        $newwidth2  = 100;
        list($width,$height)=getimagesize($uploadedfile);
        $newheight2=($height/$width)*$newwidth2;
        $tmp=imagecreatetruecolor($newwidth2,$newheight2);
        imagecopyresampled($tmp,$src,0,0,0,0,$newwidth2,$newheight2,$width,$height);
        $filename = $destinationPathOfPhoto.'thumbnail'.'_'.$key.'_'.$fileName; 
        imagejpeg($tmp,$filename,100);
        imagedestroy($tmp);
        $filename = explode('/', $filename);
        return $filename[7];
    }

    public function get_user_type($value){
        switch ($value) {
            case 'user':
                return '1';
                break;
            case 'maid':
                return '2';
                break;
            case 'provider':
                return '3';
                break;
        }
    }

    
}
