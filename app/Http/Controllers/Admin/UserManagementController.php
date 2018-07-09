<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Request;
use App\Models\Admin;
use App\Models\User;
use App\Http\Controllers\SendMail;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Hash;
use App;
class UserManagementController extends Controller
{
    
    public function user_management(Request $request){
        if($request->method() == 'GET'){
            $data = User::orderBy('id','desc')->where('user_type',1)->get();
            return view('Admin.user-list',compact('data'));
        } 
    }

    public function maid_management(Request $request){
        if($request->method() == 'GET'){
            $data = User::orderBy('id','desc')->where('user_type',2)->get();
            return view('Admin.maid-list',compact('data'));
        } 
    }

    public function agency_management(Request $request){
        if($request->method() == 'GET'){
            $data = User::orderBy('id','desc')->where('user_type',3)->get();
            return view('Admin.agency-list',compact('data'));
        } 
    }

    public function block_unblock_user(Request $request){
        $user_id = $request->user_id;
        $status = $request->status;
        $user = User::find($user_id);
        $user->status = $status;
        $user->save();
        switch ($status) {
            case '0':
                return redirect('admin/user-management')->with('block_unblock_success',__('messages.adminMessages.block_success_user'));
                break;
            case '1':
                return redirect('admin/user-management')->with('block_unblock_success',__('messages.adminMessages.unblock_success_user'));
                break;
        }
    }

    public function block_unblock_maid(Request $request){
        $user_id = $request->user_id;
        $status = $request->status;
        $user = User::find($user_id);
        $user->status = $status;
        $user->save();
        switch ($status) {
            case '0':
                return redirect('admin/maid-management')->with('block_unblock_success',__('messages.adminMessages.block_success_maid'));
                break;
            case '1':
                return redirect('admin/maid-management')->with('block_unblock_success',__('messages.adminMessages.unblock_success_maid'));
                break;
        }
    }

    public function block_unblock_agency(Request $request){
        $user_id = $request->user_id;
        $status = $request->status;
        $user = User::find($user_id);
        $user->status = $status;
        $user->save();
        switch ($status) {
            case '0':
                return redirect('admin/agency-management')->with('block_unblock_success',__('messages.adminMessages.block_success_agency'));
                break;
            case '1':
                return redirect('admin/agency-management')->with('block_unblock_success',__('messages.adminMessages.unblock_success_agency'));
                break;
        }
    }

}
