<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\City;
class CityController extends Controller
{
    public function index(Request $request){
    	$state_id = $request->state_id;
    	$validations = [
            'state_id' => 'required',
        ];
        $message = [
            'state_id.required' => 'field state_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
        	$City = City::where('state_id',$state_id)
                ->select('id','name','state_id')
                ->get();
            $response = [
                'messages' => __('messages.success.success'),
                'response' => $City
            ];
            return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
        }
    }
}
