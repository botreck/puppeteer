const puppeteer = require("puppeteer-extra");
const fs = require('fs');

module.exports = async function pageCmd(commands) {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    page.setViewport({width: 1366, height: 768});
    //await page.goto(url);
    for (const command of commands) {
        cmd = command.cmd;
        val = command.val;
        //console.log(cmd, val);

        // RUN
        if (cmd == "goto") {
            await page.goto(val);
        }
        if (cmd == "goto_wait") {
            await page.goto(val, {waitUntil: 'domcontentloaded'});
        }
        if (cmd == "click") {
            await page.click(val);
        }
        if (cmd == "focus") {
            await page.click(val);
        }
        if (cmd == "screenshot") {
            await page.screenshot({path: val});
        }
        if (cmd == "wait") {
            await page.waitForTimeout(val);
        }
        if (cmd == "write_from_file") {
            const value = fs.readFileSync(val, "utf8");
            await page.keyboard.type(value);
        }
        if (cmd == "write") {
            await page.keyboard.type(val);
        }
        if (cmd == "wait_browser") {
            await page.waitForNavigation();
        }
    }
    browser.close();

}