const { chromium } = require('playwright');
const { expect } = require('chai');

(async () => {
    const browser = await chromium.launch();
    const context = await browser.newContext();
    const page = await context.newPage();

    await page.goto('https://procesor2017.github.io/gitHubWorkShop/');
    await page.fill('[name=user]', 'tesena');
    await page.type('[name=password]', 'tesena');
    await page.click('[type=submit]');
    await browser.close();
})();
