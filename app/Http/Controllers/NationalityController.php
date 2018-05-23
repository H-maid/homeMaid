<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Nationality;

class NationalityController extends Controller
{
    public function list(Request $request){
    	$Nationality = Nationality::get();
    	$response = [
            'messages' => __('messages.success.success'),
            'response' => $Nationality
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }
}
