IP 4 Project

Our yolo-app is to be orchestrated by Kubernetes. Thus deployments and services have been created to ensure they are running on K8s. Furthermore our mongo databases have been setup correctly.

Deployment to GKE

Because this is a stateful application, I utilized Statefulsets for the database. This indicates that the information is persistent.
Because it is a stateless application, I used a deployment for the backend. This signifies that the data in this circumstance is not permanent.
To make it available from outside the cluster, the backend service type was changed to LoadBalancer.
The frontend & backend deployment each have 2 replicas, this is incase of any downtimes or failures. A backup is ensured and is present.
