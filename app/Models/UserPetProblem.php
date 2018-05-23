<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class UserPetProblem extends Model
{
	use SoftDeletes;
	protected $table = 'user_pet_problems';
	protected $fillable = ['user_id','pet_problem_id'];

	public function pet_problem_detail(){
		return $this->hasOne(\App\Models\PetProblem::class,'id','pet_problem_id')->select('id','name');
	}
}
