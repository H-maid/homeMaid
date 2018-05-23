<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Education;


class EducationController extends Controller
{
   public function list(Request $request){

   	$Education = Education::select('id','name')->get();
   	$response = [
          'messages' => __('messages.success.success'),
          'response' => $Education
      ];
      return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
   }
}
