{% if salt['file.directory_exists'](
salt['pillar.get']('home_directory:name')) %}
bashrc_user:
  file.append:
    - source: {{ salt['pillar.get']('bashrc_skel:source') }}
    - name: "/home/{{ pillar['username_user01'] }}/.bashrc"
{% endif %}
