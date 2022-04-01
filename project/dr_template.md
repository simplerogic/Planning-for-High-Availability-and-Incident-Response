# Infrastructure

## AWS Zones
Main Zone: us-east-2a
Disaster Recovery Zone: us-west-1a
## Servers and Clusters

### Table 1.1 Summary
| Asset         | Purpose                                                                 | Size        | Qty                    | DR                                   |
|---------------|-------------------------------------------------------------------------|-------------|------------------------|--------------------------------------|
| EC2 Instances | Application servers. They are in the main region us-east-2              | t3.micro    | 3                      | Deployed in us-west-1 region as well |
| EC2 Instances | Application servers. They are in the off site region us-west-1          | t3.micro    | 3                      | Deployed in us-west-1 region for DR  |
| EKS Cluster   | Kubernetes cluster for monitoring in the main region us-east-2          | t3.medium   | 1 cluster with 2 Nodes | Replicated in us-west-1              |
| EKS Cluster   | Kubernetes cluster for monitoring in the off site region us-west-1      | t3.medium   | 1 cluster with 2 Nodes | Deployed in us-west-1 region for DR  |
| VPC           | Virtual private network that has IPs in different availability zones    |             |                        | Deployed in us-east-2                |
| VPC           | Virtual private network that has IPs in different availability zones    |             |                        | Deployed in us-west-1 region for DR  |
| Load balancer | Distributes / balances traffic between the 3 EC2 instances in us-east-2 |             |                        | Deployed in us-east-2                |
| Load balancer | Distributes / balances traffic between the 3 EC2 instances in us-west-1 |             |                        | Deployed in us-west-1 region for DR  |
| RDS Cluster   | Database in the main region us-east-2                                   | db.t2.small | 1 cluster with 2 Nodes | Deployed in us-east-2                |
| RDS Cluster   | Replicated database from us-east-2 to off site region us-west-1         | db.t2.small | 1 cluster with 2 Nodes | Replicated in us-west-1 region for DR|

### Descriptions
EC2 Instances - individual virtual machines that handle applications and traffic
EKS Cluster - two nodes that monitor application performance and provide metrics
VPC - virtual private networks in each region with multiple availability zones for high availability
Load Balancer - distributes traffic between application EC2 nodes to balance load
RDS Cluster - 2 nodes each for highly available relational database operations, us-east-2 cluster replicates to us-west-1 cluster


## DR Plan
### Pre-Steps:
Verify that the EC2 Instances, EKS cluster, vpc, load balancer, and RDS cluster are all in both us-east-2 and us-west-1 regions.
Verify that the RDS cluster in us-east-2 is replicating properly to us-west-1
Verify that the loadbalancer can be changed to point to us-west-1


## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

In the event of a disaster in us-east-2, the loadbalancer would need to be updated to point to us-west-1 which would distribute application traffic to a working zone.
The database cluster would need to be changed from primary (us-east-2) to secondary (us-west-1).
EC2 instances in us-west-1 should be using the us-west-1 database, no action needed.
EKS cluster in us-west-1 should be monitoring the correct EC2 instances in us-west-1, no action needed. 
VPC and loadbalancer should be using the us-west-1 EC2 instances, no action needed.