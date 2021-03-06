<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>HouseMaid</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="manifest" href="manifest.json">
    <link rel="mask-icon" href="safari-pinned-tab.svg" color="#2c3e50">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,400italic,500,700">
    <link rel="stylesheet" href="{{asset('Admin/css/vendor.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/elephant.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/application.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/profile.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/demo.min.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('Admin/css/product.min.css')}}">
    <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
 
</head>


  <body class="layout layout-header-fixed">
    <div class="layout-header">
      <div class="navbar navbar-default">
        <div class="navbar-header">
          <a class="navbar-brand navbar-brand-center" href="#">
            <img class="navbar-brand-logo" src="{{asset('Admin/img/logo.png')}}" alt="Elephant">
          </a>
          <button class="navbar-toggler visible-xs-block collapsed" type="button" data-toggle="collapse" data-target="#sidenav">
            <span class="sr-only">Toggle navigation</span>
            <span class="bars">
              <span class="bar-line bar-line-1 out"></span>
              <span class="bar-line bar-line-2 out"></span>
              <span class="bar-line bar-line-3 out"></span>
            </span>
            <span class="bars bars-x">
              <span class="bar-line bar-line-4"></span>
              <span class="bar-line bar-line-5"></span>
            </span>
          </button>
          <button class="navbar-toggler visible-xs-block collapsed" type="button" data-toggle="collapse" data-target="#navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="arrow-up"></span>
            <span class="ellipsis ellipsis-vertical">
              <img class="ellipsis-object" width="32" height="32" src="{{asset('Admin/img/0180441436.jpg')}}" alt="Teddy Wilson">
            </span>
          </button>
        </div>
        <div class="navbar-toggleable">
          <nav id="navbar" class="navbar-collapse collapse">
            <button class="sidenav-toggler hidden-xs" title="Collapse sidenav ( [ )" aria-expanded="true" type="button">
              <span class="sr-only">Toggle navigation</span>
              <span class="bars">
                <span class="bar-line bar-line-1 out"></span>
                <span class="bar-line bar-line-2 out"></span>
                <span class="bar-line bar-line-3 out"></span>
                <span class="bar-line bar-line-4 in"></span>
                <span class="bar-line bar-line-5 in"></span>
                <span class="bar-line bar-line-6 in"></span>
              </span>
            </button>
            <ul class="nav navbar-nav navbar-right">
              
              <li class="dropdown">
                <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                  <span class="icon-with-child hidden-xs">
                    <span class="icon icon-bell-o icon-lg"></span>
                    <span class="badge badge-danger badge-above right">7</span>
                  </span>
                  <span class="visible-xs-block">
                    <span class="icon icon-bell icon-lg icon-fw"></span>
                    <span class="badge badge-danger pull-right">7</span>
                    Notifications
                  </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg">
                  <div class="dropdown-header">
                    
                    <h5 class="dropdown-heading">Recent Notifications</h5>
                  </div>
                  <div class="dropdown-body">
                    <div class="list-group list-group-divided custom-scrollbar">
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <span class="icon icon-exclamation-triangle bg-warning rounded sq-40"></span>
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">35 min</small>
                            <h5 class="notification-heading">Update Status</h5>
                            <p class="notification-text">
                              <small class="truncate">Failed to get available update data. To ensure the proper functioning of your application, update now.</small>
                            </p>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <span class="icon icon-flag bg-success rounded sq-40"></span>
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">43 min</small>
                            <h5 class="notification-heading">Account Contact Change</h5>
                            <p class="notification-text">
                              <small class="truncate">A contact detail associated with your account teddy.wilson, has recently changed.</small>
                            </p>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <span class="icon icon-exclamation-triangle bg-warning rounded sq-40"></span>
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">1 hr</small>
                            <h5 class="notification-heading">Failed Login Warning</h5>
                            <p class="notification-text">
                              <small class="truncate">There was a failed login attempt from "192.98.19.164" into the account teddy.wilson.</small>
                            </p>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <img class="rounded" width="40" height="40" src="{{asset('Admin/img/0310728269.jpg')}}" alt="Daniel Taylor">
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">4 hr</small>
                            <h5 class="notification-heading">Daniel Taylor</h5>
                            <p class="notification-text">
                              <small class="truncate">Like your post: "Everything you know about Bootstrap is wrong".</small>
                            </p>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <img class="rounded" width="40" height="40" src="{{asset('Admin/img/0872116906.jpg')}}" alt="Emma Lewis">
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">8 hr</small>
                            <h5 class="notification-heading">Emma Lewis</h5>
                            <p class="notification-text">
                              <small class="truncate">Like your post: "Everything you know about Bootstrap is wrong".</small>
                            </p>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <img class="rounded" width="40" height="40" src="{{asset('Admin/img/0601274412.jpg')}}" alt="Sophia Evans">
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">8 hr</small>
                            <h5 class="notification-heading">Sophia Evans</h5>
                            <p class="notification-text">
                              <small class="truncate">Like your post: "Everything you know about Bootstrap is wrong".</small>
                            </p>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item" href="#">
                        <div class="notification">
                          <div class="notification-media">
                            <img class="rounded" width="40" height="40" src="{{asset('Admin/img/0180441436.jpg')}}" alt="Teddy Wilson">
                          </div>
                          <div class="notification-content">
                            <small class="notification-timestamp">9 hr</small>
                            <h5 class="notification-heading">Teddy Wilson</h5>
                            <p class="notification-text">
                              <small class="truncate">Published a new post: "Everything you know about Bootstrap is wrong".</small>
                            </p>
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="dropdown-footer">
                    <a class="dropdown-btn" href="#">See All</a>
                  </div>
                </div>
              </li>
              <li class="dropdown hidden-xs">
                <button class="navbar-account-btn" data-toggle="dropdown" aria-haspopup="true">

                  @if(!Auth::guard('admin')->user()->profile)
                    <img class="profile-avetar-img" width="36" height="36" src="{{asset('Admin/img/0180441436.jpg')}}" alt="{{Auth::guard('admin')->user()->name}}">
                  @else
                    @if(App::environment() == 'local')
                      <img class="profile-avetar-img" width="36" height="36" src="{{asset('Admin/img')}}/{{Auth::guard('admin')->user()->profile}}" alt="{{Auth::guard('admin')->user()->name}}">
                    @else
                      <img class="profile-avetar-img" width="36" height="36" src="{{url('public/Admin/img')}}/{{Auth::guard('admin')->user()->profile}}" alt="{{Auth::guard('admin')->user()->name}}">
                    @endif
                  @endif
                    @if(Auth::guard('admin')->user())
                      {{Auth::guard('admin')->user()->name}}
                    @endif
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                  
                
                  <li><a href="{{url('admin/profile')}}">Profile</a></li>
                  <li><a href="{{url('/admin/logout')}}">Sign out</a></li>
                </ul>
              </li>

              <li class="visible-xs-block">
                <a href="contacts.html">
                  <span class="icon icon-users icon-lg icon-fw"></span>
                  Contacts
                </a>
              </li>
              <li class="visible-xs-block">
                <a href="profile.html">
                  <span class="icon icon-user icon-lg icon-fw"></span>
                  Profile
                </a>
              </li>
              <li class="visible-xs-block">
                <a href="login-1.html">
                  <span class="icon icon-power-off icon-lg icon-fw"></span>
                  Sign out
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>





    <div class="layout-main">
      <div class="layout-sidebar">
        <div class="layout-sidebar-backdrop"></div>
        <div class="layout-sidebar-body">
          <div class="custom-scrollbar">
            <nav id="sidenav" class="sidenav-collapse collapse">
              <ul class="sidenav">
                
                <li class="sidenav-heading">Navigation</li>
                <li class="sidenav-item dashboardPageNav">
                  <a href="{{url('admin/dashboard')}}" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-home"></span>
                    <span class="sidenav-label">Dashboard</span>
                  </a>
                </li>
                <li class="sidenav-item profilePageNav">
                  <a href="{{url('admin/profile')}}" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-user"></span>
                    <span class="sidenav-label">Profile</span>
                  </a>
                </li>
                
                <li class="sidenav-item has-subnav accountNav">
                  <a href="#" aria-haspopup="true" aria-expanded="true">
                    <span class="sidenav-icon icon icon-users"></span>
                    <span class="sidenav-label">Account management</span>
                  </a>
                  <ul class="sidenav-subnav collapse" aria-expanded="true" style="">
                    <li class="accNav-a"><a href="{{url('admin/user-management')}}">User</a></li>
                    <li class="accNav-b"><a href="{{url('admin/maid-management')}}">Maid</a></li>
                    <li class="accNav-c"><a href="{{url('admin/agency-management')}}">Agency</a></li>
                  </ul>
                </li>


                <li class="sidenav-item has-subnav verificationNav">
                  <a href="#" aria-haspopup="true" aria-expanded="true">
                    <span class="sidenav-icon icon icon-users"></span>
                    <span class="sidenav-label">Verification</span>
                  </a>
                  <ul class="sidenav-subnav collapse" aria-expanded="true" style="">
                    <li class="verifyNav-a"><a href="{{url('admin/maid-verification')}}">Maid verification</a></li>
                    <li class="verifyNav-b"><a href="{{url('admin/agency-verification')}}">Agency verification</a></li>
                  </ul>
                </li>

                <li class="sidenav-item areaNav">
                  <a href="{{url('admin/addCountry')}}" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-globe"></span>
                    <span class="sidenav-label">Area management</span>
                  </a>
                </li>
                <li class="sidenav-item infoNav">
                  <a href="{{url('admin/addInfo')}}" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-eye"></span>
                    <span class="sidenav-label">Add info</span>
                  </a>
                </li>


               <!--  <li class="sidenav-item paymentNav">
                  <a href="paymentMgt.php" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-dollar"></span>
                    <span class="sidenav-label">Payment management</span>
                  </a>
                </li>
                <li class="sidenav-item chatPageNav">
                  <a href="chatMgt.php" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-user"></span>
                    <span class="sidenav-label">Chat management</span>
                  </a>
                </li>
                <li class="sidenav-item ratingPageNav">
                  <a href="ratingMgt.php" aria-haspopup="true">
                    <span class="sidenav-icon icon icon-star"></span>
                    <span class="sidenav-label">Rating management</span>
                  </a>
                </li>
 -->
          </ul>
            </nav>
          </div>
        </div>
      </div>