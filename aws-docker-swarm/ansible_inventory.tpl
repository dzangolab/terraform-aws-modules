[docker_swarm_manager]
${managers}

[docker_swarm_worker]
${workers}

[docker_swarm_manager_private_ip]
${manager_private_ips}

[efs-mount-target-dns]
${efs_mount_traget_dns}

[${env}:children]
docker_swarm_manager
docker_swarm_worker
