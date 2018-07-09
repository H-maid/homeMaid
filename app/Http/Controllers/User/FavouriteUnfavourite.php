<?php

namespace App\Http\Controllers\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Response;
use App\Models\User;
use App\Models\UserImage;
use App\Models\City;
use App\Models\Country;
use App\Models\Nationality;
use App\Models\State;
use App\Models\UserLanguage;
use App\Models\UserEducation;
use App\Models\UserPetProblem;
use App\Models\PetProblem;
use App\Models\MaidWorkingState;
use App\Models\MaidWorkingCountry;
use App\Models\MaidJobChoice;
use App\Models\MaidWorkingStyle;
use App\Models\MaidWorkingCity;
use App\Models\MaidWorkingDistrict;
use App\Models\MaidSkill;
use App\Models\FavouriteUnfavouriteByUser;


class FavouriteUnfavourite extends Controller // user will fav /unFav to maid
{
    public function index(Request $request){
    	$userDetail = $request->userDetail;
    	$from = $userDetail->id;
    	$to_maid_id = $request->to_maid_id;
    	$key = $request->key;
    	$validations = [
            'key' => 'required',
            'to_maid_id' => 'required',
        ];
        $message = [
            'key.required' => 'field key is required.',
            'to_maid_id.required' => 'field to_maid_id is required.'
        ];
        $validator = Validator::make($request->all(),$validations,$message);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)->first()
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }
        switch ($key) {
            
        	case '1':
    		 	$data = FavouriteUnfavouriteByUser::withTrashed()
    		 		->where(['to_maid_id' => $to_maid_id , 'from_id' => $from])
    		 		->first();
    		 	if($data){
    		 		$data->restore();
    		 	}else{
    				$FavouriteUnfavouriteByUser = FavouriteUnfavouriteByUser::firstOrCreate(['to_maid_id' => $to_maid_id , 'from_id' => $from]);
    		 	}
    			$response = [
		    		'message' => __('messages.success.success'),
		    	];
		    	return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
                break;

			case '0':
				$unFav = FavouriteUnfavouriteByUser::where(['to_maid_id' => $to_maid_id , 'from_id' => $from])->first();
				if($unFav){
					$unFav->delete();
					$response = [
			    		'message' => __('messages.success.success'),
			    	];
			    	return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
	        		break;        	
				}else{
					$response = [];
					return Response::json( $response , trans('messages.statusCode.NOT_FOUND') );
	        		break;
				}
        }
    }

    public function list(Request $request){
        $userDetail = $request->userDetail; 
        $maid_list = User::join('user_favourite','user_favourite.to_maid_id','=','users.id')
            ->with('userImages')
            ->where(['users.user_type' => 2 , 'user_favourite.from_id' => $userDetail->id , 'user_favourite.deleted_at' => null])
            ->select('users.*','user_favourite.id as user_favourite_id','user_favourite.to_maid_id as to_maid_id','user_favourite.from_id as from_id','user_favourite.deleted_at as user_favourite_deleted_at')
            ->orderBy('user_favourite.id','desc')
            ->get();
        // return $maid_list;
        $Controller = new Controller;
        $data = $Controller->get_users_detail($userDetail,$maid_list);
        $response = [
            'message' =>  __('messages.success.success'),
            'response' => $data,
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }
}
