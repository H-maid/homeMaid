<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidWorkingCountry extends Model
{
 	use SoftDeletes;
	protected $table = 'maid_work_countries';
	protected $fillable = ['user_id','country_id'];

	public function country_detail(){
		return $this->hasOne(\App\Models\Country::class,'id','country_id')->select('id','name');
	}

}