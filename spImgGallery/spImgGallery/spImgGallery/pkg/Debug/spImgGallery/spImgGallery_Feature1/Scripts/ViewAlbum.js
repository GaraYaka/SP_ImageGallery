'use strict';

//var context = SP.ClientContext.get_current();
//var user = context.get_web().get_currentUser();

var hostweburl;
var appweburl;
var appContextSite;
var list;
var web;
var albumNameFromQueryString;
var albumDescFromQueryString;

// This code runs when the DOM is ready and creates a context object which is needed to use the SharePoint object model
$(document).ready(function () {
    

    SP.SOD.executeFunc('sp.js', 'SP.ClientContext', getUrl);

    document.getElementById("s4-titlerow").style.display = 'none';


});

function getUrl() {
    hostweburl = getQueryStringParameter("SPHostUrl");
    appweburl = getQueryStringParameter("SPAppWebUrl");
    albumNameFromQueryString = getQueryStringParameter("AlbumName");
    albumDescFromQueryString = getQueryStringParameter("AlbumDesc");
    hostweburl = decodeURIComponent(hostweburl);
    appweburl = decodeURIComponent(appweburl);
    var scriptbase = hostweburl + "/_layouts/15/";
    $.getScript(scriptbase + "SP.Runtime.js",
        function () {
            $.getScript(scriptbase + "SP.js",
            function () { $.getScript(scriptbase + "SP.RequestExecutor.js", execOperation); }
            );
        }
    );
}

function execOperation() {

    context = new SP.ClientContext(appweburl);
    var factory = new SP.ProxyWebRequestExecutorFactory(appweburl);
    context.set_webRequestExecutorFactory(factory);
    appContextSite = new SP.AppContextSite(context, hostweburl);
    web = appContextSite.get_web();
    context.load(web);
    list = web.get_lists().getByTitle(albumNameFromQueryString);//album name from query string
    albumList = list.getItems(new SP.CamlQuery());
    context.load(albumList);
    context.executeQueryAsync(SuccessMe, onFail);
}

var albumList, albumName, jobListing, albumCover;

var albumFinal, albumTemp;


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

function fncallback() {
}


function SuccessMe() {
    albumFinal = "";
    try {

        
        $("#spanAlbumName").html(albumNameFromQueryString); 
        $("#spanAlbumDesc").html(decodeURIComponent(albumDescFromQueryString));


        var newsEnumerator = albumList.getEnumerator();
        var output = "";
        var imgURL = "";
        var imgDesc = "";
        var jobID = "";
        var albumTemp = "";

        while (newsEnumerator.moveNext()) {

            albumTemp = "";

            var imgURL = newsEnumerator.get_current().get_item("FileRef");
            var imgDesc = newsEnumerator.get_current().get_item("Description");

            if (imgDesc == null) {

                imgDesc = "-";

            }

            //albumTemp += " <div class='box'>";
            //albumTemp += " <div class='boxInner'>";
            //albumTemp += " <img src='" + imgURL + "'/>";
            //albumTemp += " <div class='titleBox'>" + imgDesc + "</div>";
            //albumTemp += " </div>";
            //albumTemp += " </div>";

            albumTemp += " <li>";
            albumTemp += "  <div data-alt='img03' data-description='<h3>" + imgDesc + "</h3>' data-max-width='1800' data-max-height='1350'>";
            albumTemp += "         <div data-src='" + imgURL + "' data-min-width='1300'></div>";
            albumTemp += "        <div data-src='" + imgURL + "' data-min-width='1000'></div>";
            albumTemp += "        <div data-src='" + imgURL + "' data-min-width='700'></div>";
            albumTemp += "       <div data-src='" + imgURL + "' data-min-width='300'></div>";
            albumTemp += "       <div data-src='" + imgURL + "' data-min-width='200'></div>";
            albumTemp += "  <div data-src='" + imgURL + "' data-min-width='140'></div>";
            albumTemp += "   <div data-src='" + imgURL + "'></div>";
            albumTemp += "  <noscript>";
            albumTemp += "      <img src='" + imgURL + "' alt='img03'/>";
            albumTemp += "  </noscript>";
            albumTemp += " </div>";
            albumTemp += " </li>";


            albumFinal += albumTemp;

            var dcs = "";

        }


        var ccc = "";

        $("#albumRender").html(albumFinal);
        Gamma.init(GammaSettings, fncallback);

    } catch (e) {
        onFail();
    }

}

function onFail(sender, args) {
    alert(args.get_message());
}

function getQueryStringParameter(paramToRetrieve) {
    var params =
        document.URL.split("?")[1].split("&");
    for (var i = 0; i < params.length; i = i + 1) {
        var singleParam = params[i].split("=");
        if (singleParam[0] == paramToRetrieve)
            return singleParam[1];
    }
}



function redirectToDetailsPage(jobID) {
    window.location.href = "DisplayDetails.aspx?JobID=" + jobID + "&SPHostUrl=" + hostweburl + "&SPAppWebUrl=" + appweburl;
}



