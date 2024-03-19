{% if salt['file.directory_exists']('/home/' + pillar['username_user01']) %}
btop_user:
  file.managed:
    - user: {{ pillar['username_user01'] }}
    - group: {{ pillar['username_user01'] }}
    - mode: '0644'
    - makedirs: true
    - source: {{ salt['pillar.get']('btop_config:source') }}
    - name: {{ salt['pillar.get']('btop_config:target_user01') }}
{% endif %}
