//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Display an initial message
   Print("SABAR YA,, TETAP SEMANGAT : $");

   // Check if target profit has been reached and take action
   double targetProfit = 100.0; // Set your target profit here
   double currentProfit = AccountProfit(); // Get current profit

   if (currentProfit < targetProfit) {
       // Profit not reached, retry trade logic
       Print("Target profit not reached, retrying trade...");
       RetryTrade();
   }
   else {
       // Profit reached, send notification
       Print("Congratulations! Profit target achieved: ", currentProfit);
       NotifyTargetAchieved(currentProfit);
   }

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // You can add cleanup or finalization code here
  }

//+------------------------------------------------------------------+
//| Expert tick function (called on each new tick)                   |
//+------------------------------------------------------------------+
void OnTick()
  {
   // You can add any logic here that needs to be checked on every tick
  }

//+------------------------------------------------------------------+
//| Function to retry the trade if profit target is not reached      |
//+------------------------------------------------------------------+
void RetryTrade()
  {
   // Example: Retry by opening a new trade
   int buyTicket = OrderSend(Symbol(), OP_BUY, 0.1, Ask, 3, 0, 0, "Retry Trade", 0, 0, Blue);

   if (buyTicket < 0) {
       // Failed to open trade, show an error
       Print("Error opening trade: ", GetLastError());
   }
   else {
       // Successfully opened the trade
       Print("Trade retry initiated, ticket number: ", buyTicket);
   }
  }

//+------------------------------------------------------------------+
//| Function to notify when target profit is achieved               |
//+------------------------------------------------------------------+
void NotifyTargetAchieved(double profit)
  {
   // Send a notification
   string message = "Target profit achieved: $" + DoubleToString(profit, 2);
   Alert(message); // Alert the user
   // Optionally, use other notification methods like sending an email
  }
