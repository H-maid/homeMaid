<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
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
use App\Models\HireMaid;
use App\Models\MaidWorkExperience;
use App\Models\FavouriteUnfavouriteByUser;
use App\Models\RatingReview;


class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function setTimeZone($timezone){
		/*config(['app.timezone' => 'America/Chicago']);
   		$timezone = Config::get('app.timezone');
		date_default_timezone_set($timezone);*/
		date_default_timezone_set($timezone);
	}


	public function get_users_detail($userDetail,$user_list){ // its uses for multiple users like array of users
        foreach ($user_list as $key => $value) {
            if($value->country_id)
               $user_list[$key]['country_name'] = Country::find($value->country_id)->name;
            if($value->state_id)
               $user_list[$key]['state_name'] = State::find($value->state_id)->name;
            if($value->nationality_id){
                $user_list[$key]['nationality'] = Nationality::find($value->nationality_id)->name;
            }
            $user_list[$key]['user_languages'] = UserLanguage::where('user_id',$value->id)->with('language_detail')->select('user_id','language_id')->get();
            $user_list[$key]['user_educations'] = UserEducation::where('user_id',$value->id)->with('education_detail')->select('user_id','education_id')->get();
            $user_list[$key]['user_pet_problems'] = UserPetProblem::where('user_id',$value->id)->with('pet_problem_detail')->select('user_id','pet_problem_id')->get();
            if($value->country_id)
                $value['maid_can_work_country_name'] = Country::where('id',$value->country_id)->first()->name;
            
            $user_list[$key]['maid_working_states'] = MaidWorkingState::with('state_detail')
                ->where('user_id',$value->id)
                ->select('user_id','state_id')
                ->get();

            $user_list[$key]['maid_job_choices'] = MaidJobChoice::with('job_choice_detail')->where('user_id',$value->id)->select('user_id','job_choice_id')->get();

            $user_list[$key]['maid_working_style'] = MaidWorkingStyle::with('working_style_detail')->where('user_id',$value->id)->select('user_id','style_id')->get();

            $user_list[$key]['maid_skills'] = MaidSkill::with('skill_detail')->where('user_id',$value->id)->select('user_id','skill_id')->get();

            $user_list[$key]['rating'] = 0;

            $user_list[$key]['agency_name'] = null;

            $user_list[$key]['is_favourite'] = FavouriteUnfavouriteByUser::where(['to_maid_id' => $value->id, 'from_id' => $userDetail->id ])->count();

            $user_list[$key]['is_hired'] = (boolean) HireMaid::where(['hire_to' => $value->id ])->count();

            $user_list[$key]['maid_working_city'] = MaidWorkingCity::with('city_detail')->Where(['user_id' => $value->id])->select('id','user_id','city_id')->get();

            $user_list[$key]['maid_working_district'] = MaidWorkingDistrict::with('district_detail')->Where(['user_id' => $value->id])->select('id','user_id','district_id')->get();

            $user_list[$key]['maid_work_experiences'] = MaidWorkExperience::where('user_id',$value->id)->get();
        }
        return $user_list;

    }

    
}
