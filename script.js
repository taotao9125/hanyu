const fs = require('fs');


const pages = new Array(19).fill('1');

const list = pages.reduce((acc, cur, idx) => {
  const data = require(`./jsonshanyu/data${idx+1}.json`);
  return [...acc, ...data.data.list]
}, [])


const originHtml = fs.readFileSync('./index.html').toString();


fs.writeFileSync('./index.html', originHtml.replace(/<script\sid=\"INJECT\">.+<\/script>/, `<script id="INJECT">const data = ${JSON.stringify(list)}</script>`))



