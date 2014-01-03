/** SGX

The   sss    gggg x   x
     s      g      x x    Engine
      sss   g  gg   x
         s  g   g  x x          Copyright 1995-2012.
     ssss    gggg x   x         Steven Goodwin. All Rights Reserved.

This file is copyright and may only be distributed under license.

Please see the licensing conditions for details.

http://www.sgxengine.com

*/


/**
 * @constructor
 */
 CSGXFile = function(url) {
	this.url = url;
	this.onFileOpen = function(){}
	this.onFileOpenFailed = function(){}
	this.onFileClose = function(){}
}

/**
 * @constructor
 */
createXMLHttpRequest = function() {
   try { return new XMLHttpRequest(); } catch(e) {}
   try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {}
   sgxError("XMLHttpRequest not supported - you can not retrieve external data files");
   return null;
}
 
CSGXFile.prototype.open = function() {
	this.getrequest=new createXMLHttpRequest();
	
	if (!this.getrequest) {
		this.onFileOpenFailed();
		return false;
	}

	this.onFileOpen(this);
	return true;
}
 
CSGXFile.prototype.close = function() {
	this.onFileClose(this);
	return true;
}
 
CSGXFile.prototype.slerp = function(cbfn) {
	if (!this.open()) {
		return false;
	}
	if (window.location.href.indexOf("http")==-1) {
		this.onFileOpenFailed(this);
		return false;
	}
	//
	var thisGetRequest = this.getrequest;
	var thisFile = this;
	this.getrequest.onreadystatechange=function(){
		if (thisGetRequest['readyState']==4){
			if (thisGetRequest['status']==200){
				cbfn(thisGetRequest['responseText']);
				thisFile.close();
			} else {	// even from  local, i.e. window.location.href.indexOf("http")==-1
				thisFile.onFileOpenFailed(thisFile);
			}
		}
	};
	
	try { 	
		this.getrequest.open("GET", this.url, true)
		this.getrequest.send(null);
	} catch(e) {
		thisFile.onFileOpenFailed(thisFile);
	}
}


