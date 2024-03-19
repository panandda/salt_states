vim:
  pkg.installed

{% if salt['file.directory_exists']('/home/' + pillar['username_user01']) %}
vimrc_config_user:
  file.managed:
    - user: {{ pillar['username_user01'] }}
    - group: {{ pillar['username_user01'] }}
    - mode: '0644'
    - source: {{ salt['pillar.get']('vim_config:source') }}
    - name: {{ salt['pillar.get']('vim_config:target_user01') }}
{% endif %}

vimrc_config_root:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: {{ salt['pillar.get']('vim_config:source') }}
    - name: {{ salt['pillar.get']('vim_config:target_user01') }}
