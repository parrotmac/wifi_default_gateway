//
//  GatewayInterfaceInterface.m
//  OBDInterface
//
//  Created by Isaac Parker on 2/22/18.
//  Copyright © 2018 Isaac Parker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "getgateway.h"
#import <arpa/inet.h>
#import "GatewayInterfaceInterface.h"

@implementation GatewayInteraceInterface

+ (NSString *)getGatewayIP {
    NSString *ipString = nil;
    struct in_addr gatewayaddr;
    int r = getdefaultgateway(&(gatewayaddr.s_addr));
    if(r >= 0) {
        ipString = [NSString stringWithFormat: @"%s",inet_ntoa(gatewayaddr)];
    }
    return ipString;
}

@end
