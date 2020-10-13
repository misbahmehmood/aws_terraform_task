# AWS ELB and Autoscaling using Terraform 
# Contents
* [Introduction](#Introduction)
* [The Brief](#The-Brief)
* [Planning](#Planning)
* [VPC](#VPC)
    * [Subnets](#Subnets)
* [Security Groups](#Security-Groups)
* [Autoscaling](#Autoscaling)
* [Load Balancer](#Load-Balancer)
* [Host/Web server](#Host/Web-Server)
* [Modules](#Modules)


# Introduction
As part of the recruitment process, this project is designed to show different AWS resources provisioned through terraform in order to  meet the brief. 

# The Brief
* Terraform a load balanced web front end in AWS, GCP or Azure
* There should be a minimum of 2 instances and they need to be able to scale across availability zones.
* Ideally the web page should be secure.
* The Vpc should be appropriately split into the required subnets.
* The hosts should be running Linux and the choice of web server is down to the individual
* The use of modules

# Planning
Before beginning to create the project, I planned out the AWS resources needed to complete the task. 

I decided to use AWS due to having more exposure and experience with AWS. In order to meet the brief, I needed:
* A load balancer
* At least 2 instances that needed to scale across availability zones. This required an auto scaling group with a launch configuration.
* Secure webpage - I had initially decided to use either https or have a reverse proxy
* VPC and subnets
* Linux host with an NGINX server
* The use of modules

To help me with this, I created a visual architecture design in order to gain a full understanding on all the different aspects that were needed and how they would interact with each other.  
This diagram shows the different resources that were used:

![image](https://raw.githubusercontent.com/misbahmehmood/aws_terraform_task/images/architecture.png)

# VPC
The VPC holds all the AWS resources including the subnets, route table and internet gateway so that the web page is accessible from the open internet. All resources are created in the Ireland region eu-west-1. 

## Subnets
2 Subnets are created in different availability zones to make this infrastructure highly available. The subnets are linked to a route table and internet gateway. 
# Security Groups
Two security groups are used, one is used for the instances based on the launch configuration and the other for the load balancer to allow for easier changes and adjustments to security. The lauch configuration security group allows Port 22 to gain access into the instance using SSH. Both security groups allow Port 80 in order to access the web page using HTTP. 

To meet the secure aspect of the brief, I initially wanted to use https protocol. To allow https, a domain name was needed to get an ssl certificate. To keep costs minimal and not have to buy a domain name, I decided against this and opted for a proxy method instead.

# Autoscaling
# Load Balancer
# Host/Web server
# Modules