<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\JobListingTitleModel;
use App\Models\JobPostNationality;
use App\Models\JobPostLanguage;
use App\Models\Language;

class JobPost extends Model
{
	protected $table = "job_posts";
   	protected $guarded = [];
   	// protected $hidden = ['job_listing_title_id'];

   	
   	/*public function getJobListingTitleIdAttribute($value){
   		// dd($value);
   		return JobListingTitleModel::find($value)->first();
   	}*/

   	public function languages(){
   		$data = $this->hasMany(JobPostLanguage::class,'job_post_id','id')
   			->select('id','language_id','job_post_id');
   		return $data;
   	}


   	public function nationalities(){
   		$data = $this->hasMany(JobPostNationality::class,'job_post_id','id')
   			->select('id','nationality_id','job_post_id');
   		return $data;
   	}

   	public function pet_problems(){
   		return $this->hasMany(JobPostPetProblem::class,'job_post_id','id')
   			->select('id','pet_problem_id','job_post_id');
   	}

}
