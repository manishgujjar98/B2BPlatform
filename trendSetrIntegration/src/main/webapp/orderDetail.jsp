<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Orders Details</title>
    <link rel="shortcut icon" href="">
    <!-- Material design icons -->
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.red-purple.min.css">
    <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css" />
    <!-- Material design fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
    <!-- bootstrap date and time picker-->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker-standalone.css" />
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.css" />
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- custom styles -->
    <link rel="stylesheet" href="css/app.css">
    <!--[if IE]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <style>
    .admin-header {
        background-color: black;
    }
    
    .logo-container h1 a {
        color: white;
        text-decoration: none;
    }
    
    .mdl-layout__header .mdl-layout__drawer-button:active {
        background-color: transparent !important;
        box-shadow: none !important;
        opacity: .5;
    }
    
    .mdl-layout__header {
        background-color: transparent !important;
        box-shadow: none !important;
    }
    
    .b2b-header-margin {
        position: relative;
        top: 110px;
    }
    
    .panel-footer h5 {
        color: grey;
    }
    
    .flex-container {
        padding: 0;
        margin: 0;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        justify-content: space-between;
    }
    
    .flex-item {}
    
    h2 {
        font-size: 16px;
    }
    
    .order-header img {
        width: 60px;
    }
    
    .order-info img {
        width: 70px;
    }
        
        
        
        /*custom css*/
        
    .form-control-cus{
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            }
      
    </style>
</head>

<body>
    <!-- header -->
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header class="mdl-layout__header">
            <div class="mdl-layout__header-row " style="background:#000000; border-bottom:  solid #FFFFFF;">
                <span class="mdl-layout-title" style=" margin-left:auto; margin-right:auto; display:block; position: absolute;
width: 100%; left: 0; top: 0;text-align: center; padding-top:25px;">TrendSetr</span>
                <div class="mdl-layout-spacer"></div>
                <nav class="mdl-navigation mdl-layout__header--transparent">
                    <button id="demo-menu-lower-right" class="mdl-button mdl-js-button mdl-button--icon">
                        <i> <a class="mdl-navigation__link" href="#" style=" width:32px; height:32px; background-color:#FFFFFF;"></a></i>
                    </button>
                    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu " for="demo-menu-lower-right" style="top:15px">
                        <li style=" margin-left:35px;">
                            <div style=" height: 100px; width: 100px; border-radius: 50%; 
