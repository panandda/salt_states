include:
  - btop.btop_install
  - btop.btop_config_root
  - btop.btop_config_user

#{% if not salt['file.directory_exists']('/home/backmeup') %}
#btop_copy_config:
#  file.managed:
    #- user: root
    #- group: root
#    - source: salt://btop/btop.conf
#    - name: /root/.config/btop/btop.conf
#    - makedirs: true
#  - unless:
#    - fun: file.directory_exists
#      path: /home/backmeup/
#{% endif %}