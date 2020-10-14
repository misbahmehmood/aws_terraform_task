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
Two security groups are used, one is used for the instances based on the launch configuration and the other for the load balancer to allow for easier changes and adjustments to security. The lauch configuration security group allows Port 22 to gain access into the instances using SSH. Both security groups allow Port 80 in order to access the web page using HTTP. 

To meet the secure aspect of the brief, I initially wanted to use HTTPS protocol. To allow HTTPS, a domain name was needed for an ssl certificate. To keep costs minimal and not have to buy a domain name, I decided against this and opted to use Nginx for its benefits. 

# Autoscaling
At least 2 instances were required for the brief, the autoscaling group desired instance size is kept at 2 with minimum instances at 2 to ensure there are always at least 2 instances running. The autoscaling group is scaling across different availability zones, which is taken from the subnets. 

# Load Balancer
A classic load balancer is used to complete this project. It balances the instances created through the autoscaling group across the 2 subnets. The web page is accessed using the dns name of the load balancer to show the requests are going through load balancer. 
I have also allowed the load balancer to wait 3 minutes after the creation of the load balancer and the output of the load balancer dns name to give enough time for the instances to run. Therefore, at the time of the loadbalancer dns_name output, it can be used immediately to access the web page. 

# Host/Web server
Again, to keep costs minimal and make the most out of the AWS free tier resources, I used t2.micro Ubuntu 18.04 instance. 
This is provided in the launch configuration which acts as a template for the autoscaling group to use and base the instances on. A key pair is also provided, which can be changed, to SSH into the instances if required. 

A script file 'web_server.sh' is added to install nginx and create a new default layout for the launch configuration. This is shown in the image below:
![image](https://raw.githubusercontent.com/misbahmehmood/aws_terraform_task/readme/images/nginx%20webpage.png)

I decided to use Nginx as the web server because I had used it in previous projects for its reverse proxy and load balancing capabilities. To make the web page secure, I felt that using NGINX would add an additional security level and could be configured to be used as a reverse proxy to keep the web page secure. As well as this, NGINX also has support for open source web application firewalls such as Naxsi and Modsecurity which can be installed to detect and block suspicious behaviour. 

# Modules
The use of modules were one of the points mentioned in the brief. I have included modules in terraform to keep in line with best practices. 
Modules make for better readability, maintenance and reusability of code. 