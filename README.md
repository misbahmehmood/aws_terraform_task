# AWS ELB and Autoscaling using Terraform 
# Contents
* [Introduction](#Introduction)
* [The Brief](#The-Brief)
* [Initial Architecture](#Initial-Architecture)
* [VPC](#VPC)
    * [Subnets](#Subnets)
* [Autoscaling](#Autoscaling)
* [Load Balancer](#Load-Balancer)
* [Host/Web server](#Host/Web-Server)
* [Modules](#Modules)


# Introduction
As part of the recruitment process, this project is designed to show different AWS resources created and provisioend through terraform in order to  meet the brief. 

# The Brief
* Terraform a load balanced web front end in AWS, GCP or Azure
* There should be a minimum of 2 instances and they need to be able to scale across availability zones.
* Ideally the web page should be secure.
* The Vpc should be appropriately split into the required subnets.
* The hosts should be running Linux and the choice of web server is down to the individual
* The use of modules

# Initial Architecture
Before beginning to create the project, I planned out the AWS resources needed to complete the task. To help me with this, I created a visual architecture design in order to gain a full understanding on all the different aspects that were needed and how they would interact with each other.  

![image](https://raw.githubusercontent.com/misbahmehmood/aws_terraform_task/images/architecture.png)

# VPC
## Subnets
# Autoscaling
# Load Balancer
# Host/Web server
# Modules