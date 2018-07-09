<?php

namespace App\Http\Controllers;
use Response;
use Illuminate\Http\Request;
use App\Models\MaidFavouriteUnfavourite;
use Illuminate\Support\Facades\Validator;
use App\Models\JobPost;
use DB;
use App\Models\JobListingTitleModel;
use App\Models\User;
use App\Models\District;
use App\Models\Country;
use App\Models\City;
use App\Models\State;
use App\Models\JobChoice;
use App\Models\WorkingStyle;
use App\Models\Education;
use App\Models\Language;
use App\Models\Nationality;
use App\Models\JobPostLanguage;
use App\Models\JobPostPetProblem;
use App\Models\PetProblem;
use App\Models\UserImage;

class MaidFavouriteUnfavouriteController extends Controller // maid only do jobListing fav /unFav
{
    public function index(Request $request){
    	$userDetail = $request->userDetail;
    	$from = $userDetail->id;
    	$job_list_id = $request->job_list_id;
    	$key = $request->key;
    	$validations = [
            'key' => 'required',
            'job_list_id' => 'required',
        ];
        $message = [
            'key.required' => 'field key is required.',
            'job_list_id.required' => 'field job_list_id is required.'
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
    		 	$data = MaidFavouriteUnfavourite::withTrashed()
    		 		->where(['to_job_id' => $job_list_id , 'from_id' => $from])
    		 		->first();
    		 	if($data){
    		 		$data->restore();
    		 	}else{
    				$MaidFavouriteUnfavourite = MaidFavouriteUnfavourite::firstOrCreate(['to_job_id' => $job_list_id , 'from_id' => $from]);
    		 	}
    			$response = [
		    		'message' => __('messages.success.success'),
		    	];
		    	return Response::json( $response , trans('messages.statusCode.ACTION_COMPLETE') );
    		break;
			
			case '0':
				//$unFav = MaidFavouriteUnfavourite::where(['to_job_id' => $job_list_id , 'from_id' => $from])->first();
                $unFav =DB::table('maid_favourite')->where('to_job_id',$job_list_id)->where('from_id',$from)->first();
				if($unFav){
					DB::table('maid_favourite')->where('to_job_id',$job_list_id)->where('from_id',$from)->delete();
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
        $MaidFavouriteUnfavourite = MaidFavouriteUnfavourite::where(['from_id' => $userDetail->id ])
            ->get();
        /*foreach ($MaidFavouriteUnfavourite as $key => $value) {
            $MaidFavouriteUnfavourite[$key]->job_post_detail = JobPost::Where(['status_by_admin' => 1 ,'id' => $value->to_job_id])->orderBy('id','desc')->first();
        }*/
        // dd($MaidFavouriteUnfavourite);

        foreach ($MaidFavouriteUnfavourite as $key => $value) {

            $MaidFavouriteUnfavourite[$key]->job_post_detail = JobPost::Where(['status_by_admin' => 1 ,'id' => $value->to_job_id])->orderBy('id','desc')->first();

            
            $MaidFavouriteUnfavourite[$key]->job_post_detail->job_listing_title_name =  JobListingTitleModel::find($value->job_post_detail->job_listing_title_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->country_name = Country::find($value->job_post_detail->country_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->state_name = State::find($value->job_post_detail->state_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->district_name =  District::find($value->job_post_detail->district_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->city_name = City::find($value->job_post_detail->city_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->working_style_name = WorkingStyle::find($value->job_post_detail->working_style_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->job_choice_name =  JobChoice::find($value->job_post_detail->job_choice_id)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->nationality = Nationality::find($value->job_post_detail->nationality)['name'];
            $MaidFavouriteUnfavourite[$key]->job_post_detail->education_name = Education::select('educations.id as education_id','educations.name as education_name')
                ->join('job_post_education','educations.id','=','job_post_education.education_id')
                ->where('job_post_id',$value->job_post_detail->id)
                ->get();
            $MaidFavouriteUnfavourite[$key]->job_post_detail->languages = JobPostLanguage::where(['job_post_id' => $value->job_post_detail->id])
                ->leftjoin('languages','job_post_known_languages.language_id','=','languages.id')
                ->select('job_post_known_languages.*','languages.name as language_name')
                ->get();
            $MaidFavouriteUnfavourite[$key]->job_post_detail->pet_problems = JobPostPetProblem::where(['job_post_id' => $value->job_post_detail->id])
                ->leftjoin('pet_problems','pet_problems.id','=','job_post_pet_problems.pet_problem_id')
                ->select('job_post_pet_problems.*','pet_problems.name as pet_problem_names')
                ->get();
            $MaidFavouriteUnfavourite[$key]->job_post_detail->user_detail = User::find($value->job_post_detail->user_id);
            $MaidFavouriteUnfavourite[$key]->job_post_detail->user_detail->userimages = UserImage::where(['user_id' => $value->job_post_detail->user_id])->get();
            $MaidFavouriteUnfavourite[$key]->job_post_detail->is_favourite = MaidFavouriteUnfavourite::where(['from_id' => $userDetail->id , 'to_job_id' => $value->job_post_detail->id])->count();
        }
            //dd($MaidFavouriteUnfavourite);
        
        $response = [
            'message' => __('messages.success.success'),
            'response' => $MaidFavouriteUnfavourite
        ];
        return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
    }
}
