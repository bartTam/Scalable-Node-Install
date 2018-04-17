#!/bin/sh

sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install python3-pip git

sudo pip3 install --upgrade pip
sudo pip3 install Flask

#!/bin/sh                                                                                                
                                                                                                         
sudo apt-get update                                                                                      
sudo apt-get -y upgrade                                                                                  
                                                                                                         
# Web server install and jupyter                                                                         
sudo apt-get -y install python3-pip git npm nodejs-legacy sqlite nginx                                   
sudo pip3 install --upgrade pip                                                                          
sudo pip3 install --upgrade Flask flask-cors flask-login Flask-Mail pyopenssl jupyter bcrypt             
sudo npm install -g configurable-http-proxy                                                              
sudo pip3 install --upgrade jupyterhub                                                                   
                                                                                                         
# Set up nginx                                                                                           
sudo systemctl enable nginx                                                                              
                                                                                                         
# Set up letsencrypt for ssl                                                                             
sudo apt-get update                                                                                      
sudo apt-get -y install software-properties-common                                                       
sudo add-apt-repository ppa:certbot/certbot                                                              
sudo apt-get update                                                                                      
sudo apt-get -y install python-certbot                                                                   
sudo certbot --nginx                                                                                     
                                                                                                         
# Setup crontab for certbot                                                                              
                                                                                                         
                                                                                                         
# Generate Config files                                                                                  
jupyterhub --generate-config                                                                             
jupyter notebook --generate-config                                                                       
# follow instructions http://test-notebook.readthedocs.io/en/stable/public_server.html                   
                                                                                                         
# Create ad-hoc ssl                                                                                      
#openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem                
#openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12                          
                                                                                                         
# ccal install                                                                                           
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9   
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'        
sudo apt-get update                                                                                      
sudo apt-get -y install r-base python3-tk                                                                
sudo pip3 install --upgrade numpy pandas ccal rpy2 geoparse                                              
                                                                                                    
