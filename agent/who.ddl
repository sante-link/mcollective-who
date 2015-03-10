# vim:syntax=ruby:
metadata :name        => 'who',
         :description => 'Logged users reporting agent for MCollective',
         :author      => 'Romain Tartière',
         :license     => 'MIT',
         :version     => '1.0',
         :url         => 'https://github.com/sante-link/mcollective-who',
         :timeout     => 10

action "who", :description => 'Echos the list of signed-in users on the host' do
  display :always
  output :users,
         :description => 'The list of signed-in users of the host',
         :display_as  => 'Users'
end
