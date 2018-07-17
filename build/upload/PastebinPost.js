console.log("adding build to pastebin...");

var fs = require('fs'),
path = require('path'),    
filePath = path.join(__dirname, "TurtleMaster.lua");

fs.readFile(filePath, {encoding: 'utf-8'}, function(err, file){
    if (!err) {
        // Post the file contents to pastebin
        var paste = require("better-pastebin");
        paste.setDevKey("537bb82f58fba3785abaa41c819120f3");
        paste.login("hackobster", "Kingyy22", function(success, data) {
            if(!success) {
                console.log("Failed (" + data + ")");
                return false;
            }
         
            paste.edit("UXLJ4BJf", file, function(success, data) {
                if(success) {
                    console.log("Posted successfully");
                    //data contains the URL of the created paste
                } else {
                    console.log(data);
                    //data contains an Error object indicating why the creation failed
                }
            });
        });
    } else {
        console.log(err);
    }
});


