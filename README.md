# plumber-brug
Install plumber package. 
install.packages("plumber")

## Run Plumber
b<-plumb("plumber.r")
b$run(port=8000)

Test in one of the following:
* Swagger (in-built in Plumber)
* Postman
* Browser
* cURL
