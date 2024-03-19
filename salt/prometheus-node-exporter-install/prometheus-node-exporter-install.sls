prometheus-node-exporter-install:
    pkg.installed:
        - name: prometheus-node-exporter

prometheus-node-exporter-service-enable:
    service.enabled:
        - name: prometheus-node-exporter.service