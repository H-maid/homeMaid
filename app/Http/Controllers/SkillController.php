<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Skill;

class SkillController extends Controller
{
   	public function list(Request $request){
		$Skill = Skill::select('id','name')->get();
		$response = [
		  'messages' => __('messages.success.success'),
		  'response' => $Skill
		];
		return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
	}

	public function save(Request $request){
    	// return $request->all();
    	$data = Skill::firstOrNew(['name' => $request->skill]);
		if(!$data->exists){
    		$data->save();
			return '1';
		}else{
			return '0';
		}    	
    }
}
