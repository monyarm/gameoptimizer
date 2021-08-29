var pd = require("pretty-data").pd;
var fs = require("fs");
var process = require("process")


console.log(pd.jsonmin(fs.readFileSync(process.argv[2]).toString()));