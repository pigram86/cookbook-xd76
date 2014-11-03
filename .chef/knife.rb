# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "tpigram"
client_key               "#{current_dir}/tpigram.pem"
validation_client_name   "daas-validator"
validation_key           "#{current_dir}/daas-validator.pem"
chef_server_url          "https://207.54.133.24/organizations/daas"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright       "Todd Pigram"
cookbook_license         "apachev2"
cookbook_email           "todd@toddpigram.com"