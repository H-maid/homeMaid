<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{

	protected $fillable = [
	  'name', 'country_code','mobile', 'email', 'password','otp' ,'status','user_type' ,'device_token','device_type','remember_token'];

	protected $hidden = [
	  'password',
	];

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
}
