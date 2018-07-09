<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidJobChoice extends Model
{
    
	use SoftDeletes;
	protected $table = 'maid_job_choices';
	protected $fillable = ['user_id','job_choice_id'];

	public function job_choice_detail(){
		return $this->hasOne(\App\Models\JobChoice::class,'id','job_choice_id')->select('id','name');
	}
}
