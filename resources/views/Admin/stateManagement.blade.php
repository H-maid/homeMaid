@include('Admin/header')
    <div class="addAreaPage ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">State Management</span>
                      /<small><a href="{{url('admin/addCountry')}}">Back to country list</a></small>
                    </h1>
                </div>
                <div class="row gutter-xs mb-20">
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                          <button class="btn btn-default btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#addState">
                                  <span class="btn-label">
                                   <span class="icon icon-plus icon-lg icon-fw"></span>
                                  </span>
                                  Add New State
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
                                <strong>State list</strong>
                            </div>
                            <div class="card-body">
                                <table id="demo-datatables-5" class="table table-striped table-bordered table-nowrap dataTable" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th class='sr_no'>Sr. No.</th>
                                            <th>Country</th>
                                            <th>State</th>
                                            <th>Add district</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                      @foreach($State as $key => $value)
                                        <tr>
                                            <td>{{++$key}}</td>
                                            <td>{{$value->country_name}}</td>
                                            <td>{{$value->name}}</td>
                                            <td>
                                              <a href="{{url('admin/')}}/{{$country->id}}/{{$value->id}}/district_management" class="btn btn-info btn-sm btn-labeled" type="button">
                                                <span class="btn-label">
                                                 <span class="icon icon-plus icon-lg icon-fw"></span>
                                                </span>
                                                Add dist.
                                              </a>
                                            </td>
                                            <td>
                                                <button class="btn btn-danger btn-sm btn-labeled delete_state_button" type="button" data-toggle="modal" data-target="#deleteState" data-state-id = "{{$value->id}}">
                                                    <span class="btn-label">
                                                     <span class="icon icon-bank icon-lg icon-fw"></span>
                                                    </span>
                                                    Delete
                                                </button>
                                                <!-- <button class="btn btn-info btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#addState">
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

    @include('Admin/footer')
    
    <div id="addState" tabindex="-1" role="dialog" class="modal fade">
     <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-primary">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span>
              <span class="sr-only">Close</span>
            </button>
            <h4 class="modal-title">Add/Edit State</h4>
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
                          <input class="state_name" class="form-control" type="text">
                          <div class="state_name_err"></div>
                      </div>
                  </div>
                  <div class="form-group">
                      <div class=" col-sm-8  col-md-8 ">
                          <button class="btn btn-primary save_state" type="button">Save</button>
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
    
    <div id="deleteState" tabindex="-1" role="dialog" class="modal fade">
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
                <button class="btn btn-danger delete_state_confirm" data-state-id = '' data-dismiss="modal" type="button">Continue</button>
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
        $('.save_state').click(function(){
          var country_id = $('.country_id').val()
          var state_name = $('.state_name').val();
          $('.state_name_err').empty();

          if(state_name.length < 1){
            console.log('empty');
            $('.state_name_err').text('Please enter state name').css('color','red');
            return false;
          }
          console.log(country_id);
          var request = $.ajax({
              url : "{{url('api/check_state_under_country')}}",
              type : "POST",
              data : {"_token" :"{{csrf_token()}}","country_id" : country_id , "state_name" : state_name}
          })
          request.done(function(data){
            console.log(data);
            if(data == 0){
              $('.state_name_err').text('State already exist.').css('color','red');
            }else{
              $('.state_name_err').text('State added successfully.').css('color','green');
              location.reload();
            }
          });

          request.fail(function(data){

          });
        });

        $('.delete_state_button').click(function(){
          var state_id = $(this).attr('data-state-id');
          $('.delete_state_confirm').attr('data-state-id',state_id);
        });

        $('.delete_state_confirm').click(function(){

          var state_id = $(this).attr('data-state-id');
          console.log(state_id);
          var request = $.ajax({
              url : "{{url('api/delete_state')}}",
              type : "POST",
              data : {"_token" :"{{csrf_token()}}","state_id" : state_id}
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