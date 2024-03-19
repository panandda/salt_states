{% if grains['os'] == 'Arch' %}
install-reflector:
  pkg.installed:
    - name: reflector

enable-service-reflector-timer:
  service.enabled:
    - name: reflector.timer

reflector-copy-config-files:
    file.managed:
        - user: root
        - group: root
        - mode: '0644'
        - makedirs: false
        - source: {{ salt['pillar.get']('reflector_config:source') }}
        - name: {{ salt['pillar.get']('reflector_config:target') }}
{% endif %}