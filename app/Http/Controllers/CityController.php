<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\City;
class CityController extends Controller
{
    public function index(Request $request){
    	$district_id = $request->district_id;
    	$validations = [
            'district_id' => 'required',
        ];
        $message = [
            'district_id.required' => 'field district_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
        	$City = City::where('district_id',$district_id)->select('id','name','district_id')->get();
            $response = [
                'messages' => __('messages.success.success'),
                'response' => $City
            ];
            return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
        }
    }
}
