<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidWorkExperience extends Model
{
 	use SoftDeletes;
   	protected $table = 'maid_work_experiences';
   	protected $fillable = ['user_id','start_date','end_date'];

}