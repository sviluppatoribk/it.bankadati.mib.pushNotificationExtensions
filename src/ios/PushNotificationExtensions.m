#import "PushNotificationExtensions.h"

@implementation PushNotificationExtensions

@synthesize callbackId;
@synthesize notificationCallbackId;
@synthesize callback;

- (void)isPushEnabled:(CDVInvokedUrlCommand*)command;
{
	self.callbackId = command.callbackId;

	#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    UIUserNotificationSettings *currentSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (currentSettings.types != UIUserNotificationTypeNone)
	{
		[self successWithMessage:@"true"];
	}
	else
	{
		[self successWithMessage:@"false"];
	}
	#endif

	#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
	UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
	if(type != UIRemoteNotificationTypeNone)
	{
		[self successWithMessage:@"true"];
	}
	else
	{
		[self successWithMessage:@"false"];
	}
	#endif
}

-(void)successWithMessage:(NSString *)message
{
    if (self.callbackId != nil)
    {
        CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
        [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
    }
}

-(void)failWithMessage:(NSString *)message withError:(NSError *)error
{
    NSString        *errorMessage = (error) ? [NSString stringWithFormat:@"%@ - %@", message, [error localizedDescription]] : message;
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];

    [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
}

@end