background-color: #7D7D7D; "></div>
                        </li>
                        <li style="text-align:center; color:#000000; font-weight: bold;">Merchant Name</li>
                        <li class="mdl-menu__item" style="text-align:center;">View TrendSetr Profile</li>
                        <li class="mdl-menu__item" style="text-align:center;">Sign Out</li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="mdl-layout__drawer" style="overflow:hidden; background:rgba(0, 0, 0, 0.75); border:none; ">
            <span class="mdl-layout-title" style=" top:85px; right:-25px;"><div style=" height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D; "></div></span>
            <span class="mdl-layout-title" style="top:85px; color:#FFFFFF">Merchant Name</span>
            <nav class="mdl-navigation" style="padding-top: 86px;">
                <a class="mdl-navigation__link" href="">Dashboard</a>
                <a class="mdl-navigation__link" href="">Product Management</a>
                <a class="mdl-navigation__link" href="">Order Management</a>
                <a class="mdl-navigation__link" href="">Ad Management</a>
                <a class="mdl-navigation__link" href="">Account Settings</a>
            </nav>
        </div>
    </div>
    <!--header -->
    <!-- user settings -->
    <section class="col-xs-12 b2b-header-margin" id="order-detail">
        <section class="">
            <section class="">
                <section class="">
                    <!-- user settings content -->
                    <div class="order-history-invoice-div">
                        <h4 class="pull-left"> Order Detail</h4>
                        <h4 class="pull-right"><a href="">Back</a></h4>
                        <div class="clearfix"></div>
                    </div>
                    <section class="col-sm-8 settings-content invoice">
                        <section>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="order-header">
                                        <img src="images/mike2.png" alt="orderimage">
                                        <span>Kith NYC</span>
                                    </div>
                                </div>
                                <form action="" method="post">
                                    <div class="panel-body text-center">
                                        <!-- order-details -->
                                        <div class="order-details">
                                            <div class="order-info"> <span class="pull-left"><img  class="img" src="images/mike2.png" alt="info"></span> <span class="item-details ">Kith NYC Tank Top</span> <span class="col-sm-5">&nbsp;</span> <span class="price pull-right"> <span>Order Total</span> <span>$74.99</span> </span>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="shipping-info">
                                                <h2 class="order-date"><b>Order Placed: January 31, 2017</b></h2>
                                                <div class="col-sm-3">
                                                    <h2 class="label-header"><b>Shipping Address</b></h2>
                                                         Address line1 &nbsp; &nbsp; Address line2 &nbsp; 
                                                        <br> Phone Number &nbsp; City &nbsp; &nbsp; State &nbsp; &nbsp;
                                                        <br> Country &nbsp; &nbsp;  Zip
                                                        <br>
                                                    <h2 class="label-header"><b>Size</b></h2>
                                                    <div>
                                                        <select name="" id="sub-category" class="form-control-cus" required="">
                                                            <option value="">Choose another address</option>
                                                            <option value="">Choose another address 1</option>
                                                            <option value="">Choose another address 2</option>
                                                        </select>
                                                    </div>
                                                    </div>
                                                <div class="col-sm-3">
                                                    <h2 class="label-header"><b>Merchant Address</b></h2>
                                                         Address line1 &nbsp; &nbsp; Address line2 &nbsp; 
                                                        <br> Phone Number &nbsp; City &nbsp; &nbsp; State &nbsp; &nbsp;
                                                        <br> Country &nbsp; &nbsp;  Zip
                                                        <br>
                                                    <h2 class="label-header"><b>Weight</b></h2>
                                                    <div>
                                                        <input type="text" name="weight" class="form-control" placeholder="Enter Weight">
                                                    </div>
                                                    </div>
                                                <div class="col-sm-6">
                                                    <br>
                                                    <h2 class="label-header"><b>Order Summary</b></h2>
                                                    <table class="table table-condensed table-stripped">
                                                        <tr>
                                                            <td>item(s) Subtotal:</td>
                                                            <td align="right">$74.50</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Shipping & Handling:</td>
                                                            <td align="right">$3.99</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Total before Tax:</td>
                                                            <td align="right">$77.99</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Estimated Tax to be collected:</td>
                                                            <td align="right">$4.5</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Grand Total</td>
                                                            <td align="right">$89.25</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- ./order-details -->
                                    </div>
                                </form>
                            </div>
                        </section>
                    </section>
                    <!-- ./user settings content -->
                    <!--  user settings menu -->
                    <section class="col-sm-4" id="shipping-container">
                        <section class="">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">
                                    <h3>TrendSetr Shipping</h3>
                                </div>
                                <div class="panel-body text-center">
                                    <h2 class="panel-heading">Pick Up</h2>
                                    <div class="">
                                        <div class="">
                                            <div>
                                                <div class="form-group">
                                                    <div class='input-group date' id='datetimepicker5'>
                                                        <input type='text' class="form-control" id='datetimepicker' />
                                                        <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-default pick-up mt20" data-target="" data-dismiss="">Pick Up</button>
                                    <h2 class="panel-heading">Drop Off</h2>
                                    <button class="btn btn-primary print-label">Print Label</button>
                                    <button class="btn btn-primary nearest-store"> Locate a nearest UPS Store</button>
                                </div>
                            </div>
                        </section>
                    </section>
                    <!-- ./ user settings menu -->
                </section>
            </section>
        </section>
    </section>
    <!-- ./user settings -->
    <div class="clearfix"></div>
    <!-- .gift -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="js/moment.js"></script>
    <script type="text/javascript" src="js/transition.js"></script>
    <script type="text/javascript" src="js/collapse.js"></script> -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <!-- Material desig nscript -->
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
    <script src="js/app.js"></script>
    <script>
    $('#datetimepicker').datetimepicker();
    </script>
</body>

</html>
