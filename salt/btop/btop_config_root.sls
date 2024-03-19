btop_root:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: {{ salt['pillar.get']('btop_config:source') }}
    - name: {{ salt['pillar.get']('btop_config:target_root') }}
    - makedirs: true
