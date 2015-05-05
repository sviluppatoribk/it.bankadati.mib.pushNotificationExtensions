/*
 Copyright 2015 Bankadati
 */

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface PushNotificationExtensions : CDVPlugin
{
    NSString *notificationCallbackId;
    NSString *callback;
}

@property (nonatomic, copy) NSString *callbackId;
@property (nonatomic, copy) NSString *notificationCallbackId;
@property (nonatomic, copy) NSString *callback;

- (void)isPushEnabled:(CDVInvokedUrlCommand*)command;

@end
