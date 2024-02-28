const fs = require('fs');


const pages = new Array(19).fill('1');



const list = pages.reduce((acc, cur, idx) => {
  const data = require(`./jsonshanyu/data${idx+1}.json`);
  return [...acc, ...data.data.list]
}, [])


const originHtml = fs.readFileSync('./tpl').toString()

const html = originHtml.replace('__data__', JSON.stringify(list))


fs.writeFileSync('./index.html', html)



