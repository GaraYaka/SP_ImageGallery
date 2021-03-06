﻿<%@ Page Language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <SharePoint:ScriptLink Name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />

    <meta charset="utf-8" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />-->
    <!--<link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />-->
    <!--<link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />-->
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="../assets/global/plugins/cubeportfolio/css/cubeportfolio.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="../assets/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="../assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../assets/pages/css/portfolio.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="../assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="../assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />

</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="full" Title="loc:full" />



    <!-- BEGIN HEADER & CONTENT DIVIDER -->
    <div class="clearfix"></div>
    <!-- END HEADER & CONTENT DIVIDER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
        <!--BEGIN CONTENT-->
        <div class="page-content-wrapper">
            <!--BEGIN CONTENT BODY-->

            <div class="page-content">
                <!-- BEGIN PAGE TITLE-->
                <h3 class="page-title">Portfolio 2</h3>
                <!-- END PAGE TITLE-->
                <!-- END PAGE HEADER-->
                <div class="portfolio-content portfolio-2">
                    <div id="js-grid-mosaic">
                       
                        <div class="cbp-item">
                            <a href="../Images/3.jpg" class="cbp-caption cbp-lightbox" data-title="Bolt UI<br>by Tiberiu Neamu">
                                <div class="cbp-caption-defaultWrap">
                                    <img src="../Images/3.jpg" alt="">
                                </div>
                                <div class="cbp-caption-activeWrap">
                                    <div class="cbp-l-caption-alignCenter">
                                        <div class="cbp-l-caption-body">
                                            <div class="cbp-l-caption-title">Bolt UI</div>
                                            <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>                       
                        
                    </div>
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
    <!-- END CONTENT -->
    <!-- BEGIN QUICK SIDEBAR -->
    <!-- END QUICK SIDEBAR -->
    </div>
       
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <!-- END FOOTER -->
    <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
    <!-- BEGIN CORE PLUGINS -->
    <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <!--<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
    <!--<script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>-->
    <!--<script src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>-->
    <!--<script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>-->
    <script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <!--<script src="../assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>-->
    <!--<script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>-->
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="../assets/global/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <!--<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>-->
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/portfolio-2.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <!--<script src="../assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>-->
    <!--<script src="../assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>-->
    <!--<script src="../assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>-->
    <!-- END THEME LAYOUT SCRIPTS -->


</asp:Content>
