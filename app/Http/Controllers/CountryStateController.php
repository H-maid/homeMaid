<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\State;

class CountryStateController extends Controller
{
    public function get_state_by_country(Request $request){
    	$country_id = $request->country_id;
    	$validations = [
            'country_id' => 'required',
        ];
        $message = [
            'country_id.required' => 'field country_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
        	$State = State::where('country_id',$country_id)->get();
            $response = [
                'messages' => __('messages.success.success'),
                'response' => $State
            ];
            return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
        }
    }
}
