<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class RequestByUserToAgencyForMaid extends Model
{
 	use SoftDeletes;
	protected $table = "request_by_user_to_agency_for_maid";
	protected $guarded = [];

}
