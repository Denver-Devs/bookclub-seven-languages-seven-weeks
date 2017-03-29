// How would you change / to return 0 if the denominator is zero?

( 1 / 0 ) println // inf

originalDiv := Number getSlot("/")
Number / := method(n, if(n == 0, 0, call sender originalDiv(n)))

( 1 / 0 ) println // 0
