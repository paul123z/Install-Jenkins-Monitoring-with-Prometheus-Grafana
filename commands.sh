# install 'Prometheus Metrics' plugin on your Jenkins
#prometheus data should be now available at URL: 
#     http://18.192.80.50:8080/prometheus

docker run -d --name prometheus -p 9090:9090 prom/prometheus

docker run -d --name grafana -p 3000:3000 grafana/grafana

docker ps
docker ps -a

docker exec -it b5982f2852d7 /bin/sh

cd /etc/prometheus

vi prometheus.yml

#add to the end:
  - job_name: "jenkins"
    metrics_path: /prometheus
    static_configs:
      - targets: ['18.192.80.50:8080/']

#restart prometheus pod
docker restart f88445fcd5b2

