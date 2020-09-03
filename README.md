# gitHubWorkShop

![GitHub-CI](https://github.com/procesor2017/gitHubWorkShop/workflows/GitHub-CI/badge.svg)
<img src="https://img.shields.io/github/license/procesor2017/gitHubWorkShop?style=plastic"></img>
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

## Github Actions
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

## Best link 
There is links what you wanna see it
 - [Introduction to Github actions](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow)
 - [Using docker in Github Actions](https://stackoverflow.com/questions/57549439/how-do-i-use-docker-with-github-actions) 
