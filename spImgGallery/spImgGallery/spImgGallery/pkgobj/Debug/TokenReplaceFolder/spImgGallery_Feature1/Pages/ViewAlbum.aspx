<%@ Page Language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <SharePoint:ScriptLink Name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" src="../Scripts/ViewAlbum.js"></script>

    <%-- hide the top nav bar css --%>
    <style type="text/css">
        #s4-titlerow {
            display: none !important;
        }
    </style>

    <%-- favicon script --%>
    <script type="text/javascript">
        $(document).ready(function () {
            var link = document.createElement('link');
            link.type = 'image/x-icon';
            link.rel = 'shortcut icon';
            link.href = '../Content/favicon.ico';
            document.getElementsByTagName('head')[0].appendChild(link);
        });
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Gallery</title>

    <link rel="stylesheet" type="text/css" href="../AlbumViewAssets/css/style.css" />
    <script src="../AlbumViewAssets/js/modernizr.custom.70736.js"></script>
    <noscript>
        <link rel="stylesheet" type="text/css" href="../AlbumViewAssets/css/noJS.css" />
    </noscript>
    <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="full" Title="loc:full" />

    <body>
        <div class="container">

            <!-- Codrops top bar -->
            <div class="codrops-top clearfix">
                <a href="../">
                    <strong>&laquo; Back </strong>
                </a>
            </div>
            <!--/ Codrops top bar -->

            <div class="main">
                <header class="clearfix">

                    <h1><span id="spanAlbumName"></span><span id="spanAlbumDesc"></span></h1>
                    <div class="support-note">
                        <span class="note-ie">Sorry, only modern browsers.</span>
                    </div>

                </header>

                <div class="gamma-container gamma-loading" id="gamma-container">
                    <ul class="gamma-gallery" id="albumRender">
                        <img src="../AlbumViewAssets/images/loader_light.gif" />
                    </ul>
                    <div class="gamma-overlay"></div>
                </div>
            </div>
            <!--/main-->
        </div>
        <script src="../AlbumViewAssets/js/jquery.min_1.8.2.js"></script>
        <script src="../AlbumViewAssets/js/jquery.masonry.min.js"></script>
        <script src="../AlbumViewAssets/js/jquery.history.js"></script>
        <script src="../AlbumViewAssets/js/js-url.min.js"></script>
        <script src="../AlbumViewAssets/js/jquerypp.custom.js"></script>
        <script src="../AlbumViewAssets/js/gamma.js"></script>
        <script type="text/javascript">

            $(function () {

                var GammaSettings = {
                    // order is important!
                    viewport: [{
                        width: 1200,
                        columns: 5
                    }, {
                        width: 900,
                        columns: 4
                    }, {
                        width: 500,
                        columns: 3
                    }, {
                        width: 320,
                        columns: 2
                    }, {
                        width: 0,
                        columns: 2
                    }]
                };

                Gamma.init(GammaSettings, fncallback);


                // Example how to add more items (just a dummy):

                function fncallback() {
                }

            });

        </script>
    </body>
</asp:Content>
