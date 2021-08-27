var fs = require("fs");
var process = require("process")
var htmlmin = require('html-minifier');


const DEF_OPTIONS = {
    collapseWhitespace: true,
    removeComments: true,
    removeFtlComments: true,
    trimCustomFragments: true,
    minifyCSS: true,
    minifyJS: true,
    minifyFtl: true,
    ignoreCustomComments: [
        /<#--([\s\S])*.*-->/        // freemarker <#-- xxx -->
    ],
    ignoreCustomFragments: [
        /<@([\s\S])*.*(\/)?>/,      // freemarker <@abc/>
        /<(\/)?#([\s\S])*.*(\/)?>/  // freemarker <#abc>,</#abc>
    ]
};

function minifyFtl(data) {
    let afterHtmlMin = htmlmin.minify(data, DEF_OPTIONS);
    let res = compressFtl(afterHtmlMin, DEF_OPTIONS);
    return res
}
function compressFtl(str, options = {}) {
    let removeFtlComments = options.removeFtlComments;
    let minifyFtl = options.minifyFtl;
    if (minifyFtl && typeof str === 'string') {
        const SINGLE_SPACE = ' ';
        const EMPTY = '';
        // remove ftl-comments <#-- xxx -->
        str = removeFtlComments ? str.replace(/<#--[\s\S]*?-->/g, EMPTY) : str;
        // convert \s* to \s
        // str = str.replace(/[\s]{2,}/g, SINGLE_SPACE);
        str = str.replace(/[\f\t\v]{2,}/g, SINGLE_SPACE);// except \r \n
        str = str.trim();
    }
    return str;
}

console.log(minifyFtl(fs.readFileSync(process.argv[2]).toString()));
