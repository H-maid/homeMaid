@include('Admin.header')
    <div class="maidVerification ExplorerListPage">
        <div class="layout-content">
            <div class="layout-content-body">
                <div class="title-bar">
                    <h1 class="title-bar-title">
                      <span class="d-ib">Maid List</span>
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
                                <strong>Maid list</strong>
                            </div>
                            <div class="card-body">
                                <table id="demo-datatables-5" class="table table-striped table-bordered table-wrap dataTable" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Name</th>
                                            <th>Education</th>
                                            <th>Country</th>
                                            <th>State</th>
                                            <th>Certificate</th>
                                            <th>Agency name</th>
                                            <th>Experience</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Monika</td>
                                            <td>B.A</td>
                                            <td>India</td>
                                            <td>Haridwar</td>
                                            <td>3 month training </td>
                                            <td>Name 1</td>
                                            <td>2 year</td>
                                            <td class="">
                                                <button class="btn btn-danger btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#BlockUser">
                                                    <span class="btn-label">
                                                     <span class="icon icon-bank icon-lg icon-fw"></span>
                                                    </span>
                                                    Unverified
                                                </button>
                                                <button class="btn btn-success btn-sm btn-labeled" type="button"  data-toggle="modal" data-target="#UnBlockUser">
                                                    <span class="btn-label">
                                                     <span class="icon icon-edit icon-lg icon-fw"></span>
                                                    </span>
                                                    Verified
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Monika</td>
                                            <td>B.A</td>
                                            <td>India</td>
                                            <td>Haridwar</td>
                                            <td>3 month training </td>
                                            <td>Name 1</td>
                                            <td>2 year</td>
                                            <td class="">
                                                <button class="btn btn-danger btn-sm btn-labeled" type="button" data-toggle="modal" data-target="#BlockUser">
                                                    <span class="btn-label">
                                                     <span class="icon icon-bank icon-lg icon-fw"></span>
                                                    </span>
                                                    Unverified
                                                </button>
                                                <button class="btn btn-success btn-sm btn-labeled" type="button"  data-toggle="modal" data-target="#UnBlockUser">
                                                    <span class="btn-label">
                                                     <span class="icon icon-edit icon-lg icon-fw"></span>
                                                    </span>
                                                    Verified
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
    <div id="BlockUser" tabindex="-1" role="dialog" class="modal fade">
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
              <h4>Are you want to unverified this item...?</h4>
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

    <div id="UnBlockUser" tabindex="-1" role="dialog" class="modal fade">
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
              <h4>Are you want to verified this item...?</h4>
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