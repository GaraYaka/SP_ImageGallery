'use strict';

var context = SP.ClientContext.get_current();
var user = context.get_web().get_currentUser();

var hostweburl;
var appweburl;
var appContextSite;
var list;
var web;

// This code runs when the DOM is ready and creates a context object which is needed to use the SharePoint object model
$(document).ready(function () {

    SP.SOD.executeFunc('sp.js', 'SP.ClientContext', getUrl);

    document.getElementById("s4-titlerow").style.display = 'none';

});

function getUrl() {
    hostweburl = getQueryStringParameter("SPHostUrl");
    appweburl = getQueryStringParameter("SPAppWebUrl");
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
    list = web.get_lists().getByTitle("AlbumConfig");//gets the album with the Config details
    albumList = list.getItems(new SP.CamlQuery());
    context.load(albumList);
    context.executeQueryAsync(SuccessMe, onFail);
}

var albumList, albumName, jobListing, albumCover, albumDesc;

var albumFinal, albumTemp;


function SuccessMe() {

    try {
        albumFinal = "";
        var newsEnumerator = albumList.getEnumerator();
        var output = "";
        var imgURL = "";
        var imgDesc = "";
        var jobID = "";
        albumTemp = "";

        while (newsEnumerator.moveNext()) {//create the albums

            albumTemp = "";

            albumName = newsEnumerator.get_current().get_item("AlbumName");
            albumCover = newsEnumerator.get_current().get_item("AlbumCover");
            albumDesc = newsEnumerator.get_current().get_item("AlbumDesc");

            if (albumDesc == null) {
                albumDesc = "";
            }

            albumTemp += " <li class='portfolio-item2' data-id='id-0'>";
            albumTemp += "<div>";
            albumTemp += "  <span class='image-block'>";
            albumTemp += "  <a class='image-zoom' href='ViewAlbum.aspx?AlbumName=" + albumName + "&SPAppWebUrl=" + appweburl + "&SPHostUrl=" + hostweburl + "&AlbumDesc=" + albumDesc + "' rel='' title='" + albumName + "'>";
            albumTemp += "      <img width='225' height='140' src='" + albumCover + "' alt='Wall-E' title='" + albumName + "' />";
            albumTemp += "  </a>";
            albumTemp += "</span>";
            albumTemp += "<div class='home-portfolio-text'>";
            albumTemp += "   <h2 class='post-title-portfolio'><a href='ViewAlbum.aspx?AlbumName=" + albumName + "&SPAppWebUrl=" + appweburl + "&SPHostUrl=" + hostweburl + "&AlbumDesc=" + albumDesc + "' rel='bookmark'>" + albumDesc + "</a></h2>";
            albumTemp += "   <p class='post-subtitle-portfolio'>" + albumDesc + "</p>";
            albumTemp += "</div>";
            albumTemp += "</div>";
            albumTemp += "</li>";


            albumFinal += albumTemp;

            var dcs = "";

        }

        var ccc = "";

        $("#albumRender").html(albumFinal);//write it to page

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

