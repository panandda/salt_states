{# {% from "pillar" import bashrc with context %} #}
{% if not salt['file.search'](
salt['pillar.get']('bashrc_skel:name'),
pattern=salt['pillar.get']('bashrc_skel:source'),
multiline='true') %}
bashrc_skel:
  file.append:
    - source: {{ salt['pillar.get']('bashrc_skel:source') }}
    - name: {{ salt['pillar.get']('bashrc_skel:name') }}
{% endif %}
bash_options:
  file.managed:
    - source: {{ salt['pillar.get']('bash_options:source') }}
    - name: {{ salt['pillar.get']('bash_options:name') }}