base:
  '*':
    - ssh.ssh
    - qemu-guest-agent.qemu-guest-agent
    - bash.bash
    - vim.vim
    - tmux.tmux
    - locate.locate
    - htop.htop
    - btop.btop
    - pacman-contrib.pacman-contrib
    - paccache.paccache
    - tldr.tldr
    - reflector.reflector
    - prometheus-node-exporter-install.prometheus-node-exporter-install
  'media':
    - weechat.weechat
  'prometheus':
    - prometheus-install.prometheus-install
