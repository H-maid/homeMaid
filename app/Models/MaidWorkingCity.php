<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidWorkingCity extends Model
{
	use SoftDeletes;
	protected $table = "maid_working_city";
	protected $fillable = ['user_id','city_id'];
	
    public function city_detail(){
		return $this->hasOne(\App\Models\City::class,'id','city_id')->select('id','name');
	}
}
