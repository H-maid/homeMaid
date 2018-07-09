<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Language;

class LanguageController extends Controller
{
   	public function list(Request $request){
    	$Language = Language::select('id','name')->get();
    	$response = [
            'messages' => __('messages.success.success'),
            'response' => $Language
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }

    public function save(Request $request){
    	// return $request->all();
    	$data = Language::firstOrNew(['name' => $request->language]);
		if(!$data->exists){
    		$data->save();
			return '1';
		}else{
			return '0';
		}    	
    }
}
