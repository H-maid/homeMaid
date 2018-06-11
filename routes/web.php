<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

/////////////////////////////////ADMIN ROUTES /////////////////////////////////////////

Route::get('/admin', function (Request $request) {
	if(!Auth::guard('admin')->check())
   	return view('welcome');
   else
   	return redirect('/admin/dashboard');
});

Route::group(['prefix' => '/admin' , 'middleware' => ['admin']],function(){
	/////////////////////AdminController//////////////////////
		Route::match(['post','get'],'/profile','Admin\AdminController@profile');
		Route::match(['post','get'],'/edit-profile','Admin\AdminController@edit');
		Route::match(['post','get'],'/change-password','Admin\AdminController@change_password');
		Route::get('/dashboard',['uses' => 'Admin\AdminController@dashboard' , 'as' => 'admin.dashboard']);
	////////////END///////////////////////////////////////////////

	////////////////////////UserManagementController//////////////////
		Route::match(['get','post'],'/user-management',['uses' => 'Admin\UserManagementController@user_management' , 'as' => 'admin.user_management']);
		Route::match(['get','post'],'/block-unblock-user/{user_id}/{status}',['uses' => 'Admin\UserManagementController@block_unblock_user' , 'as' => 'admin.block_unblock_user'])->where(['user_id','[0-9]+','status' => '[0-9]+']);

		Route::match(['get','post'],'/maid-management',['uses' => 'Admin\UserManagementController@maid_management' , 'as' => 'admin.maid_management']);
		Route::match(['get','post'],'/block-unblock-maid/{user_id}/{status}',['uses' => 'Admin\UserManagementController@block_unblock_maid' , 'as' => 'admin.block_unblock_maid'])->where(['user_id','[0-9]+','status' => '[0-9]+']);


		Route::match(['get','post'],'/agency-management',['uses' => 'Admin\UserManagementController@agency_management' , 'as' => 'admin.agency_management']);
		Route::match(['get','post'],'/block-unblock-agency/{user_id}/{status}',['uses' => 'Admin\UserManagementController@block_unblock_agency' , 'as' => 'admin.block_unblock_agency'])->where(['user_id','[0-9]+','status' => '[0-9]+']);
		
	///////////END/////////////////////////////////////////////////////


	



});
Route::post('admin/login_post','Admin\AdminController@index');
Route::get('/admin/logout',['uses' => 'Admin\AdminController@logout' , 'as' => 'admin.logout']);
Route::match(['get','post'],'/admin/forget-password',['uses' => 'Admin\AdminController@forget_password' , 'as' => 'admin.forget-password']);
Route::match(['get','post'],'/admin/reset-password/{token?}',['uses' => 'Admin\AdminController@reset_password' , 'as' => 'admin.reset-password']);
Route::post('check','Admin\AdminController@check');