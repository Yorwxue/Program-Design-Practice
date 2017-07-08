#include<iostream>
#include<string>
#include <stdlib.h>
#include <time.h>
using namespace std;
//item
string Destination;
char UniformDestination;
double Property=1000;
string Belonging="none";
int NumOfBelonging=0;
int HolosHelp;
int PriceOfMerchandiseA=50,
	PriceOfMerchandiseB=75,
	PriceOfMerchandiseC=200;
char RandomMerchant;
int Distance=1;
//function
void NameOfDestination();
void Trade();
char WhichKindOfMerchant();
//class
class BaseMerchand
{
private:
	int Wariness;
	int Negotiation;
public:
	void SetWariness(int Value){Wariness=Value;}
	void SetNegotiation(int Value){Negotiation=Value;}
	int GetWariness(){return Wariness;}
	int GetNegotiation(){return Negotiation;}
	//virtual double PriceReduction();
	//virtual double PriceRising();
};
class TravelingMerchant : public BaseMerchand
{
public: 
	double PriceReduction() //override
    {
        return GetNegotiation()*0.11;
    }
    double PriceRising() //override
    {
        return GetNegotiation()*0.13+Traveling(Distance);
    }
	double Traveling(int Distance){return Distance*0.15;}
};
class TownsMerchant : public BaseMerchand
{
public: 
	double PriceReduction() //override
    {
        return GetNegotiation()*0.13;
    }
    double PriceRising() //override
    {
        return GetNegotiation()*0.11;
    }
};
//People introduction
TravelingMerchant Lawrence,
	              Holo;
TownsMerchant TradingMerchant;

//Story start
int main()
{
	//People introduction detail
	Lawrence.SetWariness(2);
    Lawrence.SetNegotiation(2);
    Holo.SetWariness(9);
    Holo.SetNegotiation(9);
	//
	cout<<"Even if Lawrence gain much helping by Holo,he still have a lot of danger."
		<<"how did he work before he meet Holo?"
		<<endl
		<<"Now where we go?"
		<<endl
		<<"TownA or TownB or TownC?"
	    <<endl;
	cin>>Destination;
	NameOfDestination();  //Uniform the name of Distinction
	RandomMerchant=WhichKindOfMerchant();
	cout<<"¡uHello,Lawrence,have some interesting?¡v"
		<<"Merchant"
		<<RandomMerchant
		<<" says"
		<<endl;
	cout<<"In town"
		<<UniformDestination
	    <<endl;
	Trade();
	system("pause");

}

void NameOfDestination()
{
	if(Destination=="townA"||Destination=="towna"||Destination=="A"||Destination=="a")
	{
		UniformDestination='A';
	}
	else if(Destination=="townB"||Destination=="townb"||Destination=="B"||Destination=="b")
	{
		UniformDestination='B';
	}
	else if(Destination=="townC"||Destination=="townc"||Destination=="C"||Destination=="c")
	{
		UniformDestination='C';
	}
	else if(Destination=="townD"||Destination=="townd"||Destination=="D"||Destination=="d")
	{
		UniformDestination='D';
	}
}

