add_user_alpharatio:
  user.present:
    - name: {{ pillar['username_user02'] }}
    - shell: /bin/bash
    - home: /home/{{ pillar['username_user02'] }}
    - usergroup: True
    - password: {{ pillar['user02_password'] }}