#* Return "hello world"
#* @get /hello
function(){
    "hello world"
}

#* Plot a histogram
#* @png
#* @param n: Number of random normals
#* @get /plot
function(n){
    rand<-rnorm(100)
    hist(rand)
}


#* Add two numbers
#* @json
#* @param a: Enter first number
#* @param b: Enter second number
#* @get /adder
adder<-function(a=10,b=10){
    as.numeric(a)+as.numeric(b)
}

#* Linear regression example
#* @json
#* @param x input value
#* @get /lr
linear_reg<-function(x){
    x<-as.numeric(x)
    lr<-lm(formula = mpg~wt,data = mtcars)
    w<-data.frame(wt=x)
    p<-predict(lr,w)
    return(p)
}

#* Forecast with ARIMA model the AirPassenger dataset
#* @param p:int The order of the autoregressive model
#* @param d:int The degree of differencing
#* @param q:int The order of the moving-average model
#* @param P:int The order of the seasonal autoregressive model
#* @param D:int The degree of seasonal differencing
#* @param Q:int The order of the seasonal moving-average model
#* @param h:int Set forecast horizon
#* @get /plotts
#* @png
function(p = 0, d = 0, q = 0, P = 0, D = 0 ,Q = 0, h = 12){
    data(AirPassengers)
    p <- as.numeric(p)
    d <- as.numeric(d)
    q <- as.numeric(q)
    P <- as.numeric(P)
    D <- as.numeric(D)
    Q <- as.numeric(Q)
    h <- as.numeric(h)
    
    md <- arima(AirPassengers, order = c(p,d,q), seasonal = list(order = c(P,D,Q)))
    fc <- forecast::forecast(md, h = h)
    plot(fc)
}
