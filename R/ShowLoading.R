#' ShowLoading
#'
#' Show the loading of a looping operation.
#' @param start.tim <POSIXct POSIXt>: A time obtain with 'Sys.time()'.
#' @param operation.ndx <integer>: The index number of the operation.
#' @param operation.int <integer>: The total number of operation.
#' @examples
#' start.tim <- Sys.time()
#' for(i in seq_len(10000)){
#'     ShowLoading(start.tim, i , 10000)
#' }

ShowLoading = function(start.tim=NULL, operation.ndx=NULL, operation.int=NULL){
    if (operation.ndx==1){
        cat(format(paste0(" ",format(100*operation.ndx/operation.int,digits=2,nsmall=2)," %"),width=9,justify = "left"),"\r")
    }else{
        restingtime <- as.numeric( (difftime(Sys.time(),  start.tim,units="secs")   / ( operation.ndx/operation.int) ) - difftime(Sys.time(),  start.tim,units="secs"))
        if (restingtime>3600) {
            restingtime <- restingtime/3600
            units <- "hours"
        }else if (restingtime>60) {
            restingtime <- restingtime/60
            units <- "mins"
        }else{
            units <- "secs"
        }
        cat(
            format(paste0(" ",format(100* operation.ndx/operation.int,digits=2,nsmall=2)," %"),width=9,justify = "left"),
            paste0(format(paste0("Resting time: ",format(round(restingtime,2),digits=2,nsmall=2)),width=19,justify = "left")," ",units),
            "\r")
    }
}
