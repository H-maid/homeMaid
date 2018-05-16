<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserImage extends Model
{
	use SoftDeletes;
	protected $table = 'user_images';
	protected $fillable = ['user_id', 'image','status_by_admin'];

	public function getImageAttribute($value){
		if(empty($value)){
			$response = [
				'big' => "",
				'small' => "",
				'thumbnail' => "",
			];
			return json_decode(json_encode($response),True);
		}else{
			if(strpos($value, 'facebook.com')){
				$response = [
					'big' => $value,
					'small' => $value,
					'thumbnail' => $value,
				];
			}else{
				$response = [
					'big' => url('/public/Images').'/big'.$value,
					'small' => url('/public/Images').'/small'.$value,
					'thumbnail' => url('/public/Images').'/thumbnail'.$value,
				];
			}
			return json_decode(json_encode($response),True);
		}
	}

}