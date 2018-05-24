<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class JobChoice extends Model
{
   use SoftDeletes;
   protected $table = 'job_choices';
   protected $fillable = ['name'];

}
