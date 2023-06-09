ifaces = files(
  act_namespace + '.xml',
  act_namespace + '.User.xml',
)

install_data(
  ifaces,
  install_dir: dbus_ifaces_dir,
)

install_data(
  act_namespace + '.conf',
  install_dir: dbus_conf_dir,
)

service_conf = configuration_data()
service_conf.set('datadir', act_datadir)
service_conf.set('gdm_conf_file', gdm_conf_file)
service_conf.set('libexecdir', act_libexecdir)
service_conf.set('localstatedir', act_localstatedir)
service_conf.set('path_wtmp', path_wtmp)

service = act_namespace + '.service'

configure_file(
  input: service + '.in',
  output: service,
  configuration: service_conf,
  install: true,
  install_dir: dbus_sys_dir,
)

policy = act_namespace.to_lower() + '.policy'

i18n.merge_file(
  input: policy + '.in',
  output: policy,
  po_dir: po_dir,
  install: true,
  install_dir: policy_dir,
)

if install_systemd_unit_dir
  service = 'accounts-daemon.service'

  configure_file(
    input: service + '.in',
    output: service,
    configuration: service_conf,
    install: true,
    install_dir: systemd_system_unit_dir,
  )
endif

install_data(
  'administrator',
  install_dir: join_paths(act_datadir, 'accountsservice', 'user-templates'),
)

install_data(
  'standard',
  install_dir: join_paths(act_datadir, 'accountsservice', 'user-templates'),
)
