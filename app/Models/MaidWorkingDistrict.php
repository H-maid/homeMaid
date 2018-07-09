<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class MaidWorkingDistrict extends Model
{
    use SoftDeletes;
	protected $table = "maid_working_district";
	protected $fillable = ['user_id','district_id'];
	
    public function district_detail(){
		return $this->hasOne(\App\Models\District::class,'id','district_id')->select('id','name');
	}
}
