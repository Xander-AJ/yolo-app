IP 4 Project

Our yolo-app is to be orchestrated by Kubernetes. Thus deployments and services have been created to ensure they are running on K8s. Furthermore our mongo databases have been setup correctly.

Deployment to GKE

In our application architecture, we've used StatefulSets for the database and Deployments for the backend.

StatefulSets for the Database (Stateful Application):

We chose StatefulSets for our database components. StatefulSets are ideal for applications that require stable network identities and persistent storage. In our case, the database is a stateful application because it needs a stable network identity for communication and persistent storage to store data reliably. Each pod within the StatefulSet has a unique and stable hostname, allowing for predictable network communication and ensuring that data is stored persistently even if a pod is rescheduled or replaced.

Deployments for the Backend (Stateless Application):

For our backend services, we opted for Deployments. Deployments are well-suited for stateless applications where instances can be easily scaled up or down without relying on persistent local storage. In our scenario, the backend is stateless because it doesn't rely on stored data within the pods. Any necessary data is fetched from the stateful database. Deployments allow us to scale horizontally, meaning we can add or remove backend instances dynamically based on demand without worrying about managing stateful data within each instance.

The frontend & backend deployment each have 2 replicas, this is incase of any downtimes or failures. A backup is ensured and is present.

This architectural decision ensures that our application benefits from both stable, persistent data storage and the ability to handle varying loads efficiently.
