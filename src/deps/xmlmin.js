var pd = require("pretty-data").pd;
var fs = require("fs");
var process = require("process")


console.log(pd.xmlmin(fs.readFileSync(process.argv[2]).toString()));