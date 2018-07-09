<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RatingReview;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Response;


class RatingReviewController extends Controller
{
	public function index(Request $request){
		$userDetail = $request->userDetail;
        $key = $request->key;
        $validations = [
            'key' => 'required',
            'rating' => 'required',
            'rating_to_id' => 'required_if:key,0',
            'rating_to_job_id' => 'required_if:key,1',
        ];
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
        switch ($key) {
            case '0':
                $RatingReview = RatingReview::firstOrNew(['rating_by' => $userDetail->id , 'rating_to' => $request->rating_to_id , 'review' => $request->review]);
                $RatingReview->save();
                $Response = [
                  'message'  => trans('messages.success.success'),
                ];
                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                break;

            case '1':
                $RatingReview = RatingReview::firstOrNew(['rating_by' => $userDetail->id , 'job_id' => $request->rating_to_job_id , 'review' => $request->review , 'type' => 1]);
                $RatingReview->save();
                $Response = [
                  'message'  => trans('messages.success.success'),
                ];
                return Response::json( $Response , trans('messages.statusCode.ACTION_COMPLETE') );
                break;
            
            
        }
        
    }
}
