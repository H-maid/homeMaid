<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserEducation extends Model
{
   use SoftDeletes;
	protected $table = 'user_educations';
	protected $fillable = ['user_id','education_id'];

	public function education_detail(){
		return $this->hasOne(\App\Models\Education::class,'id','education_id')->select('id','name');
	}
}
