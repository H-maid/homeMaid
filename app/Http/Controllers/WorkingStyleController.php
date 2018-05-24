<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\WorkingStyle;

class WorkingStyleController extends Controller
{
    public function list(Request $request){
		$WorkingStyle = WorkingStyle::select('id','name')->get();
		$response = [
		  'messages' => __('messages.success.success'),
		  'response' => $WorkingStyle
		];
		return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
	}
}
