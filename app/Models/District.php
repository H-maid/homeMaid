<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class District extends Model
{
    use SoftDeletes;
	protected $table = 'district';
	protected $fillable = ['name','country_id'];
}
