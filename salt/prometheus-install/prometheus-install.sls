prometheus-install:
    pkg.installed:
        - name: prometheus

prometheus-install-service-enable:
    service.enabled:
        - name: prometheus.service

prometheus-install-copy-config-files:
    file.managed:
        - user: root
        - group: prometheus
        - mode: '0640'
        - makedirs: false
        - source: {{ salt['pillar.get']('prometheus_config:source') }}
        - name: {{ salt['pillar.get']('prometheus_config:target') }}
    
prometheus-install-service-restart:
    cmd.run:
        - name: systemctl restart prometheus.service