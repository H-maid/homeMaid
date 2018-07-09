<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Response;
use App\Models\City;
use App\Models\Country;
use App\Models\Nationality;
use App\Models\SuggestMaid;
use App\Models\MaidApplyAgency;
use App\Models\State;
use App\Models\RatingReview;
use App\Models\Notification;
use App\Models\JobListingTitleModel;
use App\Models\JobChoice;
use App\Models\MaidSkill;
use App\Models\UserImage;
use Carbon\Carbon;
use Hash;
use Twilio\Rest\Client;
use Log;

class AgencyController extends Controller
{
    public function list(Request $request){
        $userDetail = $request->userDetail; 
        $data = User::where(['user_type' => 3])
            ->with('userImages')->get();
        foreach ($data as $key => $value) {
            if($value->country_id)
               $data[$key]->country_name = Country::find($value->country_id)->name;
            if($value->state_id)
               $data[$key]->state_name = State::find($value->state_id)->name;
            if($value->nationality_id)
                $data[$key]->nationality_name = Nationality::find($value->nationality_id)->name;
        }

        $response = [
            'message' => __('messages.success.success'),
            'response' => $data
        ];
        return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
    }

    public function hire_maid(Request $request){
        $userDetail = $request->userDetail; 
        // return $userDetail;
        $data = User::where(['user_type' => 3])
            
            ->with('userImages')->get();

        foreach ($data as $key => $value) {
            if($value->country_id)
               $data[$key]->country_name = Country::find($value->country_id)->name;
            if($value->state_id)
               $data[$key]->state_name = State::find($value->state_id)->name;
            if($value->nationality_id)
                $data[$key]->nationality_name = Nationality::find($value->nationality_id)->name;
        }

        $response = [
            'message' => __('messages.success.success'),
            'response' => $data
        ];
        return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
    }
    
    public function fire_maid(Request $request){
    	$userDetail = $request->userDetail; 
        // return $userDetail;
        $maid_id = $request->maid_id;
        $reason_to_fire = $request->reason_to_fire;
        $validations = [
            'maid_id' => 'required',
        ];
        $message = [
            'maid_id.required' => 'field maid_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
            if($userDetail->user_type == 'provider'){
                $data = MaidApplyAgency::where([
                    'agency_id' => $userDetail->id , 
                    'maid_id' => $maid_id,
                ])->first();
                if($data){
                    if($data->fired_status == 0){
                        $data->fired_status = 1;
                        $data->reason_to_fire = $reason_to_fire;
                        $data->save();
                        $response = [
                            'message' => __('messages.success.success'),
                        ];
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                    }else{
                        $response = [
                            'message' => 'Already fired',
                        ];
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                    }
                }else{
                    $response = [
                        'message' => __('messages.invalid.request'),
                    ];
                    return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                }
            }else{
                $response = [
                    'message' => __('messages.invalid.request'),
                ];
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }
        }
    }

