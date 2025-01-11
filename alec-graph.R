library(ggplot2)

a = function(fit = function(t){t * 1.45 + 0.1}){
  ggplot() +
    geom_function(fun = fit, aes(color = "Fitted")) +
    geom_function(fun = function(t){t = 1.5 * t})
  
}
a()

b = function(fit = function(t){t * 1.45 + 0.1}, df = tibble(this_name = "foobar")){
  this_name = df$this_name
  ggplot() +
    geom_function(fun = fit, aes(color = "Fitted")) +
    geom_function(fun = function(t){t = 1.5 * t}, aes(color = this_name))
  
}
b()
