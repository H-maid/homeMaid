<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class HireMaid extends Model
{
	use SoftDeletes;
   	protected $table = 'user_hired_maid';
   	protected $guarded = [];
   	protected $hidden = ['hire_to','hire_by','deleted_at'];

   	public function maid_detail(){
   		return $this->hasOne(\App\Models\User::class,'id','hire_to');
   	}

      public function userImages(){
         return $this->hasMany(\App\Models\UserImage::class,'user_id','hire_to');
      }

   	/*public function getCreatedAtAttribue($value){
   		return Carbon::parse($value)->format('d-M-Y h:i:s A');
   	}

   	public function getUpdatedAtAttribue($value){
   		return Carbon::parse($value)->format('d-M-Y h:i:s A');
   	}*/
}
