# Hyperledger Fabric on Kubernetes of Alibaba Cloud Container Service


[Hyperledger Fabric](https://hyperledger.org/projects/fabric) is one of the most popular blockchain infrastructures in the world, which is open sourced and hosted by Linux Foundation.

## Introduction
This chart implements a solution of automatic configuration and deployment for Hyperledger Fabric. The solution is deployed on Kubernetes cluster of Alibaba Cloud Container Service. And the Hyperledger Fabric network can be accessed by CLI, applications and explorers within or outside the Kubernetes cluster. [Blockchain Explorer](https://github.com/hyperledger/blockchain-explorer) is now integrated into this solution as well.

A NAS (NFS protocol) shared file storage is needed for: 1. distribution of crypto and configurations; 2. data persistence for most services.

Currently v1.1.0 of Hyperledger Fabric is supported. 

You can also refer to the [documentation for blockchain solution of Alibaba Cloud Container Service](https://help.aliyun.com/document_detail/60755.html).


## Prerequisites
- A Kubernetes cluster of Alibaba Cloud Container Service has been created. Refer to [guidance document](https://help.aliyun.com/document_detail/53752.html).
- NAS file storage of Alibaba Cloud has been created and mounted to every worker nodes of Kubernetes cluster, and optionally on one master node (for easier management). Refer to [guidance document](https://help.aliyun.com/document_detail/64313.html) (File system related section)


## Installing the Chart

You can use either Helm client or Application Catalog Dashboard of Alibaba Cloud Container Service to install this chart.

Below we will introduce how to install via Helm client.

* To install with default values and into default namespace:
	
	```
	$ helm install --name blockchain-network01 incubator/ack-hyperledger-fabric
	```

* To install with an external address of load balancer for external application access:
	
	```
	$ helm install --name blockchain-network01 --set "externalAddress=1.2.3.4" incubator/ack-hyperledger-fabric
	```
	Please ensure you have created a load balancer, and added external ports defined in values into load balancer. This externalAddress will be used to construct a connection profile which can be used by client SDK applications.

* To install with custom values via file and into namespace network02:
	
	```
	$ helm install --namespace network02 --values network02.yaml  --name blockchain-network02 incubator/ack-hyperledger-fabric
	```
	
	Below is an example of the custom value file network02.yaml, which specifies a list of custom NodePorts to avoid conflict with those of network01.
	
	```
	# Sample contents of network02.yaml
	fabricNetwork: network02
	caExternalPortList: ["32054", "32064"]
	ordererExternalPortList: ["32050", "32060", "32070"]
	peerExternalGrpcPortList: ["32051", "32061", "32071", "32081"]
	peerExternalEventPortList: ["32053", "32063", "32073", "32083"]
	```

* After installation, you can use `helm list` or other Helm commands to administer the blockchain network release.

## Installing a local chart (for development and testing only)

To develop and test a local chart, you can use helm client to install a chart from a local directory. Suppose we have a modified version in `./my-hyperledger-fabric` folder.

* To install a local chart:
	
	```
	$ helm install --name blockchain-network01 my-hyperledger-fabric
	```

* To install a local chart with custom values, we suppose using a value yaml file. For example, create a value file for integration with Alibaba Cloud Log Service:
	
	```
	# This is a custom value file named logservice-value.yaml
	logService:
	  enabled: true
	  region: cn_hangzhou
	  userID: "1309931077407891"
	  machineGroup: blockchain-network01
	```
	
	And then install a local chart with above value file:
	
	```
	$ helm install --name blockchain-network01 --values logservice-value.yaml ack-hyperledger-fabric
	```



## Testing the Chart

* Use `kubectl` or dashboard to ensure all pods and servies are running
	
* Enter fabric-cli pod:
	
	```
	kubectl exec -it fabric-cli bash
	```
	
* Run Hyperledger Fabric sample CLI test within the fabric-cli pod, which simulates a simple transfer application:
	
	```
	./cli-test.sh
	```
	
* If all succeed, you should see output messages similar to below:
	
	```
	===================== Query on PEER4 on channel 'bankchannel' is successful ===================== 
	Press any key to continue...
	===================== All GOOD, End-2-End execution completed =====================
	```

## Testing chaincode encryption/decryption

Since v1.1, Hyperledger Fabric starts to support chaincode encryption/decryption with signature. An example has been provided in CLI mode by this blockchain solution.

Prerequisites: 
- A channel should be created (like using above cli-test.sh) before running this example

Steps:

* Enter fabric-cli pod:
	
	```
	kubectl exec -it fabric-cli bash
	```
	
* Run Hyperledger Fabric sample CLI test within the fabric-cli pod, which simulates a simple transfer application:
	
	```
	./cli-test-enccc.sh
	```

* From the result you can see the encryption/decryption result: `value1`, and encryption/decryption with signature result: `value2`



## Accessing Blockhain Explorer

With the upgrade to support Hyperledger Fabric 1.1, we have also integrated the open sourced [Blockchain Explorer](https://github.com/hyperledger/blockchain-explorer) in this chart, which is enabled by default. And you can also disabled it by setting explorer.enabled to false in values.

When this chart is installed, it will install a MySQL (as a prerequisite for Blockchain Explorer) and the Blockchain Explorer. 

* To check both MySQL and Blockchain Explorer are running:
	
	```
	$ kubectl get pod 
	NAME                                                   READY     STATUS    RESTARTS   AGE
	network01-explorer-deployment-6966cb9dbd-lq26j         1/1       Running   0          31m
	network01-explorer-mysql-deployment-6ccc8f4f6b-kj8dc   1/1       Running   0          31m
	```

After you have finished running CLI test (or SDK test), assuming the channel specified in `fabricChannel`  has been created, you can now access Blockchain Explorer to monitor the blockchain network. Important Note: Blockchain Explorer may not work if channel has not been created!

* To get the external IP address of Load Balancer created automatically for Blockchain Explorer, like below:
	
	```
	$ kubectl get svc 
	NAME                           TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)                         AGE
	network01-explorer             LoadBalancer   172.19.11.52    118.178.117.17   8080:30421/TCP                  5m
	```

* Visit external IP of Load Balancer, like `http://118.178.117.17:8080`, in your web browser. Now you should be able to see the standard Web UI of Blockchain Explorer.


## Using Alibaba Cloud Log Service

If enabled, this solution will configured and deployed Logtail DaemonSet which is used to integrate with Alibaba Cloud Log Service.

* To install chart enabling integration with Log Service, you can use value yaml file. For example, create a value file for integration with Alibaba Cloud Log Service:
	
	```
	# This is a custom value file named logservice-value.yaml
	logService:
	  enabled: true
	  region: cn_hangzhou
	  userID: "1309931077407891"
	  machineGroup: blockchain-network01
	```
	
	And then install the chart with above value file:
	
	```
	$ helm install --name blockchain-network01 --values logservice-value.yaml incubator/ack-hyperledger-fabric
	```

* To check Logtail DaemonSet and Pods are running:
	
	```
	$ kubectl get ds -n kube-system | grep logtail 
	logtail                    3         3         3         3            3           <none>                            6m
	
	$ kubectl get pod -n kube-system | grep logtail 
	logtail-7jzr8                                                1/1       Running   0          6m
	logtail-njk8l                                                1/1       Running   0          6m
	logtail-wnmkv                                                1/1       Running   0          6m
	
	```
* To configure and use Log Service
	
	High-level steps:
	
	1. Create Log Service project
	2. Create machine group
	3. Create logstore
	4. Create logtail config (data type: docker stdout)
	5. Query and analyze logs (create an index with e.g. `_pod_name_` as index field)

	You can refer to below documents for detailed guidance: 
	
	* Configuring Log Service: https://help.aliyun.com/document_detail/55339.html
	* Logtail config - Docker Stdout: https://help.aliyun.com/document_detail/66658.html
	* Query syntax: https://help.aliyun.com/document_detail/29060.html
	

## Uninstalling the Chart

* To uninstall completely:
	
	```
	$ helm delete --purge blockchain-network01
	```
	
* Optional: Remove the shared folder used by the blockchain network. 

	Now during the deletiong of helm release, this blockchain solution will automatically rename the data folder with suffix "deleted" and current timestamp, for example, `network01-deleted-2018-03-14-065158`. And you can delete the unwanted data folders later, for example, on one node with NAS storage mounted:
	
	```
	$ rm -rf /data/fabric/network01-deleted-*
	```
	

## Debugging the Chart

Since current solution performs quite a number of configurations, generations and template transformations, you may have the need to debug the installation of chart or deployment of blockchain network. Here are some techniques for consideration:

* To debug chart generation and simulate installation:
	
	```
	helm install --dry-run --debug incubator/ack-hyperledger-fabric 2>&1 
	```
	
	Furthermore, you may use [schelm](https://github.com/databus23/schelm) to render the above output into individual yaml files in an output directory:
	
	```
	helm install --dry-run --debug incubator/ack-hyperledger-fabric 2>&1 | schelm -f output/
	```

* To diagnosis chart deployment:
	
	Use Kubernetes commands like `kubectl get pod -o yaml`, `kubectl describe pod`, `kubectl logs`, etc to find out problems and hints. 

## Configuration

The following table lists the configurable parameters of this chart and their default values.

| Parameter                  | Description                        | Default                                                    |
| -----------------------    | ---------------------------------- | ---------------------------------------------------------- |
| `dockerImageRegistry` | Docker image registry. Refer to values.yaml inside this chart for available options.                | `registry.cn-hangzhou.aliyuncs.com/cos-solution`                                        |
| `externalAddress` | Public IP for application outside cluster to access blockchain network | `1.2.3.4` |
| `fabricNetwork` | Name of blockchain network | `network01` |
| `fabricChannel` | Name of initial channel in blockchain network | `bankchannel` |
| `ordererNum` | Number of orderers | `3` |
| `orgNum` | Number of peer organizations. There will be two peers created for each organization for HA. So the total number of peers will be (orgNum * 2) | `2` |
| `ordererDomain` | Domain of orderers | `alibaba.com` |
| `peerDomain` | Domain of peers | `alibaba.com` |
| `caExternalPortList` | NodePort list for CA services | `["31054", "31064"]` |
| `ordererExternalPortList` | NodePort list for orderer services | `["31050", "31060", "31070"]` |
| `peerExternalGrpcPortList` | NodePort list for peer services via gRPC | `["31051", "31061", "31071", "31081"]` |
| `peerExternalEventPortList` | NodePort list for peer services via eventing | `["31053", "31063", "31073", "31083"]` |
| `imagePullPolicy` | Image pull policy | `IfNotPresent` |
| `hyperledgerFabricVersion` | Version of Hyperledger Fabric. Currently support 1.1.0 | `1.1.0` |
| `thirdPartyImageVersion` | Version of third-party images of Hyperledger Fabric, like CouchDB, ZooKeeper, Kafka | `0.4.6` |
| `explorer.enabled` | Whether to enable built-in Blockchain Explorer or not, which will create a LoadBalancer and expose a Web UI for monitoring blockchain network | `true` |
| `logService.enabled` | Whether to enable integration with Alibaba Cloud Log Service or not. Refer to https://help.aliyun.com/document_detail/55339.html | `false` |
| `logService.region` | Region in which Alibaba Cloud Log Service project is created. Refer to https://help.aliyun.com/document_detail/55339.html   | `cn_hangzhou` |
| `logService.userID` | User ID of your master account. Refer to https://help.aliyun.com/document_detail/55339.html | `"1234567890"` |
| `logService.machineGroup` | Machine group of your Alibaba Cloud Log Service project. Refer to https://help.aliyun.com/document_detail/55339.html | `blockchain-network01` |


