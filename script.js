const fs = require('fs');

const w = fs.readFileSync('./wordlist.txt', 'utf-8');

const list = w
  .split('\n').map(el => el.split(/\t+/g))
  .filter(el => el.every(el => !!el))
  .filter(el => el.length === 4)
  .map(el => {
    const [py, def] = el[2].split('##')
    return {
      definition: def,
      sid: el[0],
      sugPy: py[0],
      name: el[1],
      pinyin: py,
      time: el[3]
    }
  });




const originHtml = fs.readFileSync('./index.html').toString();

fs.writeFileSync('./index.html', originHtml.replace(/<script\sid=\"INJECT\">.+<\/script>/, `<script id="INJECT">const data = ${JSON.stringify(list)}</script>`))



