<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Response;
use App\Models\City;
use App\Models\Country;
use App\Models\Nationality;
use App\Models\State;
use App\Models\District;

class AjaxController extends Controller
{
   public function check_state_under_country(Request $request){
      $country_id = $request->country_id;
      $state_name = $request->state_name;
      $State = State::firstOrNew(['country_id' => $country_id , 'name' => $state_name]);
      if($State->exists){
         return '0';
      }else{
         $State->save();
         return '1';
      }
   }

   public function delete_state(Request $request){
      $state_id = $request->state_id;
      if( State::find($state_id)->delete()){
         return '1';
      }else{
         return '0';
      }
   }

   public function check_district_under_state(Request $request){
   	$state_id = $request->state_id;
      $district_name = $request->district_name;
   	$country_id = $request->country_id;
   	$District = District::firstOrNew(['state_id' => $state_id ,'country_id' => $country_id, 'name' => $district_name]);
   	if($District->exists){
   		return '0';
   	}else{
   		$District->save();
   		return '1';
   	}
   }

   public function delete_district(Request $request){
      $district_id = $request->district_id;
      if( District::find($district_id)->delete()){
         return '1';
      }else{
         return '0';
      }
   }


   public function check_city(Request $request){
      $city_name = $request->city_name;
      $country_id = $request->country_id;
      $district_id = $request->district_id;
      $state_id = $request->state_id;
      $City = City::firstOrNew(['name' => $city_name , 'country_id' => $country_id , 'state_id' => $state_id , 'district_id' => $district_id]);
      if($City->exists){
         return '0';
      }else{
         $City->save();
         return '1';
      }
   }

   public function delete_city(Request $request){
      $city_id = $request->city_id;
      if( City::find($city_id)->delete()){
         return '1';
      }else{
         return '0';
      }
   }

}
