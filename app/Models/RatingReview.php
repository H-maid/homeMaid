<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RatingReview extends Model
{
    use SoftDeletes;
	protected $table = 'rating_review';
	protected $guarded = [];
}
