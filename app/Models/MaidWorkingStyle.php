<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidWorkingStyle extends Model
{
    use SoftDeletes;
   	protected $table = 'maid_working_style';
   	protected $fillable = ['user_id','style_id'];

	public function working_style_detail(){
		return $this->hasOne(\App\Models\WorkingStyle::class,'id','style_id')->select('id','name');
	}
}

