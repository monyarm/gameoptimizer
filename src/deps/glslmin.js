var glslman = require("glsl-man");
var fs = require("fs");
var process = require("process")


console.log(glslman.string(
    glslman.parse(fs.readFileSync(process.argv[2]).toString()),
    { tab: '', space: '', newline: '' }
));