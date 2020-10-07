<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="other_reports.aspx.cs" Inherits="CBNLMS.other_reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Customized Reports   </h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item active" aria-current="page">Other Special Report</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
		<section class="content">
                  <div class="row">
                        <div class="col-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"><b>Consolidated Reports</b></h4>
                                    <p class="text-muted mb-4">
                                        Select a report to View or Download
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-pink"></i>CONSOLIDATED CACS REPORT</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></a></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED CACS REPORT(By Bank)</td>
                                                    <td class="border-0"><a href="con_bank_view.php"><button type="button" href="con_bank_view.php" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"></a><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED CACS REPORT(By Project)  </td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>RECEIVALE</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>MOVEMENT SCHEDULE</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--table responsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                        <div class="col-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"><b>Outstanding Reports</b></h4>
                                    <p class="text-muted mb-4">
                                        Select a report to View or Download
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-pink"></i>CONSOLIDATED OUTSTANDING CACS REPORT</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></a></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED OUTSTANDING CACS REPORT(By Bank)</td>
                                                    <td class="border-0"><button type="button" href="../index.html" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED OUTSTANDING CACS REPORT(By Project)  </td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>RECEIVALE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>MOVEMENT SCHEDULE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--table responsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"><b>Repayment Reports</b></h4>
                                    <p class="text-muted mb-4">
                                        Select a report to View or Download
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-pink"></i>CONSOLIDATED REPAYMENT REPORT</td>
                                                    <td class="border-0"><a href="repayment_bank_view.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></a></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED REPAYMENT REPORT(By Bank)</td>
                                                    <td class="border-0"><a href="repayment_bank_view.php"><button type="button" href="../index.html" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="repayment_bank_view.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED REPAYMENT REPORT(By Project)  </td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>RECEIVALE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>MOVEMENT SCHEDULE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--table responsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                        <div class="col-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"><b>Due Date Reports</b></h4>
                                    <p class="text-muted mb-4">
                                        Select a report to View or Download
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-pink"></i>OUTSTANDING CACS REPORT</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></a></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>OUTSTANDING CACS REPORT(By Bank)</td>
                                                    <td class="border-0"><button type="button" href="../index.html" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>OUTSTANDING CACS REPORT(By Project)  </td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>RECEIVALE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>MOVEMENT SCHEDULE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--table responsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"><b>Amortization Reports</b></h4>
                                    <p class="text-muted mb-4">
                                        Select a report to View or Download
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-pink"></i>CONSOLIDATED CACS REPORT</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></a></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED CACS REPORT(By Bank)</td>
                                                    <td class="border-0"><a href="con_bank_view.php"><button type="button" href="con_bank_view.php" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"></a><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED CACS REPORT(By Project)  </td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>RECEIVALE</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>MOVEMENT SCHEDULE</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--table responsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                        <div class="col-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"><b>Depreciation Reports</b></h4>
                                    <p class="text-muted mb-4">
                                        Select a report to View or Download
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-pink"></i>CONSOLIDATED OUTSTANDING CACS REPORT</td>
                                                    <td class="border-0"><a href="consolidated_View.php"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></a></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED OUTSTANDING CACS REPORT(By Bank)</td>
                                                    <td class="border-0"><button type="button" href="../index.html" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>CONSOLIDATED OUTSTANDING CACS REPORT(By Project)  </td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>RECEIVALE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-0"><i class="mdi mdi-circle-outline mr-1 text-success"></i>MOVEMENT SCHEDULE</td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-basic">View</button></td>
                                                    <td class="border-0"><button type="button" class="btn btn-primary waves-effect waves-light" id="sa-title">Download</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--table responsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                    </div>
            </section>
            </div>
            </div>
    
</asp:Content>
