<?php

namespace App\Http\Controllers\Maid;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Response;
use Validator;
use App\Models\User;
use App\Models\MaidApplyJobs;
use App\Models\MaidApplyAgency;

class ApplyController extends Controller
{
    public function to_job(Request $request){
	 	$userDetail = $request->userDetail;
	 	$job_id = $request->job_id;
	 	$validations = [
            'job_id' => 'required',
        ];
        $message = [
            'job_id.required' => 'field job_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
	 	$data = MaidApplyJobs::firstOrNew(['maid_id' => $userDetail->id , 'job_id' => $job_id]);
	 	$data->save();
	 	$response = [
            'message' => __('messages.success.success'),
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function to_agency(Request $request){
        $userDetail = $request->userDetail;
        // return $userDetail->id;
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
        $data = MaidApplyAgency::firstOrNew(['maid_id' => $userDetail->id , 'agency_id' => $agency_id , 'type' => 1]);
        if(!$data->exists)
            $data->save();
        $response = [
            'message' => __('messages.success.success'),
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    
}
