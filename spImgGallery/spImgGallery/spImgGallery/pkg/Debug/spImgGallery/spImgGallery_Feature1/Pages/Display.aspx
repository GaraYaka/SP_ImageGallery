<%@ Page Language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>


    <%-- Album Template Resources -- Start --%>

    <link type="text/css" href="../TemplateAssets/css/styles.css" rel="stylesheet" media="all" />
    <script type="text/javascript" src="../TemplateAssets/js/jquery.min_1.6.4.js"></script>
    <script src="../TemplateAssets/js/jquery.quicksand.js" type="text/javascript"></script>
    <script src="../TemplateAssets/js/jquery.easing.js" type="text/javascript"></script>
    <script src="../TemplateAssets/js/script.js" type="text/javascript"></script>
    <script src="../TemplateAssets/js/jquery.prettyPhoto.js" type="text/javascript"></script>
    <link href="../TemplateAssets/css/prettyPhoto.css" rel="stylesheet" type="text/css" />

    <%-- Album Template Resources -- End --%>

    <SharePoint:ScriptLink Name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" src="../Scripts/Display.js"></script>

    <%-- hide the top nav bar css --%>
    <style type="text/css">
        #s4-titlerow {
            display: none !important;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            var link = document.createElement('link');
            link.type = 'image/x-icon';
            link.rel = 'shortcut icon';
            link.href = '../Content/favicon.ico';
            document.getElementsByTagName('head')[0].appendChild(link);
        });
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="full" Title="loc:full" />

    <div class="wrapper">
        <div class="portfolio-content">
            <h1 class="title-page">Image Gallery</h1>

            <%-- content render inside this div --%>
            <ul class="portfolio-area" id="albumRender">
            </ul>
        </div>
    </div>
</asp:Content>
