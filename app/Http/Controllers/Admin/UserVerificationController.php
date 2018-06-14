<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UserVerificationController extends Controller
{
    public function agency_verification(Request $request){
    	if($request->method() == 'GET'){
            return view('Admin.agencyVerification');
        } 
    }

    public function maid_verification(Request $request){
    	if($request->method() == 'GET'){
            return view('Admin.maidVerification');
        } 
    }
}