    public function suggest_maid(Request $request){ // suggest maid to user in reqsponse of request maid 
        $userDetail = $request->userDetail; 
        $maid_id = $request->maid_id;
        $reason_to_suggest = $request->reason_to_suggest;
        $user_id = $request->user_id;
        $job_id = $request->job_id;
        $validations = [
            'maid_id' => 'required',
            'user_id' => 'required',
            'job_id' => 'required',
        ];
        $message = [
            'maid_id.required' => 'field maid_id is required.',
            'user_id.required' => 'field user_id is required.',
            'job_id.required' => 'field job_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
        $data = SuggestMaid::firstOrNew([
            'agency_id' => $userDetail->id , 
            'maid_id' => $maid_id ,
            'user_id' => $user_id,
            'job_id' => $job_id,
        ]);
        if($data->exists){
            $response = [
                'message' => 'Already Suggested',
            ];
            return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
        }else{
            $data->reason_to_suggest = $reason_to_suggest;
            $data->save();
            $response = [
                'message' => __('messages.success.success'),
            ];
            return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
        }
    }

    public function send_invitaion_to_maid(Request $request){
        $userDetail = $request->userDetail;
        // return $userDetail->id;
        $maid_id = $request->maid_id;
        $validations = [
            'maid_id' => 'required',
        ];
        $message = [
            'maid_id.required' => 'field maid_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
            if($userDetail->user_type == 'provider'){
                $data = MaidApplyAgency::firstOrNew(['maid_id' => $maid_id, 'agency_id' => $userDetail->id , 'type' => 2 ]);
                if(!$data->exists)
                    Notification::firstOrCreate([ 'from_id' => $userDetail->id , 'to_id' => $maid_id , 'text' => __('messages.notification_messages.Agency_send_registration_invitaion')]);
                    $data->save();
                $response = [
                    'message' => __('messages.success.success'),
                ];
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }else{
                $response = [
                    'message' => __('messages.invalid.request'),
                ];
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }
        }
    }

    public function past_booking(Request $request){
        $userDetail = $request->userDetail;
        $data = SuggestMaid::join('user_hired_maid',function($join)
                    {
                        $join->on('suggest_maid_by_agency_to_user.maid_id', '=', 'user_hired_maid.hire_to');
                        $join->on('suggest_maid_by_agency_to_user.user_id', '=', 'user_hired_maid.hire_by');
                    }
                )
            ->select('suggest_maid_by_agency_to_user.*','user_hired_maid.hire_by as hire_by','user_hired_maid.hire_to as hire_to','user_hired_maid.completed_status as completed_status')
            ->get();
        $res = [];
        foreach ($data as $key => $value) {
                $res[$key]['id'] = $value->id;
                $res[$key]['hire_by'] = $value->hire_by;
                $res[$key]['user_id'] = $value->user_id;
                $res[$key]['user_images'] = $value->userImages;
                $res[$key]['name'] = $value->user_detail->name;
                $res[$key]['country_code'] = $value->user_detail->country_code;
                $res[$key]['mobile'] = $value->user_detail->mobile;
                $res[$key]['email'] = $value->user_detail->email;


                $res[$key]['job_id'] = $value->job_id;
                $res[$key]['job_listing_title_name'] = JobListingTitleModel::find($value->job_detail->job_listing_title_id)->name;;
                $res[$key]['job_choice_name'] =  JobChoice::find($value->job_detail->job_choice_id)->name;
                
                $res[$key]['completed_status'] = $value->completed_status;

                $res[$key]['hire_to'] = $value->hire_to;
                $res[$key]['maid_id'] = $value->maid_detail->id;
                $res[$key]['maid_name'] = $value->maid_detail->name;
                $res[$key]['maid_country_code'] = $value->maid_detail->country_code;
                $res[$key]['maid_mobile'] = $value->maid_detail->mobile;
                $res[$key]['maid_email'] = $value->maid_detail->email;

                $res[$key]['rated'] = RatingReview::where(['rating_by' => $userDetail->id , 'job_id' => $value->job_id , 'type' => 1])->count();
                $res[$key]['maid_skills'] = MaidSkill::join('skills','skills.id','=','maid_skill.skill_id')
                    ->where(['maid_skill.user_id' => $value->maid_detail->id])
                    ->select('skills.name as skill_name')
                    ->get();
                $res[$key]['created_at'] = Carbon::parse($value->created_at)->format('d-M-Y h:i:s A');
                $res[$key]['updated_at'] = Carbon::parse($value->updated_at)->format('d-M-Y h:i:s A');
        }
        $response = [
            'message' => __('messages.success.success'),
            'response' => $res
        ];
        return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
    }

    public function maid_list(Request $request){
        $userDetail = $request->userDetail;
        $maid_under_agency = json_decode(json_encode(MaidApplyAgency::where(['agency_id' => $userDetail->id , 'status' => 1 , 'fired_status' => 0])->pluck('maid_id')),TRUE);
        $maid_list = User::where(['user_type' => 2])
            ->with('userImages')
            ->whereNotIn('id' , $maid_under_agency)
            ->orderBy('id','desc')
            ->get();
        $Controller = new Controller;
        $data = $Controller->get_users_detail($userDetail,$maid_list);
        $response = [
            'message' =>  __('messages.success.success'),
            'response' => $data,
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

   /* public function add_maid(Request $request){

        $userDetail = $request->userDetail; 
        $destinationPathOfProfile = public_path().'/'.'Images/';
        $profile_image = $request->profile_image;
        $user_name = $request->user_name;
        $email = $request->email;
        $country_code = $request->country_code;
        $mobile = $request->mobile;
        $password = Hash::make($request->password);
        $accessToken  = md5(uniqid(rand(), true));
        // $otp = rand(1000,10000);
        $step_for_maid_profile = $request->step_for_maid_profile;
        $device_token = $request->device_token;
        $device_type = $request->device_type;
        $user_type = 2; // maid 
        $data = User::where([
            'country_code' => $country_code, 
            'mobile' => $mobile,
            'user_type' => $user_type
        ])->first();

        if(!count($data)){ 
            $validations = [
                'step_for_maid_profile' => 'required',
                'profile_image' => 'required',
                'user_name' => 'required',
                'email' => 'required',
                'mobile' => 'required',
                'country_code' => 'required',
                'password' => 'required|min:8',
                'device_token' => 'required',
                'device_type' => 'required|numeric',
            ];
            $validator = Validator::make($request->all(),$validations);
            if($validator->fails()){
                $response = [
                'message' => $validator->errors($validator)->first()
                ];
                return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
            }else{
                switch ($step_for_maid_profile) {
                    case '1':
                        $user = new \App\User;
                        $user->name = $user_name;
                        $user->email = $email;
                        $user->country_code = $country_code;
                        $user->mobile = $mobile;
                        $user->password = $password;
                        $user->device_token = $device_token;
                        $user->remember_token = $accessToken;
                        $user->device_type = $device_type;
                        $user->user_type = $user_type;
                        $user->created_at = time();
                        $user->updated_at = time();
                        $user->save();
                        foreach ($profile_image as $key => $value) {
                            if($value){
                                if($key == 0){
                                    $uploadedfile = $_FILES['profile_image']['tmp_name'][$key];
                                    $fileName1 = substr($this->uploadImage($value,$uploadedfile,$destinationPathOfProfile,$key),9);
                                    $UserImage = UserImage::firstOrCreate([
                                        'user_id' => $user->id,
                                        'type' => 1,
                                        'status_by_admin' => 0,
                                    ]);
                                    $UserImage->image = $fileName1;
                                }
                                $UserImage->save();
                            }
                        }
                        $user->step_for_maid_profile = $step_for_maid_profile;
                        $user->save();
                        
                        $userData = User::where('users.id',$user->id)->leftjoin('user_images','users.id','=','user_images.user_id')->select('users.*','user_images.image as profile_pic')->first();
                        $response = [
                            'message' =>  __('messages.success.signup'),
                            'response' => $userData,

                        ];
                        Log::info('CommonController----sign_up----'.print_r($response,True));
                        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                        break;
                }
                
            }
        }else{ 
            $response = [
            'message' =>  __('messages.error.mobile_already_taken'),
            ];
            return response()->json($response,__('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }

        return $userDetail;
    }
*/
    

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
}
