const { chromium } = require('playwright');
const path = require('path');

(async () => {
  const htmlPath = process.argv[2];
  const outPath  = process.argv[3];

  const browser = await chromium.launch({
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });

  const page = await browser.newPage({ viewport: { width: 1080, height: 1350 } });
  await page.goto('file://' + path.resolve(htmlPath), { waitUntil: 'networkidle' });
  await page.waitForTimeout(150);
  await page.screenshot({ path: outPath });

  await browser.close();
})();
