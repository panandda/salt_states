{% if grains['os'] == 'Arch' %}
paccache_enable_systemd_service:
    service.enabled:
        - name: paccache.timer

paccache_copy_systemd_service:
    file.copy:
        - name: '/etc/systemd/system/paccache.service'
        - source: '/usr/lib/systemd/system/paccache.service'


paccache_edit_systemd_service:
    file.replace:
        - name: '/etc/systemd/system/paccache.service'
        - pattern: '^ExecStart.*$'
        - repl: 'ExecStart=/usr/bin/paccache -rk1'

#Systemd_service module has to be run as service
#https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.systemd_service.html
paccache_reload_systemd:
    module.run:
        - service.systemctl_reload: []

{% endif %}