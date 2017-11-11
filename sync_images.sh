    #!/bin/bash
    set -e
    #export USERNAME=${USERNAME}
    #export PASSWORD=${PASSWORD}
    #export NAMESPACE=${NAMESPACE}

    #安装jq工具，Ubuntu、Debian
    #apt-get install jq -y
    #安装jq工具，centos、Fedora
    #yum install jq -y
    jq_install (){
        if [ -r '/etc/debian_version' ]; then
            apt install -y jq
        fi
        if [ -r '/etc/fedora-release' ]; then
            yum install -y jq 
        fi
        if [ -r '/etc/redhat-release' ]; then
            yum install -y jq 
        fi
        if [ -r '/etc/centos-release' ]; then
            yum install -y jq
        fi
        if [ -r '/etc/lsb-release' ]; then
            apt-get install -y jq 
        fi
    }

    IMAGES="kubernetes-dashboard k8s-dns-sidecar k8s-dns-kube-dns k8s-dns-dnsmasq-nanny heapster-grafana heapster-influxdb heapster pause"
    arch=amd64

    docker_push (){
        docker pull gcr.io/google_containers/$img-$arch:$tag
        docker tag gcr.io/google_containers/$img-$arch:$tag $NAMESPACE/$img-$arch:$tag
        docker push $NAMESPACE/$img-$arch:$tag
        #echo "$tag" >> /home/$img
        #docker rmi -f gcr.io/google_containers/$img-$arch:$tag
        #docker rmi $NAMESPACE/$img-$arch:$tag

    }

    sync_images_with_arch (){
        for img in $IMAGES;
        do  
            #if  [ ! -f "/home/$img" ]; then
            #    touch /home/$img
            #fi

            tags=$(curl -k -s -X GET https://gcr.io/v2/google_containers/$img-$arch/tags/list | jq -r '.tags[]'|sort -r)
            TAGS=$(curl -k -s -X GET https://registry.hub.docker.com/v2/repositories/$NAMESPACE/$img-$arch/tags/?page_size=1000 | jq '."results"[]["name"]' |sort -r |sed 's/\"//g' )
                
            for tag in $tags
            do  
                if  echo "${TAGS[@]}" | grep -w "$tag" &>/dev/null; then
                
                    echo "$img-$arch:$tag,此镜像已同步，跳过"
                    echo "$img-$arch:$tag,The image has been synchronized and skipped"

                else
                    docker_push
                fi
            done
        done
            echo 'Synchronous completion '
            echo '镜像同步完成'
            exit

    }

    docker_login (){
        while true
        do
            read -p "Username: " USERNAME
            if [ -z $USERNAME ];then      
                echo 'Input cannot be empty,Please re-enter it'
                echo '输入不能为空，请重新输入'
            fi
            read -p "Password: " PASSWORD
            if [ -z $PASSWORD ];then      
                echo 'Input cannot be empty,Please re-enter it'
                echo '输入不能为空，请重新输入'
            fi
            read -p "Namespace: " NAMESPACE
            if [ -z $NAMESPACE ];then      
                echo 'Input cannot be empty,Please re-enter it'
                echo '输入不能为空，请重新输入'
            else
                docker login -u $USERNAME -p $PASSWORD
                sync_images_with_arch
            fi
        done
    }

    jq_install
    docker_login