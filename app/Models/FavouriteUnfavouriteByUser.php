<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FavouriteUnfavouriteByUser extends Model
{
    use SoftDeletes;
	protected $table = "user_favourite";
	protected $guarded = [];
}
