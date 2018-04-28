version: '2'
services:
    oracle-db:
        labels:
            io.rancher.container.pull_image: always
            io.rancher.sidekicks: db-storage

        image: oracle/database:12.2.0.1-ee
        shm_size: ${SHM_SIZE}g
        environment:
            - "ORACLE_SID=${ORACLE_SID}"
            - "ORACLE_PDB=${ORACLE_PDB}"
            - "ORACLE_PWD=${ORACLE_PWD}"
            - "ORACLE_CHARACTERSET=${ORACLE_CHARACTERSET}"
        ports:
            - ${EMR_PROT}:1521/tcp
            - ${EMWC_PROT}:5500/tcp
            - ${XE_PROT}:8080/tcp
            
        volumes_from:
            - db-storage

    db-storage:
        labels:
            io.rancher.container.start_once: true
        network_mode: none
        image: library/alpine
    
        volumes:
            - db-storage-volume:/opt/oracle/oradata
            - db-storage-volume:/opt/oracle/scripts/startup

volumes:
  db-storage-volume:
    driver: ${VOLUME_DRIVER}
    per_container: true
