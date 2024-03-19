{% if grains['os'] == 'Arch' %}
install_pacman-contrib:
    pkg.installed:
        - name: pacman-contrib
{% endif %}