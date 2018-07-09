<?php

namespace App\Http\Controllers\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\CommonController;
use Response;
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
use App\Models\HireMaid;
use App\Models\MaidWorkingDistrict;
use App\Models\MaidSkill;
use App\Models\RatingReview;
use App\Models\RequestByUserToAgencyForMaid;
use App\Models\MaidApplyAgency;
use App\Models\FavouriteUnfavouriteByUser;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class Maid extends Controller
{
    public function list(Request $request){
		$userDetail = $request->userDetail;
		$maid_list = User::where(['user_type' => 2])->with('userImages')->orderBy('id','desc')->get();
        $Controller = new Controller;
        $data = $Controller->get_users_detail($userDetail,$maid_list);
        $response = [
            'message' =>  __('messages.success.success'),
            'response' => $data,
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function hire_maid(Request $request){
        $userDetail = $request->userDetail;
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
        }

        $data = HireMaid::firstOrNew(['hire_by' => $userDetail->id , 'hire_to' => $maid_id]);
        $data->save();
        $response = [
            'message' =>  __('messages.success.success'),
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function past_maid(Request $request){
        $userDetail = $request->userDetail;
        // return $userDetail;
        $data = HireMaid::where(['hire_by' => $userDetail->id])->orderBy('id','DESC')->get();
        // return $data;
        $res = [];
        foreach ($data as $key => $value) {
            // dd($value);
            $value->maid_detail;
            $value->userImages;
            $res[$key]['id'] = $value->id;
            $res[$key]['completed_status'] = $value->completed_status;
            $res[$key]['name'] = $value->maid_detail->name;
            $res[$key]['maid_images'] = $data[$key]->userImages;
            $res[$key]['country_code'] = $value->maid_detail->country_code;
            $res[$key]['mobile'] = $value->maid_detail->mobile;
            $res[$key]['maid_id'] = $value->maid_detail->id;
            $res[$key]['rated'] = RatingReview::where(['rating_by' => $userDetail->id , 'rating_to' => $value->maid_detail->id])->count();
            $res[$key]['maid_skills'] = MaidSkill::join('skills','skills.id','=','maid_skill.skill_id')
                ->where(['maid_skill.user_id' => $value->maid_detail->id])
                ->select('skills.name as skill_name')
                ->get();
            $res[$key]['created_at'] = Carbon::parse($value->created_at)->format('d-M-Y h:i:s A');
            $res[$key]['updated_at'] = Carbon::parse($value->updated_at)->format('d-M-Y h:i:s A');
        }
        $response = [
            'message' =>  __('messages.success.success'),
            'response' => $res
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function request_for_maid_to_agency(Request $request){
        $userDetail = $request->userDetail;
        $agency_id = $request->agency_id;
        $validations = [
            'agency_id' => 'required',
        ];
        $message = [
            'agency_id.required' => 'field agency_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }

        if($userDetail->user_type == 'user'){
            $data = RequestByUserToAgencyForMaid::firstOrNew(['from_user_id' => $userDetail->id , 'to_agency_id' => $agency_id]);
            if($data->exists){
                $response = [
                    'message' => 'Already requested',
                ];
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }else{
                $data->save();
                $response = [
                    'message' =>  __('messages.success.success'),
                ];
                return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
            }
        }else{
            $Response = [
              'message'  => trans('messages.invalid.request'),
            ];
            return Response::json( $Response , trans('messages.statusCode.SHOW_ERROR_MESSAGE') );
        }
    }

    public function maid_list_under_agency(Request $request){
        $userDetail = $request->userDetail;
        $agency_id = $request->agency_id;
        $validations = [
            'agency_id' => 'required',
        ];
        $message = [
            'agency_id.required' => 'field agency_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
        $maid_list = User::where(['user_type' => 2])->with('userImages')->orderBy('id','desc')->get();
        $Controller = new Controller;
        $data = $Controller->get_users_detail($userDetail,$maid_list);
        $res = [];
        $MaidApplyAgency = json_decode(json_encode(MaidApplyAgency::where(['agency_id' => $agency_id ,'status' => 1 , 'fired_status' => 0])->pluck('maid_id')),TRUE);
        foreach ($data as $key => $value) {
            if(in_array($value->id, $MaidApplyAgency))
                $res [] = $value;
        }
        $response = [
            'message' =>  __('messages.success.success'),
            'response' => $res,
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function complete_past_bookings(Request $request){
        $userDetail = $request->userDetail;
        $maid_id = $request->maid_id;
        $status = $request->status;

        $validations = [
            'maid_id' => 'required',
            'status' => 'required',
        ];
        $message = [
            'maid_id.required' => 'field maid_id is required.',
            'status.required' => 'field status is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }

        if($userDetail->user_type == 'user'){
            // return $userDetail;
            $data = HireMaid::where(['hire_to' => $maid_id , 'hire_by' => $userDetail->id])->first();
            $data->completed_status = $status;
            $data->save();
            switch ($status) {
                case '0':
                    $response = [
                        'message' =>  'Incompleted',
                    ];
                    return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                    break;

                case '1':
                    $response = [
                        'message' => 'Completed',
                    ];
                    return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
                    break;
            }
            
        }else{
            $Response = [
              'message'  => trans('messages.invalid.request'),
            ];
            return Response::json( $Response , trans('messages.statusCode.SHOW_ERROR_MESSAGE') );
        }
    }
}
