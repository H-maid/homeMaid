<?php

namespace App\Http\Controllers\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
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


class ActivePassiveJob extends Controller
{
   
   Public function list(Request $request){
   	$userDetail = $request->userDetail;
   	// return $userDetail;
   	$validations = [
			'key' => 'required',
		];
		$validator = Validator::make($request->all(),$validations);
		if($validator->fails()){
		   $response = [
		       'message' => $validator->errors($validator)->first()
		   ];
		   return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
		}

   	$data = JobPost::Where(['status_by_admin' => $request->key])->orderBy('id','desc')->get();
      foreach ($data as $key => $value) {
          $data[$key]->job_listing_title_name =  JobListingTitleModel::find($value->job_listing_title_id)->name;
          $data[$key]->country_name =  Country::find($value->country_id)->name;
          $data[$key]->state_name =  State::find($value->state_id)->name;
          $data[$key]->district_name =  District::find($value->district_id)->name;
          $data[$key]->city_name =  City::find($value->city_id)->name;
          $data[$key]->working_style_name =  WorkingStyle::find($value->working_style_id)->name;
          $data[$key]->job_choice_name =  JobChoice::find($value->job_choice_id)->name;
          $data[$key]->nationality    = Nationality::find($value->nationality)->name;
          // $get_favourite=DB::table('maid_favourite')->where('to_job_id',$value->id)->where('from_id',$userDetail->id)->first();
          //dd($get_favourite);
          /*if(empty($get_favourite)) {
              $is_favourite = 0;
          } else {
              $is_favourite = 1;
          }
          $data[$key]->is_favourite    = $is_favourite;*/

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
