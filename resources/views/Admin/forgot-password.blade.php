<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>House maid</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="manifest" href="manifest.json">
    <link rel="mask-icon" href="safari-pinned-tab.svg" color="#2c3e50">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,400italic,500,700">
    <link rel="stylesheet" href="{{asset('Admin/css/vendor.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/elephant.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/application.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/login-2.min.css')}}">
  </head>
  <body>
    <div class="login">
      <div class="login-body">
        <a class="login-brand" href="#">
          <img class="img-responsive" src="{{asset('Admin/img/logo-blk.png')}}" alt="logo">
        </a>
        <div class="login-form">
          <form data-toggle="validator" action="{{url('/admin/forget-password')}}" method="POST">
            {{csrf_field()}}
            <span style="color: red">{{session('invalid_email')}}</span>
            <span style="color: red">{{session('invalid_reset_token')}}</span>
            <span style="color: green">{{session('resetLinkSend')}}</span>
            <div class="form-group">
              <label for="email">Enter Email</label>
              <input id="email" class="form-control" type="email" name="email" spellcheck="false" autocomplete="off" data-msg-required="Please enter your email address." required>
            </div>
            <button class="btn btn-primary btn-block" type="submit">Send</button>
          </form>
        </div>
      </div>
      
    </div>
     <script src="{{asset('Admin/js/vendor.min.js')}}"></script>
    <script src="{{asset('Admin/js/elephant.min.js')}}"></script>
    <script src="{{asset('Admin/js/application.min.js')}}"></script>
   
  </body>
</html>