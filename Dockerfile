FROM jenkins/jenkins:lts
RUN /bin/jenkins-plugin-cli --plugins cloudbees-folder configuration-as-code credentials github instance-identity job-dsl script-security structs role-strategy ws-cleanup
COPY ./my_marvin.yml /var/jenkins_home/casc_configs/
COPY --chown=jenkins:jenkins ./job_dsl.groovy /usr/share/jenkins/ref/init.groovy.d/job_dsl.groovy
USER root
RUN apt-get update && apt-get install -y build-essential