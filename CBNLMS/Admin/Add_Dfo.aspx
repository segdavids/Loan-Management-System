<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Add_Dfo.aspx.cs" Inherits="CBNLMS.Add_Dfo1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">

function copyText() {
    src = document.getElementById("source").value;
    dest = document.getElementById("dest").value;
    dest.value = src.value;
        }
    function loandis() {
        nof = document.getElementById("nof").value;
        eop = document.getElementById("eop").value;
        ad = document.getElementById("ad").value;
      
    document.getElementById("ad").value = eop*nof;
}
         function expout() {
        tothec = document.getElementById("nof").value;
        yielder = document.getElementById("yield").value;
        eout = document.getElementById("eout").value;
      
    document.getElementById("eout").value = yielder*tothec;
        }
         function exprep() {
        buyp = document.getElementById("bp").value;
        eout = document.getElementById("eout").value;
     
    document.getElementById("erep").value = eout*buyp;
}

</script>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#forms').addClass('active');
         $("dropothers").attr("aria-expanded","true");
     $('#dfoform').addClass('active');
 });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">ABP Commodity Summary</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">DFO</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

          <!-- Main content -->
		<section class="content">
             <div class="row">
                  <div class="col-12">
                     <div class="box box-default">
                         <div class="box-header with-border">
                             <h4 class="box-title">Upload Bulk Data</h4>
                             <h6 class="box-subtitle">Kindly use ONLY the upload template provided. Download template to use it.</h6>
                         </div>
                         <!-- /.box-header -->
                         <div class="box-body">
                             <div class="box-body">
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                         <asp:FileUpload ID="FileUpload1" type="file" class="form-control" runat="server" />
                                                  <span style="color:red">*Select File to Upload</span>
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                         <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download Template" OnClick="download_template" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Upload DFO Records" OnClick="upload_record" />
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                 </div>
                             </div>
                             <!-- /.box-body -->
                         </div>
                     </div>
                 </div>

         
                    <div class="col-12">
			  <div class="box box-default">
				<div class="box-header with-border">
				  <h4 class="box-title">Single Entry | DFO Form</h4>
				  <h6 class="box-subtitle">Add data by filling the form with desired information.</h6>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
                                                
                                                <div class="row">
                                                    <div class="col-lg-8 offset-1">
                                                         <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Select Office/Location</label>
                                                             <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList5" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                        
                                                         <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Commodity</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Commodity Association</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList4" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Farming Season</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">No. of Farmers</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" required step="0.01" placeholder="Number of Farmers"  id="source" onkeyup="copyText()">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Total Hectre</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" required step="0.01" placeholder="Total Hectres of Land"  id="nof" onkeyup="loandis()">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">EOP Amount</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" step="0.01" placeholder="EOP Amount"  id="eop" onkeyup="loandis()">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Loan Amount</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" step="0.01" placeholder="Loan Amount Disbursed"  id="ad" disabled="disabled">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Yield</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" required type="number" step="0.01" placeholder="Yield"  id="yield" onkeyup="expout()">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Expected Output</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" step="0.01" placeholder="Expected Output"  id="eout" onkeyup="expout()" disabled="disabled">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Loan Duration</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" step="0.01" placeholder="Loan Duration"  id="ld" onKeyPress="copyText()">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Buying Price</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" step="0.01" placeholder="Buyong Price"  id="bp" onkeyup="exprep()">

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Expected Repayment</label>
                                                            <div class="col-sm-10">
                                                                   <input runat="server" class="form-control" type="number" step="0.01" required placeholder="Expectded Repayment"  id="erep" onkeyup="exprep()" disabled="disabled">

                                                            </div>
                                                        </div>
                                                       <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Repayment Structure</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                     

                                              <div class="box-footer">
                                                <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Add Data" OnClick="save_data" />
                                                <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Clear Form" OnClick="Button1_Click" />
                                            </div>
                                        </div>
                                           
                                                    </div>
                                                </div>                                     
                                            </div><!--end card-body-->
                                        </div><!--end card-->
                                    </div><!--end col-->
                                </div><!--end row-->   
            </section>
            </div>
      </div>
    
</asp:Content>
