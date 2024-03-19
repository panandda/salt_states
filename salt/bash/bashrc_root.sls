{% if salt['file.file_exists']('/root/.bashrc') %}
bashrc_root:
  file.append:
    - source: {{ salt['pillar.get']('bashrc_skel:source') }}
    - name: /root/.bashrc
bash_options_root_copy_skel:
  file.append:
    - source: {{ salt['pillar.get']('bash_options:source') }}
    - name: /root/.bash_options
{% else %}
bashrc_root_copy_skel:
  file.append:
    - source: {{ salt['pillar.get']('bashrc_skel:source') }}
    - name: /root/.bashrc
bash_options_root_copy_skel:
  file.append:
    - source: {{ salt['pillar.get']('bash_options:source') }}
    - name: /root/.bash_options
{% endif %}
