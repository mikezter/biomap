set :application, "biomap"
set :repository,  "git@github.com:mikezter/biomap.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

set :user, :mike
set :use_sudo, false

role :app, "vs209172.vserver.de"
role :web, "vs209172.vserver.de"
role :db,  "vs209172.vserver.de", :primary => true
