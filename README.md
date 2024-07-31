## Tech Stack:


**Infrastructure as code** - Terraform <br>
**Programming Language/UI** - Node JS <br>
**Backend storage** - MongoDB <br>
**Kubernetes resource creation** - YAML <br>
**Monitoring** - Prometheus Operator and Grafana <br> <br>


## Important Links:


**UI**: http://34.136.51.91/
<br>
Endpoints to view metrics on UI as well: http://34.136.51.91/metrics
<br>
**Prometheus**: http://34.41.18.183:9090/graph
<br>
**Grafana**: http://34.66.2.254/d/adt9qu7hfrdhcf/custom-metrics-monitoring <br>
Login Credentials:  iduser/Grafana1#2  (Read only user)



## Repo structure:

![img.png](screenshots/img.png)

**nodejs-app**: This contains the Node based simple application that makes the mongo db connection and fetch the data from mongo db when the UI is accessed.
Additionally it also is responsible for creating custom metric that will be utilized for additional monitoring of this service.
More details captured in Monitoring section below.
It contains the docker file as well.

**terraform**: Used terraform scripts to create GKE cluster and a node pool

**testing**: This contains script to scale test the UI access.

**yaml**: Contains major yamls for web deployment and service, **Horizontal Pod Autoscaler**, Monitoring and Alerting

<br>

## Implementation Details

**Cluster Autoscaler**: GKE's cluster autoscaler is enabled for our Kubernetes cluster, automatically resizing the number of nodes in the node pool based on workload demands.

**HorizontalPodAutoscaler**: This feature allows us to scale deployments and stateful sets according to workload requirements.

**MongoDB Operator**: The MongoDB operator streamlines the setup of network configurations, persistent storage, and dedicated computing resources for each container, minimizing the need for manual intervention.

### **Monitoring**<br>

We are monitoring **CPU and Memory Usage** of Node JS Application and Mongo DB service. Also we are monitoring the **total number of active requests** for the web application as this gives the 360 degree view of application and scaling requirement.

* **Prometheus Operator for Monitoring**: The Prometheus operator facilitates the monitoring of various Kubernetes metrics, such as pod health, CPU, and memory usage. We also track custom metrics, including total and active requests in real-time.

* **Custom Metrics Monitoring and Alerting**: We've set up alerts to notify us if the number of active pods for our application drops below three at any time.

<br>

## Implemention:
Node Js service makes a connection to Mongo DB to get the home page content from the DB table <br>
![img_1.png](screenshots/img_1.png)

<br> **Prometheus:** <br> <br>
![img_2.png](screenshots/img_2.png)

### **Scaling**<br>
When the large number of requests are hits on the node service, the pods starts scaling up and later they scale down automatically when the load starts decreasing.

#### **Before Scaling**<br>
Below is the initial state of the pod before scaling done through stress testing:

Initial Pod State and Count:
![1.png](screenshots/1.png) <br>
Monitoring:
![img_5.png](screenshots/img_5.png)


#### **After Scaling**<br>

After Pod State and Count:  <br>
![2.png](screenshots/2.png)

After scale testing, Pods are scaled up to  **4 from 2.**
![img_6.png](screenshots/img_6.png)

<br><br>


### **Monitoring Application Pods**<br>
<img width="1636" alt="image" src="https://github.com/user-attachments/assets/c903962e-4d04-49fe-9602-23eb303269f0">


### **Monitoring MongoDb Pods**<br>
<img width="1634" alt="image" src="https://github.com/user-attachments/assets/a58affb6-af38-41aa-b3f2-2d181dd671af">



### Alerting for Application Pod
Alerting for the minimum number of Pods running by the app. This Alerts can be further integrated with Slack/Pager Duty <br>
![img3.png](screenshots/img3.png)




