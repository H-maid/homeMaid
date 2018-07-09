<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SuggestMaid extends Model
{
 	use SoftDeletes;
	protected $table = 'suggest_maid_by_agency_to_user';
	protected $guarded = [];

	public function userImages(){
      return $this->hasMany(\App\Models\UserImage::class,'user_id','user_id');
   }

   public function maid_detail(){
		return $this->hasOne(\App\Models\User::class,'id','maid_id');
	}

	public function user_detail(){
		return $this->hasOne(\App\Models\User::class,'id','user_id');
	}

	public function job_detail(){
		return $this->hasOne(\App\Models\JobPost::class,'id','job_id');
	}
}
