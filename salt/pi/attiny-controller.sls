attiny-controller-pkg:
  cacophony.pkg_installed_from_github:
    - name: attiny-controller
    - version: 1.3

attiny-controller-service:
  service.running:
    - name: attiny-controller
    - enable: True
    - watch:
      - attiny-controller-pkg

