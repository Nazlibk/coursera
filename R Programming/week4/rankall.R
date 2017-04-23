rankall<-function(outcome, num)
{
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  s<-split(data, data$State)
  result<-matrix(nrow=length(s), ncol=2)
  counter<-0
  flags<-FALSE
  flago<-FALSE
  bestresult = data.frame()
  for (i in 1:length(s))
  {
    if(outcome == "heart attack")
    {
      bestresult[1:length(s[[i]][ ,11]),1]<-s[[i]][ ,11]
      bestresult[1:length(s[[i]][ ,11]),2]<-s[[i]][ ,2]
      hostbyrank<-c()
      bestResultNumber<-as.numeric(bestresult[ ,1])
      sorted<-sort(bestResultNumber)
      ordered<-order(bestResultNumber)
      for(j in 1:length(sorted))
      {
        hostbyrank[j]<-bestresult[ordered[j], 2]
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
        result[i,1]<-hostbyrank[num]
        result[i,2]<-names(s[i])
      }
      else if(num == "worst")
      {
        result[i,1]<-hostbyrank[length(hostbyrank)]
        result[i, 2]<-names(s[i])
      }
      else if(num == "best")
      {
        result[i,1]<-hsotbyrank[1]
        result[i,2]<-names(s[i])
      }
    }
    else if(outcome == "heart failure")
    {
      bestresult[1:length(s[[i]][ ,17]),1]<-s[[i]][,17]
      bestresult[1:length(s[[i]][ ,17]),2]<-s[[i]][ ,2]
      hostbyrank<-c()
      bestResultNumber<-as.numeric(bestresult[ ,1])
      sorted<-sort(bestResultNumber)
      ordered<-order(bestResultNumber)
      for(j in 1:length(sorted))
      {
        hostbyrank[j]<-bestresult[ordered[j], 2]
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
        result[i,1]<-hostbyrank[num]
        result[i,2]<-names(s[i])
      }
      else if(num == "worst")
      {
        result[i,1]<-hostbyrank[length(hostbyrank)]
        result[i,2]<-names(s[i])
      }
      else if(num == "best")
      {
        result[i,1]<-hsotbyrank[1]
        result[i,2]<-names(s[i])
      }
    }
    else if(outcome == "pneumonia")
    {
      bestresult[1:length(s[[i]][ ,23]),1]<-s[[i]][,23]
      bestresult[1:length(s[[i]][ ,23]),2]<-s[[i]][ ,2]
      hostbyrank<-c()
      bestResultNumber<-as.numeric(bestresult[ ,1])
      sorted<-sort(bestResultNumber)
      ordered<-order(bestResultNumber)
      for(j in 1:length(sorted))
      {
        hostbyrank[j]<-bestresult[ordered[j], 2]
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
        result[i,1]<-hostbyrank[num]
        result[i,2]<-names(s[i])
      }
      else if(num == "worst")
      {
        result[i,1]<-hostbyrank[length(hostbyrank)]
        result[i,2]<-names(s[i])
      }
      else if(num == "best")
      {
        result[i,1]<-hsotbyrank[1]
        result[i,2]<-names(s[i])
      }
    }
    else
    {
      # print(paste("Error in best(",state,", ",outcome,") : invalid outcome"))
      flago<-TRUE
      break
    }
  }
  if(!flags)
  {
    # print(paste("Error in best(",state,", ",outcome,") : invalid state"))
    flago<-TRUE
  }
  colnames(result)<-c("hospital", "state")
  result
}