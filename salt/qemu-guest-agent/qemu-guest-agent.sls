{% if salt['cmd.run']('systemd-detect-virt') == 'kvm' %}
install-qemu-guest-agent:
  pkg.installed:
    - name: qemu-guest-agent

qemu-guest-agent-enable-service:
  service.enabled:
    - name: qemu-guest-agent.service
{% endif %}