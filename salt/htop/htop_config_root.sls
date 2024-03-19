htop_config_root:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: true
    - source: {{ salt['pillar.get']('htop_config:source') }}
    - name: {{ salt['pillar.get']('htop_config:target_root') }}
