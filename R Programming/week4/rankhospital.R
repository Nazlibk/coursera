rankhospital<-function(state, outcome, num)
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
    hostbyrank<-c()
    bestResultNumber<-as.numeric(bestresult[ ,1])
    sorted<-sort(bestResultNumber)
    ordered<-order(bestResultNumber)
    for(i in 1:length(sorted))
    {
      hostbyrank[i]<-bestresult[ordered[i], 2]
    }
    counter<-2
    while(counter<length(sorted))
    {
      if(sorted[counter]==sorted[counter-1])
      {
        startindex<-counter-1
        while(sorted[counter]==sorted[counter-1])
        {
          counter<-counter+1
        }
        endindex<-counter
        hostbyrank[startindex:endindex]<-sort(hostbyrank[startindex:endindex])
      }
      counter<-counter+1
    }
    if(is.numeric(num))
    {
      result<-hostbyrank[num]
    }
    else if(num == "worst")
    {
      result<-hostbyrank[length(hostbyrank)]
    }
    else if(num == "best")
    {
      result<-hsotbyrank[1]
    }
    result
  }
}