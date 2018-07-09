@include('Admin/header')
    <div class="addAreaPage ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">Choose Country</span>
                    </h1>
                </div>
                <div class="row gutter-xs">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-body">
                              <form id="form" action="" method="POST">
                                {{csrf_field()}}
                                <div class="col-sm-4 col-sm-offset-4 text-center">
                                   <img src="img/users.png" class="img-responsive margin-auto" alt="">
                                    <div class="clearfix text-center">
                                      <select id="form-control-6" name="country_id" class="form-control country_id">
                                        @foreach($Country as $key => $value)
                                          <option value="{{$value->id}}">{{$value->name}}</option>
                                        @endforeach
                                      </select>
                                    </div>
                                    <div class="clearfix text-center m-t-lg">
                                       <!-- <a href="{{url('admin/state_management')}}" class="btn btn-danger" type="button">Add state</a> -->

                                       <button class="btn btn-danger add_state" type="button" >Add state</button>
                                    </div>
                                </div>
                              </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    @include('Admin/footer')

    <script type="text/javascript">
        $(document).on('click','.add_state',function(){
            var country_id = $('.country_id :selected').val();
            var action = "{{url('admin')}}"+"/"+country_id+"/"+"state_management";
            $('#form').attr('action',action).submit();
            console.log(action);
        });
    </script>
    