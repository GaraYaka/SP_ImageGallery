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



function fncallback() {
}


function SuccessMe() {
    albumFinal = "";
    try {

        
        //$("#AlbumTitle").html("&emsp;<small>" + albumDescFromQueryString + "</small>");


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
            
            albumTemp += '<div class="cbp-item">';
            albumTemp += '    <a href="' + imgURL + '" class="cbp-caption cbp-lightbox" data-title="' + imgDesc + '">';
            albumTemp += '        <div class="cbp-caption-defaultWrap">';
            albumTemp += '            <img src="' + imgURL + '" alt="">';
            albumTemp += '        </div>';
            albumTemp += '        <div class="cbp-caption-activeWrap">';
            albumTemp += '            <div class="cbp-l-caption-alignCenter">';
            albumTemp += '                <div class="cbp-l-caption-body">';
            albumTemp += '                    <div class="cbp-l-caption-title"></div>';
            albumTemp += '                    <div class="cbp-l-caption-desc">' + imgDesc + '</div>';
            albumTemp += '                </div>';
            albumTemp += '            </div>';
            albumTemp += '        </div>';
            albumTemp += '    </a>';
            albumTemp += '</div> ';

            albumFinal += albumTemp;

            var dcs = "";

        }


        var ccc = "";

        $("#js-grid-mosaic").html(albumFinal);


        $('#js-grid-mosaic').cubeportfolio({
            filters: '#js-filters-mosaic',
            loadMore: '#js-loadMore-mosaic',
            loadMoreAction: 'click',
            layoutMode: 'mosaic',
            sortToPreventGaps: true,
            mediaQueries: [{
                width: 1500,
                cols: 3
            }, {
                width: 1100,
                cols: 3
            }, {
                width: 800,
                cols: 3
            }, {
                width: 480,
                cols: 2
            }, {
                width: 320,
                cols: 1
            }],
            defaultFilter: '*',
            animationType: 'quicksand',
            gapHorizontal: 0,
            gapVertical: 0,
            gridAdjustment: 'responsive',
            caption: 'zoom',
            displayType: 'sequentially',
            displayTypeSpeed: 100,

            // lightbox
            lightboxDelegate: '.cbp-lightbox',
            lightboxGallery: true,
            lightboxTitleSrc: 'data-title',
            lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>',
        });


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



