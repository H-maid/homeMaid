<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserLanguage extends Model
{
   use SoftDeletes;
	protected $table = 'user_languages';
	protected $fillable = ['user_id','language_id'];

	public function language_detail(){
		return $this->hasOne(\App\Models\Language::class,'id','language_id')->select('id','name');
	}
}
