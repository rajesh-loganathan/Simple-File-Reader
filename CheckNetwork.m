//
//  CheckNetwork.m
//  Traveltainment
//
//  Created by iMac21 on 01/08/13.
//  Copyright (c) 2013 dhaya. All rights reserved.
//
#import <SystemConfiguration/SystemConfiguration.h>
#import "CheckNetwork.h"

@implementation CheckNetwork


+ (BOOL) currentNetworkStatus {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	BOOL connected;
	BOOL isConnected;
	const char *host = "www.apple.com";
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
	SCNetworkReachabilityFlags flags;
	connected = SCNetworkReachabilityGetFlags(reachability, &flags);
    isConnected = NO;
	isConnected = connected && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
	CFRelease(reachability);
//    if (!isConnected) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Network connection is unavalible.please check your connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alert show];
//    }
	return isConnected;
}
@end
