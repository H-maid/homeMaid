<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class MaidFavouriteUnfavourite extends Model
{
	use SoftDeletes;
    protected $table = 'maid_favourite';
    protected $guarded = [];
}
