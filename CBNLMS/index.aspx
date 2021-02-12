<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CBNLMS.index" %>

<!DOCTYPE html>

<html xmlns="https//www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta name="robots" content="noindex">
<meta name="googlebot" content="noindex">
        <title>DFD LMS- Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A premium admin dashboard template by Mannatthemes" name="description" />
        <meta content="Mannatthemes" name="author" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="account-body accountbg" style="color:#E2EFF3">
    <form id="form1" runat="server">
         <!-- Log In page -->
        <div class="row vh-100 ">
            <div class="col-12 align-self-center">
                <div class="auth-page">
                    <div class="card auth-card shadow-lg">
                        <div class="card-body">
                            <div class="px-3">
                                <div class="auth-logo-box">
                                    <a href="analytics/analytics-index.html" class="logo logo-admin"><img src="assets/images/logo-sm.png" height="55" alt="logo" class="auth-logo"></a>
                                </div><!--end auth-logo-box-->
                                
                                <div class="text-center auth-logo-text">
                                    <h4 class="mt-0 mb-3 mt-5">DFD Loan Management Console</h4>
                                    <p class="text-muted mb-0">Sign in to continue to DFD Scheme Console.</p>  
                                </div> <!--end auth-logo-text-->  

                                
                                <div class="form-horizontal auth-form my-4" action="/cbn/crypto/" method="POST" onsubmit="return loginvalidation();">
        
                                    <div class="form-group">
                                        <label for="username">Email</label>
                                        <div class="input-group mb-3">
                                            <span class="auth-form-icon">
                                                <i class="dripicons-user"></i> 
                                            </span>                                                                                                              
                                            <asp:TextBox ID="TextBox2" runat="server" aria-describedby="inputGroupPrepend" type="password" class="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>                                                     
                                        </div>                                    
                                    </div><!--end form-group-->
                                                    <div class="invalid-feedback">
                                                        Please choose a username.
                                                    </div>
                                    <div class="form-group">
                                        <label for="userpassword">Password</label>                                            
                                        <div class="input-group mb-3"> 
                                            <span class="auth-form-icon">
                                                <i class="dripicons-lock"></i> 
                                            </span>  
                                            <asp:TextBox ID="TextBox1" runat="server" type="password" class="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>                                                     
                                        </div>                               
                                    </div><!--end form-group--> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" ErrorMessage="*Email & Password Required" ControlToValidate="TextBox1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    <div class="form-group row mt-4">
                                        <div class="col-sm-6">
                                            <div class="custom-control custom-switch switch-success">
                                                <input type="checkbox" class="custom-control-input" id="customSwitchSuccess">
                                                <label class="custom-control-label text-muted" for="customSwitchSuccess">Remember me</label>
                                            </div>
                                        </div><!--end col--> 
                                        <div class="col-sm-6 text-right">
                                            <a href="auth-recover-pw.html" class="text-muted font-13"><i class="dripicons-lock"></i> Forgot password?</a>                                    
                                        </div><!--end col--> 
                                    </div><!--end form-group--> 
        
                                    <div class="form-group mb-0 row">
                                        <div class="col-12 mt-2">
                                        <a> <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-round btn-block waves-effect waves-light" type="submit" Text="Log In" OnClick="Button1_Click" UseSubmitBehavior="false" OnClientClick="this.value='Requesting Access. Please wait...';"></asp:Button></a>
                                        </div><!--end col--> 
                                    </div> <!--end form-group-->                           
                                </div><!--end form-->
                            </div><!--end /div-->
                            
                            <div class="col-md-12 " runat="server" id="alert">
                                    <div class="alert alert-danger" style="margin-top:9px" role="alert">Invaid Username/Password</div>
                                </div>
                    </div><!--end card-->
                   
                </div><!--end auth-page-->
            </div><!--end col-->           
        </div><!--end row-->
            </div>
        <!-- End Log In page -->>
    </form>
    <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>
        <script src="assets/js/waves.min.js"></script>
        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>

</bod>
</html>
