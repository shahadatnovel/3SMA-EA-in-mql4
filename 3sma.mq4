//+------------------------------------------------------------------+
//|                                                         3sma.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
input double sl = 10000;
input double tp = 15000;
input double lot = 0.02;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   //double MA_Slow = iMA(NULL,0,100,0,MODE_SMA,PRICE_CLOSE,0);
   double MA_Medium = iMA(NULL,0,50,0,MODE_SMA,PRICE_CLOSE,0);
   double MA_Fast = iMA(NULL,0,30,0,MODE_SMA,PRICE_CLOSE,0);



   if(MA_Fast>MA_Medium)//&& MA_Medium> MA_Slow)
     {
      if(OrdersTotal()==0)
        {
         int BuyOrder = OrderSend(Symbol(),OP_BUY,lot,Ask,0,Ask-tp*Point(),Ask+sl*Point(),"buy order",1234,0,clrAliceBlue);
        }


     }

   if(MA_Fast<MA_Medium )//
   && MA_Medium< MA_Slow)
     {
      if(OrdersTotal()==0)
        {

         int SellOrder = OrderSend(Symbol(),OP_SELL,lot,Bid,0,Bid-tp*Point(),Bid+sl*Point(),1234,0,clrRed);

        }

     }

  }
//+------------------------------------------------------------------+
