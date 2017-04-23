pollutantmean<-function(directory, pollutant, id=1:332)
{
  n <- length(id)
  maindata<-numeric()
  startindex<-1
  for (i in 1:n)
  {
    if(id[i]<10)
    {
      d <- paste("00",id[i],".csv", sep="")
    }
    else if (id[i]>9 && id[i]<100)
    {
      d <- paste("0",id[i],".csv", sep="")
    }
    else
    {
      d <- paste(id[i],".csv", sep="")
    }
    e <- paste(directory,"/",d,sep="")
    x<-read.csv(e)
    if(pollutant == "sulfate")
    {
      index<-2
    }
    else
    {
      index<-3
    }
    pol <- x[,index]
    bad<-is.na(pol)
    data<-pol[!bad]
    len<-length(data)
    if(len>0)
    {
    endindex<-startindex+len-1
    maindata[startindex:endindex] <- data
    startindex <- length(maindata)+1
    }
  }
  means<-mean(maindata, na.rm=TRUE)
  means
}

complete<-function(directory, id=1:332)
{
  n<-length(id)
  result= matrix(nrow=n, ncol=2)
  for (i in 1:n)
  {
    if(id[i]<10)
    {
      d <- paste("00",id[i],".csv", sep="")
    }
    else if (id[i]>9 && id[i]<100)
    {
      d <- paste("0",id[i],".csv", sep="")
    }
    else
    {
      d <- paste(id[i],".csv", sep="")
    }
    e <- paste(directory,"/",d,sep="")
    x<-read.csv(e)
    col2<-x[,2]
    col3<-x[,3]
    counter=0
    nrow=nrow(x)
    for(j in 1:nrow)
    {
      if(!is.na(col2[j]) && !is.na(col3[j]))
      {
        counter <- counter +1
      }
    }
    result[i,1]<-id[i]
    result[i, 2]<-counter
  }
  dimnames(result)<-list(1:nrow(result),c("id", "nobs"))
  result
}

corr<-function(directory, threshold=0)
{
  id=1:332
  n<-length(id)
  outercouner<-0
  for (i in 1:n)
  {
    if(id[i]<10)
    {
      d <- paste("00",id[i],".csv", sep="")
    }
    else if (id[i]>9 && id[i]<100)
    {
      d <- paste("0",id[i],".csv", sep="")
    }
    else
    {
      d <- paste(id[i],".csv", sep="")
    }
    e <- paste(directory,"/",d,sep="")
    x<-read.csv(e)
    col2<-x[,2]
    col3<-x[,3]
    nrow<-nrow(x)
    innercounter<-0
    for(j in 1:nrow)
    {
      if(!is.na(col2[j]) && !is.na(col3[j]))
      {
          innercounter<-innercounter +1
      }
    }
    counter<-0
    if(innercounter>threshold)
    {
      y1=numeric()
      y2=numeric()
      for(j in 1:nrow)
      {
        if(!is.na(col2[j]) && !is.na(col3[j]))
        {
          counter<-counter +1
          y1[counter]<-col2[j]
          y2[counter]<-col3[j]
        }
      }
      outercouner<-outercouner+1
      cr[outercouner]=cor(y1,y2)
    }
  }
  cr
}
