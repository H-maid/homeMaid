@include('Admin.header')
    <div class="addAreaPage ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">District Management</span>
                      /<small><a href="{{url('admin')}}/{{$country->id}}/state_management">Back to state list</a></small>
                    </h1>
                </div>
                <div class="row gutter-xs mb-20">
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                          <button class="btn btn-default btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#addDist">
                                  <span class="btn-label">
                                   <span class="icon icon-plus icon-lg icon-fw"></span>
                                  </span>
                                  Add New Dist.
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row gutter-xs">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-actions">
                                    <button type="button" class="card-action card-toggler" title="Collapse"></button>
                                    <button type="button" class="card-action card-reload" title="Reload"></button>

                                </div>
                                <strong>District list</strong>
                            </div>
                            <div class="card-body">
                                <table id="demo-datatables-5" class="table table-striped table-bordered table-nowrap dataTable" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Country</th>
                                            <th>State</th>
                                            <th>District</th>
                                            <th>Add City</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        @foreach($District as $key => $value)
                                            <tr>
                                                <td>{{++$key}}</td>
                                                <td>{{ucfirst($country->name)}}</td>
                                                <td>{{ucfirst($State->name)}}</td>
                                                <td>{{$value->name}}</td>
                                                <td>
                                                  <a href="{{$value->id}}/city_management" class="btn btn-info btn-sm btn-labeled" type="button">
                                                    <span class="btn-label">
                                                     <span class="icon icon-plus icon-lg icon-fw"></span>
                                                    </span>
                                                    Add city
                                                  </a>
                                                </td>
                                                <td>
                                                    <button class="btn btn-danger btn-sm btn-labeled delete_district_button" type="button" data-toggle="modal" data-target="#deleteDist" data-district-id = "{{$value->id}}">
                                                        <span class="btn-label">
                                                         <span class="icon icon-bank icon-lg icon-fw"></span>
                                                        </span>
                                                        Delete
                                                    </button>
                                                    <!-- <button class="btn btn-info btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#addDist">
                                                        <span class="btn-label">
                                                         <span class="icon icon-edit icon-lg icon-fw"></span>
                                                        </span>
                                                        Edit
                                                    </button> -->
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    @include('Admin.footer')
    <div id="addDist" tabindex="-1" role="dialog" class="modal fade">
     <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-primary">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span>
              <span class="sr-only">Close</span>
            </button>
            <h4 class="modal-title">Add/Edit District</h4>
          </div>
          <div class="modal-body provider-detail">
           <div class="row">
            <div class="col-xs-12">
             <form class="form form-horizontal">
                  <div class="form-group">
                      <div class="col-md-8">
                          <label for="" class="control-label">Country</label>
                          <input type="hidden" class="country_id" name="country_id" value="{{$country->id}}">
                          <input id="" value="{{$country->name}}" class="form-control" readonly="readonly" type="text">
                      </div>
                  </div>
                  <div class="form-group">
                      <div class="col-md-8">
                          <label for="" class="control-label">State name</label>
                          <input type="hidden" class="state_id" name="state_id" value="{{$State->id}}">
                          <input id="" value="{{$State->name}}" class="form-control" readonly="readonly" type="text">
                      </div>
                  </div>
                  <div class="form-group">
                      <div class="col-md-8">
                          <label for="" class="control-label ">District name</label>
                          <input id="" class="form-control district_name" type="text">
                          <div class="district_name_err"></div>
                      </div>
                  </div>
                  <div class="form-group">
                      <div class=" col-sm-8  col-md-8 ">
                          <button class="btn btn-primary save_district" type="button">Save</button>
                      </div>
                  </div>
              </form>  
             </div> 
           </div>
          </div>
          <div class="modal-footer"></div>
        </div>
      </div>      
    </div>
    
    <div id="deleteDist" tabindex="-1" role="dialog" class="modal fade">
     <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span>
              <span class="sr-only">Close</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="text-center">
              <span class="text-danger icon icon-times-circle icon-5x"></span>
              <h3 class="text-danger">Danger</h3>
              <h4>Are you want to delete this item</h4>
              <div class="m-t-lg">
                <button class="btn btn-danger delete_district_confirm" data-dismiss="modal" type="button">Continue</button>
                <button class="btn btn-default" data-dismiss="modal" type="button">Cancel</button>
              </div>
            </div>
          </div>
          <div class="modal-footer"></div>
        </div>
      </div>      
    </div>

    

    <script type="text/javascript">

    $(document).ready(function(){
        $('.sr_no').click();
        $('.save_district').click(function(){
            var state_id = $('.state_id').val();
            var district_name = $('.district_name').val();
            var country_id = $('.country_id').val();
            console.log(country_id);
            $('.district_name_err').empty();
            if(district_name.length < 1){
                console.log('empty');
                $('.district_name_err').text('Please enter district name').css('color','red');
                return false;
            }
            var request = $.ajax({
              url : "{{url('api/check_district_under_state')}}",
              type : "POST",
              data : {"_token" :"{{csrf_token()}}",
                "state_id" : state_id , 
                "country_id" : country_id , 
                "district_name" : district_name
              }
            })
            request.done(function(data){
                console.log(data);
                if(data == 0){
                  $('.district_name_err').text('District already exist.').css('color','red');
                }else{
                  $('.district_name_err').text('District added successfully.').css('color','green');
                  location.reload();
                }
            });

            request.fail(function(data){

            });
        });

        $('.delete_district_button').click(function(){
            var district_id = $(this).attr('data-district-id');
            $('.delete_district_confirm').attr('data-district-id',district_id);
        });

        $('.delete_district_confirm').click(function(){

            var district_id = $(this).attr('data-district-id');
            console.log(district_id);
            var request = $.ajax({
              url : "{{url('api/delete_district')}}",
              type : "POST",
              data : {"_token" :"{{csrf_token()}}","district_id" : district_id}
            })
            request.done(function(data){
                console.log(data);
                if(data == 0){

                }else{

                  location.reload();
                }
            });

            request.fail(function(data){

            });
        });
      });

    </script>