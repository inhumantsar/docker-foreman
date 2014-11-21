docker-foreman
==============

Docker image to run [Foreman](http://theforeman.org/)

# Tags Available
    
    `latest`, `1.6` -- Latest stable release
    `1.7`           

# Building

    docker build -t inhumantsar/foreman .

# Running

    docker run -ti -h foreman.domain.com -p 8443:443 foreman
