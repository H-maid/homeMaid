<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Response;
use Illuminate\Support\Facades\Validator;
use App\Models\JobListingTitleModel;

class JobListingTitle extends Controller
{
    public function index(Request $request){
    	$JobListingTitle = JobListingTitleModel::get();
    	$response = [
    		'message' => __('messages.success.success'),
    		'response' =>  $JobListingTitle
    	];
    	return response()->json($response,trans('messages.statusCode.ACTION_COMPLETE'));
    }
}
