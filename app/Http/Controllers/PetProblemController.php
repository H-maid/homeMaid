<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\PetProblem;

class PetProblemController extends Controller
{
	public function list(Request $request){
    	$PetProblem = PetProblem::select('id','name')->get();
    	$response = [
            'messages' => __('messages.success.success'),
            'response' => $PetProblem
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }
    
}
