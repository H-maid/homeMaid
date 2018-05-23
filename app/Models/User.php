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

	/*public function getCountryIdAttribute($value){
		if($value)
			return Country::find($value)->name;
		else 
			return '';
	}

	public function getStateIdAttribute($value){
		if($value)
			return State::find($value)->state_name;
		else 
			return '';
	}*/

}
