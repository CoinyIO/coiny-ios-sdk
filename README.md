# Coiny iOS SDK

CoinySDK allows you to buy and sell cryptocurrencies inside your iOS application. 

# Installation

To install the SDK open your Podfile and type:

`pod 'CoinySDK'`

# Authentication 

Coiny SDK is allows you to authenticate with OAuth2 authentication. This means that, you are allowed to manage other people's account that are authorized with your application.

# Getting Started

First of all you need to retrieve API Key and API Secret from Coiny. To add API Key and Secret into your application:

1. Open your AppDelegate and add the following

`Coiny.initialize(appId: "your-app-id", appSecret: "your-app-secret")`

If you want to test it on the sandbox environment:

`Coiny.initialize(appId: "your-app-id", appSecret: "your-app-secret" ,isDevelopment : true)`

2. To authorize a user for your application: 

`Coiny.login(presentingViewController: self, delegate: self)`

You may call this when your user clicks to a button or anything else. There are 2 delegate methods that notifies you if the user is authenticated.

	public protocol CoinyLoginViewDelegate : AnyObject {
		func coinyDidLoggedIn() -> Void
		func coinyLoginDidFail(error : Error?) -> Void
	}
# Making API Calls

## Calling Get Methods

Assume your application has wallets:read permission and the user authorized for that application. You may call the api and get response with 2 different styles.  

	CoinyApiRequest.createRequest(path: "wallets", 
							parameters: nil, 
							httpMethod: "GET", 
							completionHandler: { (data : [String:Any]) in
				print(data)
			} ,failureHandler :{ (error) in

			})
The example above is one of 2 styles which returns a Dictionary that contains response of the user's wallets.

**CoinySDK** contains all the strongly typed response models that API returns. Therefore, you may change the request above like the following:

	CoinyApiRequest.createRequest(path: "wallets", 
							parameters: nil, 
							httpMethod: "GET", 
							completionHandler: { (data : ResponseWrapper<Array<WalletResponse>> ) in
				print(data)
			} ,failureHandler :{ (error) in

			})

Incoming response will be automatically converted to `data` object type. All request/response models implement the Codable protocol, so that, ApiRequest is able to convert the response to strongly typed classes.

## Calling POST/PUT/DELETE Methods

Just like calling the Get requests, you may call all the other methods with the same pattern. For instance, to buy a bitcoin you should call the following.

	CoinyApiRequest.createRequest(path: "orders/buy", 
							parameters: ["pair" : "btc-try" , "price" : 34000 , "orderType" : "Market" , "quantity" : 0] // quantity not needed for market buy order 
							httpMethod: "POST", 
							completionHandler: { (data : ResponseWrapper<Array<TransactionResponse>> ) in // will return an array of transactions because there are at least 2 transaction will occur. 1 is fee transaction, the other is buy transaction
				print(data)
			} ,failureHandler :{ (error) in

			})

Just like above you may use parameters as strongly typed objects too.

	let orderRequest = OrderRequest(pair: "btc-try", 
									orderType: .Market, 
									quantity: 0, price: 10000)

	CoinyApiRequest.createRequest(path: "orders/buy", 
							parameters: orderRequest // instead of dictionary i used strongly typed class
							httpMethod: "POST", 
							completionHandler: { (data : ResponseWrapper<Array<TransactionResponse>> ) in // will return an array of transactions because there are at least 2 transaction will occur. 1 is fee transaction, the other is buy transaction
				print(data)
			} ,failureHandler :{ (error) in

			})

# TODO

 - Detailed models description
 - Reach access_token in the app
