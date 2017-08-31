package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
    def pascal(c: Int, r: Int): Int = {
      if (c == 0 || c == r) 1 else pascal(c, r - 1) + pascal(c - 1, r - 1)
    }
  
  /**
   * Exercise 2
   */
    def balance(chars: List[Char]): Boolean = {


      def eval(chars: List[Char], acc: Int): Boolean = {
        if(chars.isEmpty && acc == 0){
          return true
        }else if(chars.isEmpty && acc != 0){
          return false
        }

        if(acc >= 0 && chars.head == '(') {
          eval(chars.tail,acc+1)
        } else if(acc >= 0 && chars.head == ')'){
          eval(chars.tail,acc-1)
        } else {
          eval(chars.tail,acc)
        }
      }

      eval(chars,0)

    }

  /**
   * Exercise 3
   */
    def countChange(money: Int, coins: List[Int]): Int = {

      if(money == 0) 1
      else if (money < 0) 0
      else if (money >= 1 && coins.isEmpty) 0
      else countChange(money, coins.tail) + countChange(money - coins.head, coins)
      }
    }