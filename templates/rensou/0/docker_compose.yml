bh-eureka-server:
  image: ${harborhost}/bighealth/bh-eureka-server:v1.0
  stdin_open: true
  tty: true
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-action-client:
  image: ${harborhost}/bighealth/bh-serv-action-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-other-deal:
  image: ${harborhost}/bighealth/bh-serv-other-deal:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-import:bh-serv-import
  - bh-serv-da:bh-serv-da
  - bh-serv-auth:bh-serv-auth
  - bh-serv-architect:bh-serv-architect
  - bh-serv-cache:bh-serv-cache
  - bh-serv-index:bh-serv-index
  - bh-serv-log:bh-serv-log
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-ehr-manager:
  image: ${harborhost}/bighealth/bh-serv-ehr-manager:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-oms-deal:
  image: ${harborhost}/bighealth/bh-serv-oms-deal:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-import:bh-serv-import
  - bh-serv-da:bh-serv-da
  - bh-serv-auth:bh-serv-auth
  - bh-serv-architect:bh-serv-architect
  - bh-serv-cache:bh-serv-cache
  - bh-serv-index:bh-serv-index
  - bh-serv-log:bh-serv-log
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-gateway-app:
  image: ${harborhost}/bighealth/bh-gateway-app:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-oms-client:bh-serv-oms-client
  - bh-serv-other-client:bh-serv-other-client
  - bh-serv-ehr-client:bh-serv-ehr-client
  - bh-serv-action-client:bh-serv-action-client
  - bh-serv-user-client:bh-serv-user-client
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-auth:
  image: ${harborhost}/bighealth/bh-serv-auth:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-other-manager:
  image: ${harborhost}/bighealth/bh-serv-other-manager:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-other-client:
  image: ${harborhost}/bighealth/bh-serv-other-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-da:
  image: ${harborhost}/bighealth/bh-serv-da:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-manager-deal:
  image: ${harborhost}/bighealth/bh-serv-manager-deal:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-import:bh-serv-import
  - bh-serv-da:bh-serv-da
  - bh-serv-auth:bh-serv-auth
  - bh-serv-architect:bh-serv-architect
  - bh-serv-cache:bh-serv-cache
  - bh-serv-index:bh-serv-index
  - bh-serv-log:bh-serv-log
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-user-client:
  image: ${harborhost}/bighealth/bh-serv-user-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-action-manager:
  image: ${harborhost}/bighealth/bh-serv-action-manager:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-import:
  image: ${harborhost}/bighealth/bh-serv-import:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-action-deal:
  image: ${harborhost}/bighealth/bh-serv-action-deal:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-import:bh-serv-import
  - bh-serv-da:bh-serv-da
  - bh-serv-auth:bh-serv-auth
  - bh-serv-architect:bh-serv-architect
  - bh-serv-cache:bh-serv-cache
  - bh-serv-index:bh-serv-index
  - bh-serv-log:bh-serv-log
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-gateway-admin:
  image: ${harborhost}/bighealth/bh-gateway-admin:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-manager:bh-serv-action-manager
  - bh-serv-ehr-manager:bh-serv-ehr-manager
  - bh-serv-oms-manager:bh-serv-oms-manager
  - bh-thirdparty-client:bh-thirdparty-client
  - bh-serv-manager-client:bh-serv-manager-client
  - bh-serv-other-manager:bh-serv-other-manager
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-cache:
  image: ${harborhost}/bighealth/bh-serv-cache:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-ehr-deal:
  image: ${harborhost}/bighealth/bh-serv-ehr-deal:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-import:bh-serv-import
  - bh-serv-da:bh-serv-da
  - bh-serv-auth:bh-serv-auth
  - bh-serv-architect:bh-serv-architect
  - bh-serv-cache:bh-serv-cache
  - bh-serv-index:bh-serv-index
  - bh-serv-log:bh-serv-log
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-architect:
  image: ${harborhost}/bighealth/bh-serv-architect:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-index:
  image: ${harborhost}/bighealth/bh-serv-index:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-manager:
  image: ${harborhost}/bighealth/bh-manager:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-gateway-admin:bh-gateway-admin
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-ehr-client:
  image: ${harborhost}/bighealth/bh-serv-ehr-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-config-server:
  image: ${harborhost}/bighealth/bh-config-server:v1.0
  stdin_open: true
  tty: true
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
lb-open-api:
  image: ${harborhost}/rancher/lb-service-haproxy:v0.7.15
  ports:
  - ${openapiport}:${openapiport}/tcp
  labels:
    io.rancher.scheduler.affinity:host_label: hostip=${openapihostip}
    io.rancher.container.agent.role: environmentAdmin,agent
    io.rancher.container.agent_service.drain_provider: 'true'
    io.rancher.container.create_agent: 'true'
lb-manager:
  image: ${harborhost}/rancher/lb-service-haproxy:v0.7.15
  ports:
  - ${managerport}:${managerport}/tcp
  labels:
    io.rancher.scheduler.affinity:host_label: hostip=${managerhostip}
    io.rancher.container.agent.role: environmentAdmin,agent
    io.rancher.container.agent_service.drain_provider: 'true'
    io.rancher.container.create_agent: 'true'
lb-thirdparty:
  image: ${harborhost}/rancher/lb-service-haproxy:v0.7.15
  ports:
  - ${thirdpartyport}:${thirdpartyport}/tcp
  labels:
    io.rancher.scheduler.affinity:host_label: hostip=${thirdparthostip}
    io.rancher.container.agent.role: environmentAdmin,agent
    io.rancher.container.agent_service.drain_provider: 'true'
    io.rancher.container.create_agent: 'true'
lb-user:
  image: ${harborhost}/rancher/lb-service-haproxy:v0.7.15
  ports:
  - ${userport}:${userport}/tcp
  labels:
    io.rancher.scheduler.affinity:host_label: hostip=${userhostip}
    io.rancher.container.agent.role: environmentAdmin,agent
    io.rancher.container.agent_service.drain_provider: 'true'
    io.rancher.container.create_agent: 'true'
bh-serv-log:
  image: ${harborhost}/bighealth/bh-serv-log:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-config-server:bh-config-server
  - bh-eureka-server-ha:bh-eureka-server-ha
  - bh-eureka-server:bh-eureka-server
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-eureka-server-ha:
  image: ${harborhost}/bighealth/bh-eureka-server-ha:v1.0
  stdin_open: true
  tty: true
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-user:
  image: ${harborhost}/bighealth/bh-user:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-gateway-app:bh-gateway-app
  command:
  - /usr/local/nginx/sbin/nginx
  - -g
  - daemon off;
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-manager-client:
  image: ${harborhost}/bighealth/bh-serv-manager-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-oms-manager:
  image: ${harborhost}/bighealth/bh-serv-oms-manager:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-open-api:
  image: ${harborhost}/bighealth/bh-thirdparty:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-gateway-admin:bh-gateway-admin
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-thirdparty-client:
  image: ${harborhost}/bighealth/bh-thirdparty-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-serv-oms-client:
  image: ${harborhost}/bighealth/bh-serv-oms-client:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-serv-action-deal:bh-serv-action-deal
  - bh-serv-manager-deal:bh-serv-manager-deal
  - bh-serv-ehr-deal:bh-serv-ehr-deal
  - bh-serv-other-deal:bh-serv-other-deal
  - bh-serv-oms-deal:bh-serv-oms-deal
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
bh-thirdparty:
  image: ${harborhost}/bighealth/bh-thirdparty:v1.0
  stdin_open: true
  tty: true
  links:
  - bh-gateway-admin:bh-gateway-admin
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: ${labels}
