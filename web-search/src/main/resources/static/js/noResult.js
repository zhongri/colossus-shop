/* product-search/1.0.2 noResult.js Date:2016-12-06 18:22:05 */
define("js/noResult.js",["js/pageInfo.js","js/template.js","js/utils.js","js/tools.js"],function(require,a){var c=require("js/pageInfo.js");var d=require("js/template.js");var e=require("js/utils.js");var f=require("js/tools.js");function g(){var a={p:902013,pin:c.pin,uuid:c.uuid,lid:c.areaId,lim:5,skus:"",ck:"ipLocation",ec:"utf-8"};$.ajax({url:"//diviner.jd.com/diviner",data:a,dataType:"jsonp"}).then(function(a){var b;a.success&&a.data.length>0&&(b=a.data.map(function(a){return a.sku}),$("#recNoResult").html(d.noResultRecommend.process(a)),f.priceNum(b,c.areaId,$("#recNoResult"),"J-rec-p-","{NUM}"),f.commentMeta(b,$("#recNoResult"),"p-rec-comm-","{NUM}"),e.exposeRecommend(a.impr),$("#recNoResult").find("li").bind("click",function(a){var b=$(a.target);(b.is("a")||b.is("img"))&&e.exposeRecommend($(this).data("clk"))}))})}a.init=g});