const playwright = require('playwright')
const chai = require('chai')
const expect = chai.expect
const BASE_URL = 'https://procesor2017.github.io/gitHubWorkShop/'
const url = 'https://procesor2017.github.io/gitHubWorkShop/under/api.json'

const https = require("https");

let page, browser, context

describe('TC- For checking Klingon', () => {

    beforeEach(async () => {
        browser = await playwright['chromium'].launch()
        context = await browser.newContext()
        page = await context.newPage(BASE_URL)
    })

    afterEach(async function() {
        await browser.close()
    })

    it('Find klingon', async() => {
        await page.goto('https://procesor2017.github.io/gitHubWorkShop/');
        await page.fill('[name=user]', 'tesena');
        await page.type('[name=password]', 'tesena');
        await page.click('[type=submit]');
        klingon = await page.waitForSelector('[id=klingon]');
        expect(klingon).to.exist;
    })
})

describe('TC- Api Connect', () => {
    it('Check if author is Jan Egermaier', async() => {
        https.get(url, res => {
            res.setEncoding("utf8");
            let body = "";
            res.on("data", data => {
              body += data;
            });
            res.on("end", () => {
              body = JSON.parse(body);
              expect(body.author).to.equal('Jan Egermaier');
            });
        });
    })
})