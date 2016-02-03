Project is a node.js server and ember app skeleton project:

  * Ember-cli 1.13.15
  * Node.js 4.2.6-ro
  * Alpine linux 3.3.1
  * Docker 1.9.1

To build the ember app (in ember_app directory):

  ```
     cd ember_app
     npm install && bower install && ember b
  ```
  
To build the docker image:

  ```
     docker build --force-rm=true -t costco/myApp:0.0.1 .
  ```
  
To run the docker image as a docker container:

  ```
     docker run -d -p 3000:3000 costco/myApp:0.0.1 --name="myApp"
  ```
  
To confirm that the ember app is being served up by node.js:

  ```
     http://localhost:3000/
  ```

To stop the docker container:

  ```
     Docker kill myApp
  ```
