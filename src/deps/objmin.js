

var fs = require("fs");
var process = require("process")


function objmin(data) {

    var stringArray = data.split("\n");
    stringArray = stringArray
        .filter((n) => n[0] != "#")
        .filter((n) => n.trim() != "");
    for (var i = 0; i < stringArray.length; i++) {

        stringArray[i] = stringArray[i].split(" ");
        for (var j = 0; j < stringArray[i].length; j++) {
            if (!isNaN(stringArray[i][j])) {
                stringArray[i][j] = (parseFloat(stringArray[i][j]).toString());
            }
        }
        stringArray[i] = stringArray[i].join(" ");
    }
    stringArray = stringArray.join("\n");
    return stringArray;
}

console.log(objmin(fs.readFileSync(process.argv[2]).toString()));
