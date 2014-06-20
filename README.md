Chef Cookbook for a Sinatra Web App
====================================

Configures and deploys a sinatra app.  Confirmed to work with Amazon OpsWorks.


Recipes
------------------------------------
* `sinatra::configure` -- one time, makes all the deploy folders
* `sinatra::deploy` -- uses scm to update the codebase, bundle installs, and restarts the server


Required Databag
------------------------------------

```json
{
  "service_realm": "production",
  "web_application_type": "sinatra",
  "opsworks_bundler": { "version": "1.3.5", "manage_package": true },
  "opsworks_rubygems": { "version": "2.0.3" },
  "opsworks": {
    "rack_stack": { "name": "nginx_unicorn", "recipe": "unicorn::rack", "service": "unicorn" },
    "ruby_stack": "ruby"
  },
  "deploy": {
    "MYAPPNAME": {
      "application_type": "sinatra",
      "rack_env": "production",
      "environment": {
        "rack_env": "production"
      },
      "env": {
        "MY_ENV_X": "..."
      }
    }
  }
}
```

Dependencies
------------------------------------
* `deploy`: https://github.com/aws/opsworks-cookbooks/tree/release-chef-11.4/deploy

###### Optional Dependencies

* `nginx`: https://github.com/aws/opsworks-cookbooks/tree/release-chef-11.4/nginx
* `unicorn::rack`: https://github.com/aws/opsworks-cookbooks/tree/release-chef-11.4/unicorn


