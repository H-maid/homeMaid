@include('Admin/header')

    <div class="addInfoPage ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">({{ucfirst(Request::segment(3))}}) list</span>
                      /<small><a href="addInfo.php">Back to page</a></small>
                    </h1>
                </div>
                <div class="row gutter-xs">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-actions">
                                    <button type="button" class="card-action card-toggler" title="Collapse"></button>
                                    <button type="button" class="card-action card-reload" title="Reload"></button>

                                </div>
                                <strong>Added ({{ucfirst(Request::segment(3))}}) list</strong>
                            </div>
                            <div class="card-body">
                                <table id="demo-datatables-5" class="table table-striped table-bordered table-nowrap dataTable" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Info name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>India</td>
                                            <td>
                                                <button class="btn btn-danger btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#deleteInfo">
                                                    <span class="btn-label">
                                                     <span class="icon icon-bank icon-lg icon-fw"></span>
                                                    </span>
                                                    Delete
                                                </button>
                                                <button class="btn btn-info btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#editInfo">
                                                    <span class="btn-label">
                                                     <span class="icon icon-edit icon-lg icon-fw"></span>
                                                    </span>
                                                    Edit
                                                </button>
                                            </td>
                                        </tr>
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
    
    <div id="editInfo" tabindex="-1" role="dialog" class="modal fade">
     <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-primary">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">×</span>
              <span class="sr-only">Close</span>
            </button>
            <h4 class="modal-title">Edit (info name)</h4>
          </div>
          <div class="modal-body provider-detail">
           <div class="row">
            <div class="col-xs-12">
             <form class="form form-horizontal">
                  <div class="form-group">
                      <div class="col-md-8">
                          <label for="" class="control-label">(info name)</label>
                          <input id="" class="form-control" type="text">
                      </div>
                  </div>
                  <div class="form-group">
                      <div class=" col-sm-8  col-md-8 ">
                          <button class="btn btn-primary " type="submit">Save</button>
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
    
    <div id="deleteInfo" tabindex="-1" role="dialog" class="modal fade">
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
                <button class="btn btn-danger" data-dismiss="modal" type="button">Continue</button>
                <button class="btn btn-default" data-dismiss="modal" type="button">Cancel</button>
              </div>
            </div>
          </div>
          <div class="modal-footer"></div>
        </div>
      </div>      
    </div>

    