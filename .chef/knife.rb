# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "bhazard"
client_key               "#{current_dir}/bhazard.pem"
chef_server_url          "https://api.chef.io/organizations/workwave"
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright	"Your Company"
cookbook_license	"apachev2"
cookbook_email		"you@example.com"
