# Using thermald to avoid thermal throttling
1. Install `thermald` for your distro, on many distros it might be installed by default
2. Copy the `thermal-conf.xml` file into the `/etc/thermald/` directory
3. Depending on your ambient temperature you might want to lower the `<Temperature>` line to make thermald kick in more aggressively. (65000 = 65°C)
4. Copy the `thermal-cpu-cdev-order.xml` file into the `/etc/thermald/` directory
5. Run `sudo systemctl restart thermald`

# Making thermald respect your config files
Some distributions enable the `--adaptive` option by default, which ignores manual config files.

Edit `/usr/lib/systemd/system/thermald.service` and remove `--adaptive` from the `ExecStart=` line. Then do a `systemctl daemon-reload` so systemd realizes the change. Thermald should then respect your configuration files.
