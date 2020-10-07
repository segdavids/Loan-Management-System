<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lockscreen.aspx.cs" Inherits="CBNLMS.Inputing.lockscreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
        <title>CBN LMS- LockScreen</title>
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
<body class="account-body accountbg">
    <form id="form1" runat="server">

            <!-- Log In page -->
            <div class="row vh-100 ">
                <div class="col-12 align-self-center">
                    <div class="auth-page">
                        <div class="card auth-card shadow-lg">
                            <div class="card-body">
                                <div class="px-3">
                                    <div class="auth-logo-box">
                                        <a href="../analytics/analytics-index.html" class="logo logo-admin"><img src="../assets/images/logo-sm.png" height="55" alt="logo" class="auth-logo"></a>
                                    </div><!--end auth-logo-box-->
                                    
                                    <div class="text-center auth-logo-text">
                                        <h4 class="mt-0 mb-3 mt-5">Enter Password to Regain Access</h4>
                                        <p class="text-muted mb-0">Hello <span id="firsname" runat="server"></span>, enter your password to unlock the screen !</p>  
                                    </div> <!--end auth-logo-text-->  

                                    
                                    <div class="form-horizontal auth-form my-4">
                                        <div class="user-thumb text-center m-b-30">
                                            <img src="../assets/images/users/user-2.jpg" class="rounded-circle img-thumbnail thumb-xl" alt="thumbnail">
                                            <h5><span id="fullname" runat="server"></span></h5>
                                        </div>   
                                        <div class="form-group">
                                            <label for="userpassword">Password</label>                                            
                                            <div class="input-group mb-3"> 
                                                <span class="auth-form-icon">
                                                    <i class="dripicons-lock"></i> 
                                                </span>                                                       
                                                <input type="password" required runat="server" class="form-control" id="userpassword" placeholder="Enter password"/>
                                            </div>                               
                                        </div><!--end form-group--> 
                                        
            
                                        <div class="form-group mb-0 row">
                                            <div class="form-group">
                                                
                                                <asp:Button ID="Button1" Text="Unlock" runat="server" class="btn btn-primary btn-round btn-block waves-effect waves-light" OnClick="unlock"/>    
                                            </div><!--end col--> 
                                        </div> <!--end form-group-->      
                                        <div class="col-md-12 " runat="server" id="alert">
                                    <div class="alert alert-danger" style="margin-top:9px" role="alert">Invaid Password</div>
                                </div>
                                    </div><!--end form-->
                                </div><!--end /div-->
                                
                                <div class="m-3 text-center text-muted">
                                    <p class="">Not you ? return  <a href="../../index.aspx" class="text-primary ml-2">Sign In</a></p>
                                </div>
                            </div><!--end card-body-->
                        </div><!--end card-->
                    </div><!--end auth-page-->
                </div><!--end col-->           
            </div><!--end row-->
            <!-- End Log In page -->

    </form>
 <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/metisMenu.min.js"></script>
        <script src="../assets/js/waves.min.js"></script>
        <script src="../assets/js/jquery.slimscroll.min.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.js"></script>

    </body>
</html>
