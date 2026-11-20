module.exports = {
	name: 'car-booking-append',
	script: 'build/index.js',
	cwd: '/var/www/car-booking-app/current',
	node_args: '--env-file=.env', //Include .env
	instances: 1,
	exec_mode: 'fork', //Run as normal node process
	autorestart: true,
	max_memory_restart: '300M' //Memory leak protection
};
