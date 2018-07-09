<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Request;
use App\Models\Admin;
use App\Models\Country;
use App\Models\State;
use App\Models\User;
use App\Http\Controllers\SendMail;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Hash;
use App;
class AdminController extends Controller
{
    public function index(Request $request){
        if (auth()->guard('admin')->attempt(['email' => $request->input('email'), 'password' => $request->input('password')])){
            return redirect('/admin/dashboard');
        }else{
             return redirect('/admin')->with('invalid_credentials',__('messages.adminMessages.invalid'));
        }
    }

    public function edit(Request $request){
        if($request->method() == 'GET'){
            return view('Admin.edit-profile');
        }
        if($request->method() == 'POST'){
            $email = $request->email;
            $mobile = $request->mobile;
            $profileImage = $request->file('profile');
            $location = $request->location;
            $about_me = $request->about_me;
            $address = $request->address;
            $Admin = Admin::where('id',Auth::guard('admin')->user()->id)->first();
            if($profileImage){
                $name = time().'_'.$profileImage->getClientOriginalName();
                if(App::environment() == 'local'){
                    $profileImage->move(public_path('/Admin/img'),$name);
                }
                if(App::environment() == 'server'){
                    $profileImage->move(public_path('/Admin/img'),$name);
                }
                $Admin->profile = $name;
            }
            $Admin->mobile = $mobile;
            $Admin->location = $location;
            $Admin->about_me = $about_me;
            $Admin->address = $address;
            $Admin->save();
            return redirect('admin/edit-profile');
        }
    }

    public function dashboard(Request $request){
        if(!Auth::guard('admin')->check())
            return redirect('admin');
        else
            $user = User::get_user_count(1);
            $maid = User::get_user_count(2);
            $agency = User::get_user_count(3);
            $today_registered = User::get_user_count(null,Carbon::now()->format('Y-m-d'));
            // dd($today_registered);
            $data = [
                'user' => $user,
                'maid' => $maid,
                'agency' => $agency,
                'today_registered' => $today_registered,
            ];
            return view('Admin.index',compact('data'));
    }

    public function logout(Request $request){
        $this->guard('admin')->logout();
        return redirect('/admin');
    }

    public function forget_password(Request $request){
        if($request->method() == 'GET'){
            return view('Admin.forgot-password');
        }
        if($request->method() == 'POST'){
            $email = $request->only('email');
            $data = Admin::where(['email' => $email])->first();
            $accessToken = md5(uniqid(rand(), true));
            if($data){
                $data->forget_token = $accessToken;
                $data->updated_at = time();
                $data->save();
                $data_arr = [
                    'email' => $data->email,
                    'link' => url('/admin/reset-password/').'/'.$accessToken,
                    'type' => 1 // for web
                ];
                if(SendMail::sendMail($data_arr) == 1){
                    return redirect('/admin/forget-password')->with('resetLinkSend',__('messages.adminMessages.resetLinkSend'));
                }else{
                    dd('error in sending email');
                }
            }else{
                return redirect('admin/forget-password')->with('invalid_email',__('messages.adminMessages.invalid_email'));
            }
        }
    }
    
    public function reset_password(Request $request){
        if($request->method() == 'GET'){
            $data = Admin::where('forget_token',$request->segment(3))->first();
            if($data){
                return view('Admin.reset-password');
            }else{
                return redirect('/admin/forget-password')->with('invalid_reset_token',__('messages.adminMessages.invalid_reset_token'));
            }
        }

        if($request->method() == 'POST'){
           $password = $request->password;
           $token = $request->token;
           $Admin = Admin::where(['forget_token' => $token])->first();
           $Admin->password = Hash::make($password);
           $Admin->forget_token = '';
           $Admin->save();
           return redirect('/admin')->with('password_reset_success',__('messages.adminMessages.password_reset_success'));
        }
    }

    public function profile(Request $request){
        if($request->method() == 'GET'){
            return view('Admin.profile');
        }
    }

    public function change_password(Request $request){
        switch($request->method()){
            case 'GET':
                return view('Admin.changePassword');
                break;
            case 'POST':
                $Admin = Admin::where('id',Auth::guard('admin')->user()->id)->first();
                $Admin->password = Hash::make($request->password);
                $Admin->save();
                return redirect('admin/change-password')->with('password_changed',__('messages.adminMessages.password_changed'));
                break;
        }

        if($request->method() == 'GET'){
            return view('Admin.profile');
        }
    }

    public function check(Request $request){
        if(Hash::check($request->old_password,Auth::guard('admin')->user()->password) == 'true'){
            return 1;
        }else{
            return 0;
        }
    }

    protected function guard($guard){

        return Auth::guard($guard);
    }

    public function addInfo(Request $request){
        switch($request->method()){
            case 'GET':
                return view('Admin.addInfo');
                break;
        }
    }
    

    public function info_list(Request $request){
        switch($request->method()){
            case 'GET':
                return view('Admin.addInfoList');
                break;
            case 'POST':
                $Admin = Admin::where('id',Auth::guard('admin')->user()->id)->first();
                $Admin->password = Hash::make($request->password);
                $Admin->save();
                return redirect('admin/change-password')->with('password_changed',__('messages.adminMessages.password_changed'));
                break;
        }
    }



    
}
