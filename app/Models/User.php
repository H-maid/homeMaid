<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Country;
use App\Models\State;

class User extends Authenticatable
{

	protected $fillable = [
	  'name', 'country_code','mobile', 'email', 'password','otp' ,'status','user_type' ,'device_token','device_type','remember_token','state_id'];

	protected $hidden = [
	  'password',
	];

	public function userImages(){
		return $this->hasMany(\App\Models\UserImage::class,'user_id','id');
	}

	public function getUserTypeAttribute($value){
		switch ($value) {
			case '1':
				return 'user';
				break;
			case '2':
				return 'maid';
				break;
			case '3':
				return 'provider';
				break;
		}
	}

	public static function get_user_count($user_type = null ,$date = null){
		if($user_type){
			$data = Self::where([
				'complete_profile' => 1 , 
				'status' => 1 , 
				'user_type' => $user_type , 
			])
			->count();
			return $data;
		}
		else if($date){
			$data = Self::whereDate('created_at',$date)
			->where([
				'complete_profile' => 1 , 
				'status' => 1 , 
			])
			->count();
			return $data;
		}


		else{
			$data = Self::where([
				'complete_profile' => 1 , 
				'status' => 1 , 
			])
			->count();
			return $data;
		}
	}
}
