<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

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
		Route::post('update_user_location','CommonController@update_user_location');
	// END

	// PostJobController
		Route::post('post_job_by_user','PostJobController@index');

	// END

	// JobListingTitle
		Route::get('job_listing_title','JobListingTitle@index');
	// END
});

Route::get('get_currency_list','CurrencyController@index');
Route::get('get_country_list','CountryController@index');
Route::post('get_city_list','CityController@index');
Route::post('get_district_list','DistrictController@index');
Route::post('get_state_under_country','CountryStateController@get_state_by_country');
Route::post('get_nationality','NationalityController@list');
Route::get('get_education','EducationController@list');
Route::get('get_language','LanguageController@list');
Route::get('get_pet_problems','PetProblemController@list');
Route::get('get_job_choices','JobChoiceController@list');
Route::get('get_working_choices','WorkingStyleController@list');
Route::get('get_skills','SkillController@list');



Route::get('/data','CommonController@getArrayAppUIConfig');