<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MaidApplyAgency extends Model
{
 	use SoftDeletes;
	protected $table = 'maid_apply_agency';
	protected $guarded = [];
}