void Trade()
{
	double GoldOFTrade=0;
	double GoldOFTradeRadio=1;
	string KindOfTrading;
	int UniformKindOfTrading;
	int NumOfTrading;
	//TradingMerchant's ability
	time_t t;
	srand((unsigned) time(&t));
    TradingMerchant.SetWariness(rand()%10);
    TradingMerchant.SetNegotiation(rand()%10);

	cout<<"You have "
		<<Property
		<<" dollars"
		<<endl
		<<"and,belonging "
		<<Belonging
		<<" about "
		<<NumOfBelonging
		<<endl;
	cout<<"Want Buying or Selling?"
		<<endl;
	cin>>KindOfTrading;
	if(KindOfTrading=="Buying"||KindOfTrading=="buying"||KindOfTrading=="Buy"||KindOfTrading=="buy"||KindOfTrading=="b"||KindOfTrading=="B")   //1 means buying
	{
		UniformKindOfTrading=1;
	}
	else if(KindOfTrading=="Selling"||KindOfTrading=="selling"||KindOfTrading=="Sell"||KindOfTrading=="sell"||KindOfTrading=="s"||KindOfTrading=="S")  //0 means selling
	{
		UniformKindOfTrading=0;
	}
	cout<<"How many?"
		<<endl;
	cin>>NumOfTrading;
	srand((unsigned) time(&t));
	int HoloTime=rand()%2;  //1 means helping,else 0 
	switch(UniformKindOfTrading)   //0 means selling ; 1 means buying
	{
	case 0://Lawrence is selling
		if(NumOfTrading>NumOfBelonging)
		{
			cout<<"You don't have enough belongings."
		}
		if(Lawrence.PriceRising()-TradingMerchant.PriceReduction()>0)
		{
			GoldOFTradeRadio=(Lawrence.PriceRising()-TradingMerchant.PriceReduction())*(10-TradingMerchant.GetWariness())*0.1;
		}
		else
		{
			GoldOFTradeRadio=(TradingMerchant.PriceReduction()-Lawrence.PriceRising())*(10-Lawrence.GetWariness())*0.1;
		}
		break;
	case 1://Lawrence is buying
		if(TradingMerchant.PriceRising()-Lawrence.PriceReduction()>0)
		{
			GoldOFTradeRadio=(TradingMerchant.PriceRising()-Lawrence.PriceReduction())*(10-Lawrence.GetWariness())*0.1;
		}
		else
		{
			GoldOFTradeRadio=(Lawrence.PriceReduction()- TradingMerchant.PriceRising())*(10-TradingMerchant.GetWariness())*0.1;
		}
		break;
	default :
		cout<<"Don't want to trade?"
			<<endl
			<<"OK,see you next time"
			<<endl;
		break;
	}
	switch(UniformDestination)
	{
	case 'A':
	    GoldOFTrade=GoldOFTradeRadio*PriceOfMerchandiseA*NumOfTrading;
		if(GoldOFTrade<Property)
		{
		    cout<<"Trading success,gold of trading is "
			    <<GoldOFTrade
			    <<",thanks!"<<endl;
			//0 means selling ; 1 means buying
	       if(UniformKindOfTrading==0){Property+=GoldOFTrade;} 
	       else{Property-=GoldOFTrade;}
		}
		else
		{
			cout<<"It need "
			    << GoldOFTrade
				<<" dollars,"
				<<endl
			    <<"You dont have enough money,sorry"
			    <<endl
				<<"See you next time"
				<<endl;
		}
		break;
    case 'B':
	    GoldOFTrade=GoldOFTradeRadio*PriceOfMerchandiseB*NumOfTrading;
		if(GoldOFTrade<Property)
		{
		    cout<<"Trading success,gold of trading is "
			    <<GoldOFTrade
			    <<",thanks!"<<endl;
		   if(UniformKindOfTrading==0){Property+=GoldOFTrade;} 
	       else{Property-=GoldOFTrade;}
		}
		else
		{
			cout<<"It need "
			    << GoldOFTrade
				<<" dollars,"
				<<endl
			    <<"You dont have enough money,sorry"
			    <<endl
				<<"See you next time"
				<<endl;
		}
		break;
	case 'C':
	    GoldOFTrade=GoldOFTradeRadio*PriceOfMerchandiseC*NumOfTrading;
		if(GoldOFTrade<Property)
		{
		    cout<<"Trading success,gold of trading is "
			    <<GoldOFTrade
			    <<",thanks!"<<endl;
		   if(UniformKindOfTrading==0){Property+=GoldOFTrade;} 
	       else{Property-=GoldOFTrade;}
		}
		else
		{
			cout<<"It need "
			    << GoldOFTrade
				<<" dollars,"
				<<endl
			    <<"You dont have enough money,sorry"
			    <<endl
				<<"See you next time"
				<<endl;
		break;
		}
	default:
		cout<<"You are a Cheater,trading stop!"
			<<endl;
	}
	
	cout<<"Now you have "
		<<Property
		<<" dollars"
		<<endl
	    <<"It's not far from being a richer!"
	    <<endl;
}

char WhichKindOfMerchant()
{
	int WhatKind;
	time_t t;
	srand((unsigned) time(&t));
	WhatKind=rand()%3;
	switch(WhatKind)
	{
	case 0 :
		return 'X';
	case 1 :
		return 'Y';
	case 2 :
		return 'Z';
	default :
		return 'X';
	}
}