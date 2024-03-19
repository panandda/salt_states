tmux_install:
  pkg.installed:
    - name: tmux

{% if salt['file.directory_exists']('/home/' + pillar['username_user01']) %}
tmux_conf_user:
  file.managed:
    - user: {{ pillar['username_user01'] }}
    - group: {{ pillar['username_user01'] }}
    - mode: '0644'
    - source: {{ salt['pillar.get']('tmux_config:source') }}
    - name: {{ salt['pillar.get']('tmux_config:target_user01') }}
{% endif %}

tmux_conf_root:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: {{ salt['pillar.get']('tmux_config:source') }}
    - name: {{ salt['pillar.get']('tmux_config:target_root') }}
