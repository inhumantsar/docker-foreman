docker-foreman
==============

Docker image to run [Foreman](http://theforeman.org/). Useful for testing, could also be suitable for production if you like to live dangerously.

By default, this image *does not* install a Puppet Master. Nearly all plugins available on install
are enabled (chef and pulp are not). If you wish to change either of these, edit foreman-installer-answers.yaml
and rebuild the image.

Note that the database is stored within the container so do not remove the container unless you don't mind losing your DB! If
you want to use an external DB, edit the answers file and provide DB connection details.

# Run commands

## For testing: 

`docker pull inhumantsar/foreman:1.7 && docker run -it -p 8443:443 inhumantsar/foreman:1.7`

## For production: 

`docker pull inhumantsar/foreman:latest && docker run -d -p 443:443 --name foreman-latest inhumantsar/foreman:latest`


# Tags Available
    
`latest`, `1.6` -- Latest stable release
`1.7`           
