[docker_swarm_manager]
${managers}

[docker_swarm_worker]
${workers}

[${env}:children]
docker_swarm_manager
docker_swarm_worker
