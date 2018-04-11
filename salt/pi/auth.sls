prevent-root-ssh-login:
  file.append:
    - name: /etc/ssh/sshd_config
    - text: "PermitRootLogin no" 

prevent-password-logins:
  file.line:
    - name: /etc/ssh/sshd_config
    - mode: replace
    - match: ".*PasswordAuthentication .*"
    - content: "PasswordAuthentication no"

install-cacophony-pi-ssh-key:
  ssh_auth.present:
    - user: pi
    - source: salt://pi/cacophony-pi.pub
    - config: '%h/.ssh/authorized_keys'


ssh-service:
  service.running:
    - name: ssh
    - enable: True
    - watch:
      - prevent-root-ssh-login
      - prevent-password-logins
