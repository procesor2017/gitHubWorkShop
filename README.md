# gitHubWorkShop

![GitHub-CI](https://github.com/procesor2017/gitHubWorkShop/workflows/GitHub-CI/badge.svg)
<img src="https://img.shields.io/github/license/procesor2017/gitHubWorkShop?style=plastic"></img>
![Report-CI](https://github.com/procesor2017/gitHubWorkShop/workflows/Report-CI/badge.svg)
--------------------

# Info
Example of use GitHub actions for CI with testing tools, which using Github pages as test rabbit.

## Tools
This project starts on remote server (Ubuntu-latest) some tools which testing [GitHub Pages](https://github.com/procesor2017/gitHubWorkShop)
Tools:
 - [RobotFramewok](https://robotframework.org/) using for Test Gui and APi
 - [k6 Load testing](https://k6.io/)
 - [Sonarqube](https://www.sonarqube.org/)
 - [Postman](https://www.postman.com/)
 - [Speed.IO](https://www.speed.io/)
 - [Mocha](https://mochajs.org/)
 - [Playwright](https://github.com/microsoft/playwright) 

## Github Actions
### Github-CI
For building and starting tools I using GitHub Actions. Everything for GitHub Actions is setup in .github/workflows/GitHub-CI.yml
Example for starting RF in docker:

```
robotWebTest:
    name: robotWebTest
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Docker for RF
        run: |
          docker run --shm-size=1g \
          -v ${{ github.workspace }}/test/RobotFrameWork:/opt/robotframework/reports:Z \
          -v ${{ github.workspace }}/test/RobotFrameWork:/opt/robotframework/tests:Z \
          -e BROWSER=chrome \
          --user=1001:1001 \
          ppodgorsek/robot-framework:latest
```
### Report CI
For reporting We are using [reportportal](https://reportportal.io/). How we pull reports log you can see in .github/workflows/Report.yml
(Workflow Report-CI should be fail, because we want have more interest report in report portal than just pass. So this workflow shutdown on playwright test)

Example how to report from Postaman (Docker include):
```
  postmanDockerRun:
    name: Postman test with report # Docker Power
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2.3.2
      - name: Postman
        run: |
          docker pull reportportal/newman      
          docker run -t reportportal/newman run https://raw.githubusercontent.com/procesor2017/gitHubWorkShop/master/test/Postman/TestApi.json \
          -r @reportportal/reportportal \
          --reporter-@reportportal/reportportal-debug=true \
          --reporter-@reportportal/reportportal-endpoint=http://portal.tesena.com/api/v1 \
          --reporter-@reportportal/reportportal-token=${{ secrets.UUID }} \
          --reporter-@reportportal/reportportal-launch=${{ secrets.LAUNCH }} \
          --reporter-@reportportal/reportportal-project=${{ secrets.PROJECT }} \
          -x
```

## Best link 
There is links what you wanna see it
 - [Introduction to Github actions](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow)
 - [Using docker in Github Actions](https://stackoverflow.com/questions/57549439/how-do-i-use-docker-with-github-actions) 
 
