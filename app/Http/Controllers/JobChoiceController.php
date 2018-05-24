<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\JobChoice;

class JobChoiceController extends Controller
{
	public function list(Request $request){
		$JobChoice = JobChoice::select('id','name')->get();
		$response = [
		  'messages' => __('messages.success.success'),
		  'response' => $JobChoice
		];
		return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
	}
}
