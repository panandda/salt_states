install_ssh:
  pkg.installed:
    #If nothing is true, this will happen: https://github.com/saltstack/salt/issues/38393
    {% if grains['os'] == 'Arch' or grains['os'] == 'EndeavourOS' %}
    - name: openssh
    {% endif %}
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' %}
    - name: ssh
    {% endif %}

enable_and_start_ssh:
  service.running:
    - enable: true
    - name: sshd

{% if salt['file.directory_exists']('/home/' + pillar['username_user01']) %}
insert_key_user:
  ssh_auth.present:
  - ssh_keys: 
    - {{ pillar['user01_public_ssh'] }}
  - user: {{ pillar['username_user01'] }}
  - enc: ssh-rsa
  - source: {{ salt['pillar.get']('ssh_config:source') }}
{% else %}
#Only this way the ssh key can be sent correctly
#https://github.com/saltstack/salt/issues/58021#issuecomment-681860792
insert_key_root:
  ssh_auth.manage:
  - ssh_keys: 
    - {{ pillar['user01_public_ssh'] }}
  - user: root
  - enc: ssh-rsa
  - source: {{ salt['pillar.get']('ssh_config:source') }}
{% endif %}