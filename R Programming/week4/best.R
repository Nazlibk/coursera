best<-function(state, outcome)
{
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  s<-split(data, data$State)
  counter<-0
  flags<-FALSE
  flago<-FALSE
  bestresult = data.frame()
  for (i in 1:nrow(data))
  {
    if(outcome == "heart attack")
    {
      if(data[i, 7]==state)
      {
        flags<-TRUE
        counter<-counter + 1
        bestresult[counter,1] = data[i, 11]
        bestresult[counter,2] = data[i, 2]
      }
    }
    else if(outcome == "heart failure")
    {
      if(data[i, 7]==state)
      {
        flags<-TRUE
        counter<-counter + 1
        bestresult[counter, 1] = data[i, 17]
        bestresult[counter,2] = data[i, 2]
      }
    }
    else if(outcome == "pneumonia")
    {
      if(data[i, 7]==state)
      {
        flags<-TRUE
        counter<-counter + 1
        bestresult[counter, 1] = data[i, 23]
        bestresult[counter,2] = data[i, 2]
      }
    }
    else
    {
      print(paste("Error in best(",state,", ",outcome,") : invalid outcome"))
      flago<-TRUE
      break
    }
  }
  if(!flags)
  {
    print(paste("Error in best(",state,", ",outcome,") : invalid state"))
    flago<-TRUE
  }
  if(!flago)
  {
    minHos<-c()
    minNumber<-10000
    bestresultnumber<-as.numeric(bestresult[ ,1])
    for(i in 1:nrow(bestresult))
    {
      if(!is.na(bestresultnumber[i]))
      {
        if(bestresultnumber[i]<minNumber)
        {
          minNumber <- bestresultnumber[i]
          minHos[1]<-bestresult[i,2]
        }
        else if(bestresultnumber[i]==minNumber)
        {
          minHos[length(minHos)+1]<-bestresult[i,2]
        }
      }
    }
    result<-minHos[1]
    if(length(minHos)>1)
    {
      for(i in 2:length(minHos))
      {
        if(result>minHos[i])
        {
          result(minHos[i])
        }
      }
    }
    result
  }
}


