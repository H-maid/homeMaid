@include('Admin/header')

    <div class="addInfoPage ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">Information Management</span>
                    </h1>
                </div>
                <div class="row gutter-xs">
                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Add nationality</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="Nationality">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm save_nationality" type="button" data-toggle="modal"  
                            data-target="#addInfo">Save
                          </button>
                          <a href="{{url('admin/info_list/nationality')}}" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Add languages</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="language">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#addInfo">Save</button>
                          <a href="addInfoList.php" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Add Education</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="Education">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#addInfo">Save</button>
                          <a href="addInfoList.php" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Add Work Status</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="Work status">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#addInfo">Save</button>
                          <a href="addInfoList.php" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Pet problem</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="pet problem">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#addInfo">Save</button>
                          <a href="addInfoList.php" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Add Skills</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="Skills">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#addInfo">Save</button>
                          <a href="addInfoList.php" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-header bg-primary">
                        <strong>Add Job choice/Job Listing name</strong>
                      </div>
                      <div class="card-body">
                        <div class="card-search">
                          <div class="card-search-box">
                            <form action="#">
                              <div class="form-group form-group-sm">
                                <div class="input-with-icon">
                                  <input class="form-control input-thick" type="text" placeholder="job choice">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="card-heading">
                          <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#addInfo">Save</button>
                          <a href="addInfoList.php" class="btn btn-info btn-sm" type="button">View list</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

            </div>
        </div>
    </div>

    @include('Admin.footer')
    
    <div id="addInfo" tabindex="-1" role="dialog" class="modal fade">
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
              <span class="text-info icon icon-check-circle icon-5x"></span>
              <h3 class="text-info">Info</h3>
              <h4>Are you want to add this item</h4>
              <div class="m-t-lg">
                <button class="btn btn-info" data-dismiss="modal" type="button">Continue</button>
                <button class="btn btn-default" data-dismiss="modal" type="button">Cancel</button>
              </div>
            </div>
          </div>
          <div class="modal-footer"></div>
        </div>
      </div>      
    </div>

    

    <script type="text/javascript">
      
      $('.save_nationality').click(function(){

      });
    </script>