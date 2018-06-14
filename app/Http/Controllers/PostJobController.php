<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Response;
use Illuminate\Support\Facades\Validator;

class PostJobController extends Controller
{
    public function index(Request $request){
    	// dd($request->all());
    	$job_listing_title = $request->job_listing_title; // listing title
    	$country_id = $request->country_id;
    	$state_id = $request->state_id;
    	$district_id = $request->district_id;
    	$city_id = $request->city_id;
    	$working_style_id = $request->working_style_id;
    	$expected_min_fees = $request->expected_min_fees;
    	$expected_max_fees = $request->expected_max_fees;
    	$job_choice_id = $request->job_choices;
    	$live_with_family = $request->live_with_family;
    	$travel = $request->travel;
    	$description = $request->description;
    	$nationality = json_decode($request->nationality);
    	$marital_status = $request->marital_status;
    	$kid_status = $request->kid_status;
    	$hijob_status_min = $request->hijob_status_min;
    	$hijob_status_max = $request->hijob_status_max;
    	$education_id = $request->education_id;
    	$known_language_id = json_decode($request->known_language_id);
    	$driving_licence = $request->driving_licence;
    	$smoking = $request->smoking;
    	$alcohol = $request->alcohol;
    	$pet_problem = json_decode($request->pet_problem); 
    	$min_age = $request->min_age;
    	$max_age = $request->max_age;

    	$validations = [
            'job_listing_title' => 'required',
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
            'hijob_status_min' => 'required',
            'hijob_status_max' => 'required',
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
        	'job_listing_title.required' => 'job_listing_title field is required',
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
        ];
        $validator = Validator::make($request->all(),$validations,$messages);
        if($validator->fails()){
            $response = [
            'message' => $validator->errors($validator)
            ];
            return response()->json($response,trans('messages.statusCode.SHOW_ERROR_MESSAGE'));
        }else{


        }
    }
}
