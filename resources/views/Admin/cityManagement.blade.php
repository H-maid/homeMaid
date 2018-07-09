@include('Admin.header')
    <div class="addAreaPage ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">City Management</span>
                      /<small><a href="addDist.php">Back to district list</a></small>
                    </h1>
                </div>
                <div class="row gutter-xs mb-20">
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                          <button class="btn btn-default btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#addCity">
                                  <span class="btn-label">
                                   <span class="icon icon-plus icon-lg icon-fw"></span>
                                  </span>
                                  Add New City
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
                                <strong>City list</strong>
                            </div>
                            <div class="card-body">
                                <table id="demo-datatables-5" class="table table-striped table-bordered table-nowrap dataTable" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th class="sr_no">Sr. No.</th>
                                            <th>Country</th>
                                            <th>State</th>
                                            <th>District</th>
                                            <th>City</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                      @foreach($city as $key => $value)
                                        <tr>
                                            <td>{{++$key}}</td>
                                            <td>{{ucfirst($country->name)}}</td>
                                            <td>{{$State->name}}</td>
                                            <td>{{$District->name}}</td>
                                            <td>{{$value->name}}</td>
                                            <td>
                                                <button class="btn btn-danger btn-sm btn-labeled delete_city_button" type="button" data-toggle="modal" data-target="#deleteCity" data-city-id = "{{$value->id}}">
                                                    <span class="btn-label">
                                                     <span class="icon icon-bank icon-lg icon-fw"></span>
                                                    </span>
                                                    Delete
                                                </button>
                                                <!-- <button class="btn btn-info btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#addCity">
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
    <div id="addCity" tabindex="-1" role="dialog" class="modal fade">
     <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-primary">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span>
              <span class="sr-only">Close</span>
            </button>
            <h4 class="modal-title">Add/Edit City</h4>
          </div>
          <div class="modal-body provider-detail">
           <div class="row">
            <div class="col-xs-12">
             <form class="form form-horizontal">
                  <div class="form-group">
                      <div class="col-md-8">
                          <label for="" class="control-label">Country</label>
                          <input type="hidden" name="country_id" class="country_id" value="{{$country->id}}">
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
                          <label for="" class="control-label">District name</label>
                          <input type="hidden" class="district_id" name="district_id" value="{{$District->id}}">
                          <input id="" value="{{$District->name}}" readonly="readonly" class="form-control" type="text">
                      </div>
                  </div>
                  <div class="form-group">
                      <div class="col-md-8">
                          <label for="" class="control-label">City name</label>
                          <input id="" class="form-control city_name" type="text">
                          <div class="city_name_err"></div>
                      </div>
                  </div>
                  <div class="form-group">
                      <div class=" col-sm-8  col-md-8 ">
                          <button class="btn btn-primary save_city" type="button">Save</button>
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
    
    <div id="deleteCity" tabindex="-1" role="dialog" class="modal fade">
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
                <button class="btn btn-danger delete_city_confirm" data-dismiss="modal" type="button">Continue</button>
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
        $('.save_city').click(function(){
          var country_id = $('.country_id').val()
          var state_id = $('.state_id').val()
          var district_id = $('.district_id').val()
          var city_name = $('.city_name').val();

          console.log(country_id);
          console.log(state_id);
          console.log(district_id);
          
          $('.city_name_err').empty();

          if(city_name.length < 1){
            $('.city_name_err').text('Please enter city name').css('color','red');
            return false;
          }
          var request = $.ajax({
              url : "{{url('api/check_city')}}",
              type : "POST",
              data : {
                "_token" :"{{csrf_token()}}",
                "country_id" : country_id , 
                "state_id" : state_id , 
                "district_id" : district_id,
                'city_name' : city_name
              }
          })
          request.done(function(data){
            console.log(data);
            if(data == 0){
              $('.city_name_err').text('City already exist.').css('color','red');
            }else{
              $('.city_name_err').text('City added successfully.').css('color','green');
              location.reload();
            }
          });

          request.fail(function(data){

          });
        });

        $('.delete_city_button').click(function(){
          var city_id = $(this).attr('data-city-id');
          $('.delete_city_confirm').attr('data-city-id',city_id);
        });

        $('.delete_city_confirm').click(function(){

          var city_id = $(this).attr('data-city-id');
          console.log(city_id);
          var request = $.ajax({
              url : "{{url('api/delete_city')}}",
              type : "POST",
              data : {"_token" :"{{csrf_token()}}","city_id" : city_id}
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