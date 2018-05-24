<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidWorkingState extends Model
{
 	use SoftDeletes;
   	protected $table = 'maid_working_states';
   	protected $fillable = ['user_id','state_id'];

	public function state_detail(){
		return $this->hasOne(\App\Models\State::class,'id','state_id')->select('id','name');
	}
}
