<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>hanyu</title>
  <script>
    const data = __data__
  </script>
  <style>
    * {
      padding: 0;
      margin: 0;
    }

    .details {
      padding: 10px;
      color: #333;
      font-size: 16px;
      border-bottom: 1px solid #ccc;
      background: #efefef;
    }

    .details .summary {
      font-weight: bold;
    }

    .child-details {
      padding-left: 20px;
    }



    #list>details:nth-child(even) {
      background-color: #f2f2f2;
    }

    .sort {
      position: fixed;
      right: 10px;
      bottom: 10px;
    }

    #shuffle,
    #az {
      width: 60px;
      height: 60px;
      border: 1px solid #ccc;
      border-radius: 50%;
      ;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #ccc;
      margin-bottom: 20px;
      border: 1px solid #666;
    }
  </style>
</head>

<body>
  <div id="list"></div>
  <div class="sort">
    <div id="shuffle">shuffle</div>
    <div id="az">A-Z</div>
  </div>

  <script>

    function shuffle(arr) {
      var l = arr.length
      var index, temp
      while (l > 0) {
        index = Math.floor(Math.random() * l)
        temp = arr[l - 1]
        arr[l - 1] = arr[index]
        arr[index] = temp
        l--
      }
      return arr
    }

    function az(data) {
      const az = 'abcdefghijklmnopqrstuvwxyz'.split('');
      const azData = az.reduce((acc, cur) => {
        acc[cur] = data.filter(el => el.sugPy === cur) || [];
        return acc;
      }, {});
      return Object.values(azData).flat()
    }


    const getHtml = data => {
      return data.reduce((acc, cur, idx) => {
        return acc + `
          <details class="details">
            <summary class="summary"><span style="font-size: 14px; color: #ccc;">${idx + 1}</span> ${cur.definition}</summary>
            <details class="child-details">
              <summary>${cur.name}</summary>
              <div class="contentNode">${cur.pinyin} </div>
            </details>
          </details>
        `;
      }, '')
    }

    function render(data) {
      const listHtml = getHtml(data);
      document.querySelector('#list').innerHTML = listHtml;
    }

    render(data);


    document.querySelector('#shuffle')
      .addEventListener('click', () => {
        render(shuffle(data));
      })

    document.querySelector('#az')
      .addEventListener('click', () => {
        render(az(data))
      })



  </script>
</body>

</html>