install_weechat:
    pkg.installed:
        - name: weechat

#Make sure files in the config directory can be read by the salt user
weechat_conf:
  file.recurse:
    - user: {{ pillar['username_user01'] }}
    - group: {{ pillar['username_user01'] }}
    - file_mode: '0600'
    - dir_mode: '0700'
    - source: salt://weechat/config
    - name: /home/{{ pillar['username_user01'] }}/.config/weechat/