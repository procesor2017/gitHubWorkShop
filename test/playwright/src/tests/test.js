const { test, expect } = require('@playwright/test');
const playwright = require('playwright')
const BASE_URL = 'https://procesor2017.github.io/gitHubWorkShop/'
const url = 'https://procesor2017.github.io/gitHubWorkShop/under/api.json'
const https = require("https");
let page, browser, context


test('TC - Check If Klingon Exists', async ({ page }) => {
  browser = await playwright['chromium'].launch()
  context = await browser.newContext()
  page = await context.newPage(BASE_URL)

  await page.goto('https://procesor2017.github.io/gitHubWorkShop/');
  await page.fill('[name=user]', 'tesena');
  await page.type('[name=password]', 'tesena');
  await page.click('[type=submit]');
  let klingon = await page.waitForSelector('[id=klingon]');
});

