If you would like to work with ros/ros on os-x you have 2 way

1. setup all dependencies and packages on your os-x
2. user container with all dependencies inside 

This repository will help you to configure your workspace and build all code inside docker (way №2)

Requirements:
- docker + docker-compose >=3.7
- brew
- make

In order to go through the tutorial ros/ros 2 we should work with some examples which
use windows applications, not only the command line interface. We should have the ability to work
with windows applications inside a container, for solve this problem we can use
[Xquartz](https://www.xquartz.org/)
