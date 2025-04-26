// core.js
console.log("✅ core.js cargado correctamente");

// Añadir un banner para confirmar que el script funciona
const banner = document.createElement('div');
banner.textContent = 'Gota.io Mod - Chat Estilizado';
banner.style.position = 'fixed';
banner.style.bottom = '10px';
banner.style.right = '10px';
banner.style.backgroundColor = '#1a1a1a';
banner.style.color = 'lime';
banner.style.padding = '10px';
banner.style.zIndex = '9999';
banner.style.fontSize = '14px';
document.body.appendChild(banner);

// Añadir selector de fuentes al chat
const interval = setInterval(() => {
  const chatContainer = document.getElementById('chat-container');
  if (chatContainer && !document.getElementById('font-selector')) {
    const selector = document.createElement('select');
    selector.id = 'font-selector';
    selector.style.position = 'fixed';
    selector.style.bottom = '50px';
    selector.style.left = '150px';
    selector.style.backgroundColor = '#1a1a1a';
    selector.style.color = 'lime';
    selector.style.zIndex = '9999';

    const fonts = [
      { name: 'Normal', chars: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' },
      { name: 'Bold', chars: '𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭' },
      { name: 'Italic', chars: '𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡' },
      { name: 'Fancy', chars: '𝒶𝒷𝒸𝒹𝑒𝒻𝑔𝒽𝒾𝒿𝓀𝓁𝓂𝓃𝑜𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏𝒜𝐵𝒞𝒟𝐸𝐹𝒢𝐻𝐼𝒥𝒦𝐿𝑀𝒩𝒪𝒫𝒬𝑅𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵' },
      { name: 'Mono', chars: '𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕' },
      { name: 'Emoji', chars: '🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩' },
    ];

    fonts.forEach((font, index) => {
      const option = document.createElement('option');
      option.value = index;
      option.textContent = font.name;
      selector.appendChild(option);
    });

    chatContainer.appendChild(selector);

    const chatInput = document.querySelector('.chatInput');
    selector.addEventListener('change', () => {
      localStorage.setItem('fontIndex', selector.value);
    });

    selector.value = localStorage.getItem('fontIndex') || '0';

    chatInput.addEventListener('keyup', () => {
      if (selector.value != '0' && !chatInput.value.startsWith('/')) {
        let text = chatInput.value.startsWith('/p ') ? chatInput.value.slice(3) : chatInput.value;
        const selectedFont = fonts[selector.value].chars;
        const normal = fonts[0].chars;
        let result = '';
        for (let char of text) {
          const index = normal.indexOf(char);
          result += index >= 0 ? selectedFont[index] : char;
        }
        chatInput.value = chatInput.value.startsWith('/p ') ? '/p ' + result : result;
      }
    });

    clearInterval(interval);
  }
}, 1000);
