<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidSkill extends Model
{
 	use SoftDeletes;
   	protected $table = 'maid_skill';
   	protected $fillable = ['user_id','skill_id'];

	public function skill_detail(){
		return $this->hasOne(\App\Models\Skill::class,'id','skill_id')->select('id','name');
	}
}