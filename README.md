# DevOps_Task
1- Network Infrastrcture with Terraform 

Infrastructure Network Terraform 

Create Virtual private Cloud (VPC) 

Create Four Subnet 

Two Public Subnet 

Two Private Subnet 

Create Router Table 

Create Route Table Association 

Create Internet Gateway 

Create Nat Gateway

====================================================================================
image
====================================================================================

2- Setting up a EKS 

Create Security Group 

Create Elastic Kubernetes Service (EKS Cluster) 

Set up a new IAM role with EKS permission 

Create Worker Nodes 

Set up a new IAM role with Worker Node 

Create Elastic Container Registry (ECR) 



3- Setting up a bastion host 

Create Security Group 

Create Bastion Host [Jump Box] 

Private key: You should now be able to access the instance using the private key from the same key pair as used to create the instance 

 

A highly available architecture that spans two Availability Zones. * 

A virtual private cloud (VPC) configured with public and private subnets according to AWS best practices, to provide you with your own virtual network on AWS. * 

In the public subnets, NAT gateways are managed to allow outbound internet access for resources in the private subnets. * 

In one public subnet, a Linux bastion host in an Auto Scaling group to allow inbound Secure Shell (SSH) access to Amazon Elastic Compute Cloud (Amazon EC2) instances in private subnets. The bastion host is also configured with the Kubernetes kubectl command line interface for managing the Kubernetes cluster. 

An Amazon EKS cluster, which provides the Kubernetes control plane. 

In the private subnets, a group of Kubernetes nodes. 


 

Network Infrastrcture Architecture Explained with Diagram 

 
====================================================================================
image
====================================================================================
Accessing Private EKS Cluster From Bastion Host (EC2)?    

Before you start You will need to make sure you have the following components installed on bastion host (ec2) and set up before accessing Private EKS Cluster  

AWS CLI – you need to link your account to the AWS CLI. 

AWS Configure  

Kubectl – used for communicating with the cluster API server.  

Install Kubernetes packages 

Next, we will install the packages that we need to set up a Kubernetes control plane on this host. These packages are described in the following list: 

kubectl: The Kubernetes command-line client, which will allow us to interact with the Kubernetes API server. 

Install Docker  

 

So finally, Accessing Private EKS Cluster From Bastion Host (EC2) 

	` aws sts get-caller-identity` 

	` aws eks update-kubeconfig --region region-code --name my-cluster` 

     5. Creating Docker Image and pushing the image to Amazon ECR repository 

Retrieve an authentication token and authenticate your Docker client to your registry. Use the AWS CLI: 

`aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/o0k2y0g4` 

Build your Docker image using the following command. For information on building a Docker file from 	scratch see the instructions. You can skip this step if your image is already built: 

 

`docker build -t devops`. 

 

After the build completes, tag your image so you can push the image to this repository: 

 

`docker tag devops:latest public.ecr.aws/o0k2y0g4/devops:latest` 

 

Run the following command to push this image to your newly created AWS repository: 

 

`docker push public.ecr.aws/o0k2y0g4/devops:latest` 

 

 Deploy Your Application on Kubernetes 

Deploy your application with the deployments 



 
====================================================================================
image
====================================================================================

Deploy the Database 

Create a deployment for SQL Server and Redis  


 
====================================================================================
image
====================================================================================


Kubernetes Volume and Secret Database Information 

Database is not persistent so, 

There are many of type that make persistent data one of them: 

Host Path Persistent Volume 


 
====================================================================================
image
====================================================================================


Another problem that we can solve now is the storage of sensitive data in a Kubernetes cluster, like the password to access our database. To do this, Kubernetes provides a tool known as a secret, which we already glimpsed when we talked about the token to access the Kubernetes Dashboard. 



 
====================================================================================
image
====================================================================================



Create an External Load Balancer 

you have the option of automatically creating a cloud load balancer. This provides 

an externally accessible IP address that sends traffic to the correct port on your cluster 	 

nodes, provided your cluster runs in a supported environment and is configured with the correct cloud load balancer provider package. 


====================================================================================
image
====================================================================================
