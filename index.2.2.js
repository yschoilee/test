const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

async function listJSFiles(dirPath) {
    try{
        const entries = await readdir(dirPath);
        for (const entry of entries){
            const fullPath = path.join(dirPath, entry);
            try {
                const stats = await stat(fullPath);
                if (stats.isDirectory()){
                    await listJSFiles(fullPath);
                } else if (path.extname(fullPath) === '.js'){
                    console.log(fullPath);
                }
            } catch(err){
                console.error(err);
            }
        }
    } catch(err){
        console.error(err);
    }
}

listJSFiles(path.join(__dirname, 'test'));
