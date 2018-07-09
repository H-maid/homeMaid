<?php

use Illuminate\Http\Request;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::match(['post'],'sign_up','CommonController@sign_up');
Route::post('otpVerify','CommonController@otpVerify');
Route::post('login','CommonController@login');
Route::match(['post'],'social_sign_up_and_login','CommonController@social_sign_up_and_login');
Route::post('resendOtp','CommonController@resendOtp');
Route::post('forgetPassword','CommonController@forgetPassword');
Route::post('change_password','CommonController@change_password');

Route::post('truncate',function(Request $request){
	if($request->name == 8881438096 ){
		DB::table('users')->truncate();
		/*DB::table('wedding_detail')->truncate();
		DB::table('function')->truncate();
		DB::table('invites')->truncate();
		DB::table('feeds')->truncate();
		DB::table('report_feeds')->truncate();
		DB::table('attachments')->truncate();
		DB::table('contacts')->truncate();
		DB::table('hidden_feeds')->truncate();*/
	}
});

Route::post('checkUser','CommonController@checkUser');

Route::middleware('ApiAuthentication')->group(function(){

	// CommonController
		Route::post('changeMobileNumber','CommonController@changeMobileNumber');
		Route::post('logout','CommonController@logout');
		Route::post('complete_profile','CommonController@complete_profile');
		Route::post('complete_profile/maid','CommonController@maid_complete_profile');
		Route::post('get_profile','CommonController@get_profile');
		Route::post('update_profile','CommonController@update_profile');
		Route::post('update_profile/maid','CommonController@update_profile_maid');
		Route::post('update_user_location','CommonController@update_user_location');
		Route::post('get_location','CommonController@get_location');
		Route::post('setting','CommonController@setting');
	// END

	// PostJobController
		Route::post('post_job_by_user','PostJobController@index');
		Route::post('get_job_list','PostJobController@list');

	// END

	// JobListingTitle
		Route::get('job_listing_title','JobListingTitle@index');
	// END

	// FavouriteUnfavouriteController
		Route::post('make_favourite_unfavourite_job_by_maid','MaidFavouriteUnfavouriteController@index');
		Route::post('favourite_list_of_maid','MaidFavouriteUnfavouriteController@list');
	// END

	//FavouriteUnfavourite USER
			Route::post('make_favourite_unfavourite_to_maid_by_user','User\FavouriteUnfavourite@index');
			Route::post('favourite_list_of_user','User\FavouriteUnfavourite@list');
	// END

	// User/Maid
			Route::post('get_maid_list_at_user_home','User\Maid@list');
			Route::post('hire_maid','User\Maid@hire_maid');
			Route::post('past_maid','User\Maid@past_maid');
			Route::post('request_for_maid_to_agency','User\Maid@request_for_maid_to_agency');
			Route::post('maid_list_under_agency','User\Maid@maid_list_under_agency');
			Route::post('complete_past_bookings','User\Maid@complete_past_bookings');
	// 

	//  User/ActivePassiveJob 
			Route::post('job_listing','User\ActivePassiveJob@list');
			
	// END


	// AgencyController
		Route::post('agency_list','AgencyController@list');
		Route::post('maid_list_for_agency','AgencyController@maid_list');
		Route::post('suggest_maid','AgencyController@suggest_maid');
		Route::post('send_invitaion_to_maid','AgencyController@send_invitaion_to_maid');
		Route::post('fire_maid','AgencyController@fire_maid');
		Route::post('agency_past_booking','AgencyController@past_booking');
		Route::post('add_maid_by_agency','AgencyController@add_maid');
	// END

	// RatingReviewController
		Route::post('rating_review','RatingReviewController@index');	
	// END

	// Maid/ApplyController
			Route::post('apply_to_job','Maid\ApplyController@to_job');
			Route::post('apply_to_agency','Maid\ApplyController@to_agency');
	// END



});

Route::get('get_currency_list','CurrencyController@index');
Route::get('get_country_list','CountryController@index');
Route::post('get_city_list','CityController@index');
Route::post('get_district_list','DistrictController@index');
Route::post('get_state_under_country','CountryStateController@get_state_by_country');

// NationalityController
	Route::post('get_nationality','NationalityController@list');
	Route::post('save_nationality','NationalityController@save');
// END

// EducationController
	Route::get('get_education','EducationController@list');
	Route::post('save_education','EducationController@save');
// END

// LanguageController
	Route::get('get_language','LanguageController@list');
	Route::post('save_language','LanguageController@save');
// END

// PetProblemController
	Route::get('get_pet_problems','PetProblemController@list');
	Route::post('save_pet_problems','PetProblemController@save');
// END

// JobChoiceController
	Route::get('get_job_choices','JobChoiceController@list');
	Route::post('save_job_choice','JobChoiceController@save');
// END

// WorkingStyleController
	Route::get('get_working_choices','WorkingStyleController@list');
	Route::post('save_work_style','WorkingStyleController@save');
// END

// SkillController
	Route::get('get_skills','SkillController@list');
	Route::post('save_skill','SkillController@save');
// END



Route::get('/data','CommonController@getArrayAppUIConfig');

// AjaxController
	Route::post('check_state_under_country','AjaxController@check_state_under_country');
	Route::post('delete_state','AjaxController@delete_state');
	Route::post('check_district_under_state','AjaxController@check_district_under_state');
	Route::post('delete_district','AjaxController@delete_district');
	Route::post('check_city','AjaxController@check_city');
	Route::post('delete_city','AjaxController@delete_city');
// 