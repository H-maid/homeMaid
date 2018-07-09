<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Response;
use Illuminate\Support\Facades\Validator;
use App\Models\JobPost;
use App\Models\JobPostNationality;
use App\Models\JobPostLanguage;
use App\Models\JobPostPetProblem;
use App\Models\District;
use App\Models\Country;
use App\Models\City;
use App\Models\State;
use App\Models\JobChoice;
use App\Models\WorkingStyle;
use App\Models\Education;
use stdClass;
use App\Models\Language;
use App\Models\Nationality;
use App\Models\PetProblem;
use App\Models\User;
use App\Models\UserImage;
use DB;
use App\Models\JobListingTitleModel;

class PostJobController extends Controller
{
    public function index(Request $request){
    	$validations = [
            'job_listing_title_id' => 'required',
            'country_id' => 'required',
            'state_id' => 'required',
            'district_id' => 'required',
            'city_id' => 'required',
            'working_style_id' => 'required',
            'expected_min_fees' => 'required',
            'expected_max_fees' => 'required',
            'job_choice_id' => 'required',
            'live_with_family' => 'required',
            'travel' => 'required',
            'description' => 'required',
            'nationality' => 'required',
            'marital_status' => 'required',
            'kid_status' => 'required',
            'hijab' => 'required',
            'education_id' => 'required',
            'known_language_id' => 'required',
            'driving_licence' => 'required',
            'smoking' => 'required',
            'alcohol' => 'required',
            'pet_problem' => 'required',
            'min_age' => 'required',
            'max_age' => 'required',
        ];
        $messages = [
        	'job_listing_title_id.required' => 'job_listing_title_id field is required',
        	'country_id.required' => 'country_id field is required',
        	'state_id.required' => 'state_id field is required',
        	'district_id.required' => 'district_id field is required',
        	'city_id.required' => 'city_id field is required',
        	'working_style_id.required' => 'working_style_id field is required',
        	'expected_min_fees.required' => 'expected_min_fees field is required',
        	'expected_max_fees.required' => 'expected_max_fees field is required',
        	'job_choice_id.required' => 'job_choice_id field is required',
        	'live_with_family.required' => 'live_with_family field is required',
        	'travel.required' => 'travel field is required',
        	'description.required' => 'description field is required',
        	'marital_status.required' => 'marital_status field is required',
        	'kid_status.required' => 'kid_status field is required',
        	'hijob_status_min.required' => 'hijob_status_min field is required',
        	'hijob_status_max.required' => 'hijob_status_max field is required',
        	'education_id.required' => 'education_id field is required',
        	'driving_licence.required' => 'driving_licence field is required',
        	'smoking.required' => 'smoking field is required',
        	'alcohol.required' => 'alcohol field is required',
        	'min_age.required' => 'min_age field is required',
        	'max_age.required' => 'max_age field is required',
            'nationality.required'=>'nationality field is required'
        ];
        $validator = Validator::make($request->all(),$validations,$messages);
        if($validator->fails()){
            $response = [
                'message' => $validator->errors($validator)
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{
            $JobPost = new JobPost;
            $JobPost->fill($request->except(['known_language_id', 'known_language_id','pet_problem','userDetail','education_id']));
            // dd($JobPost);
            $JobPost->user_id = $request->userDetail->id;
            $JobPost->save();
            $job_id = $JobPost->id;
            $nationality = json_decode($request->nationality);
            $known_language_id = json_decode($request->known_language_id);
            $education_id = json_decode($request->education_id);
            $pet_problem = json_decode($request->pet_problem); 
            if (count($education_id)) {
               foreach ($education_id as $value) {
                   $insert = DB::table('job_post_education')->insert(['education_id'=>$value,'job_post_id'=>$job_id]);
               }
            }
            // if(count($nationality)){
            //         $JobPostNationality = new JobPostNationality;
            //         $JobPostNationality->fill(['nationality_id' => $nationality , 'job_post_id' => $job_id]);
            //         $JobPostNationality->save();
            // }
            if(count($known_language_id)){
                foreach ($known_language_id as $key => $value) {
                    $JobPostLanguage = new JobPostLanguage;
                    $JobPostLanguage->fill(['language_id' => $value, 'job_post_id' => $job_id]);
                    $JobPostLanguage->save();
                }
            }
            if(count($pet_problem)){
                foreach ($pet_problem as $key => $value) {
                    $JobPostPetProblem = new JobPostPetProblem;
                    $JobPostPetProblem->fill(['pet_problem_id' => $value, 'job_post_id' => $job_id]);
                    $JobPostPetProblem->save();
                }
            }
            $response = new stdClass;
            $response->message = __('messages.success.success');
            $response->response = JobPost::find($job_id);
            return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
        }
    }

    public function list(Request $request){
        //dd($request->all());

        $userDetail = $request->userDetail;
        //dd($userDetail);

        if( $userDetail->user_type = 'maid'){ 
            $data = JobPost::Where(['status_by_admin' => 1])->orderBy('id','desc')->get();
            foreach ($data as $key => $value) {
                $data[$key]->job_listing_title_name =  JobListingTitleModel::find($value->job_listing_title_id)->name;
                $data[$key]->country_name =  Country::find($value->country_id)->name;
                $data[$key]->state_name =  State::find($value->state_id)->name;
                $data[$key]->district_name =  District::find($value->district_id)->name;
                $data[$key]->city_name =  City::find($value->city_id)->name;
                $data[$key]->working_style_name =  WorkingStyle::find($value->working_style_id)->name;
                $data[$key]->job_choice_name =  JobChoice::find($value->job_choice_id)->name;
                $data[$key]->nationality    = Nationality::find($value->nationality)->name;
                $get_favourite=DB::table('maid_favourite')->where('to_job_id',$value->id)->where('from_id',$userDetail->id)->first();
                //dd($get_favourite);
                if(empty($get_favourite)) {
                    $is_favourite = 0;
                } else {
                    $is_favourite = 1;
                }
                $data[$key]->is_favourite    = $is_favourite;

                $data[$key]->education_name =  Education::select('educations.id as education_id','educations.name as education_name')->join('job_post_education','educations.id','=','job_post_education.education_id')->where('job_post_id',$value->id)->get();
                foreach ($value->languages as $lang_key => $lang) {
                   $language_name = Language::find($lang->language_id)->name;
                   $lang->language_name = $language_name;
                }
                foreach ($value->pet_problems as $pet_prob_key => $pet_prob) {
                   $pet_problem_name = PetProblem::find($pet_prob->pet_problem_id)->name;
                   $pet_prob->pet_problem_name = $pet_problem_name;
                }

                $data[$key]->user_detail = DB::table('users')
                    ->where(['users.id' => $value->user_id])
                    ->leftJoin('country','country.id','=','users.country_id')
                    ->leftjoin('city','city.id','=','users.city_id')
                    ->leftjoin('district','district.id','=','users.district')
                    ->leftjoin('states','states.id','=','users.state_id')
                    ->select('users.id as id','users.name as name','users.country_id as country_id','country.name as country_name','users.country_code as country_code','users.mobile as mobile','users.email as email','users.dob as dob','users.gender as gender','users.marital_status as marital_status','users.city_id as city_id','city.name as city_name','users.district as district_id','district.name as district_name','users.state_id as state_id','states.name as state_name')
                    ->first();
                $data[$key]->user_detail->userimages = UserImage::where(['user_id' => $value->user_id])->get();
            }
            $response = new stdClass;
            $response->message = __('messages.success.success');
            $response->response = $data;
            return response()->json($response,__('messages.statusCode.ACTION_COMPLETE'));
        }
    }
}


