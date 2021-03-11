#import "UIKit/UIKit.h"
#import "UserNotifications/UserNotifications.h"
#include <QtCore>

#import "Firebase/Firebase.h"


@interface QIOSApplicationDelegate : UIResponder <UIApplicationDelegate>
@end

@interface QIOSApplicationDelegate(AppDelegate)
@end

@implementation QIOSApplicationDelegate (AppDelegate)

- (BOOL)application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    Q_UNUSED(application);
    Q_UNUSED(launchOptions);
    // Use Firebase library to configure APIs
//    [FIRApp configure];

    qWarning()<<"test";
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge
                                            completionHandler:^(BOOL granted, NSError *error){
        if(granted == YES) {
            [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
        };
    }];
    [application registerForRemoteNotifications];

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    Q_UNUSED(application);
    UIApplication.sharedApplication.applicationIconBadgeNumber = 0;
}

@end
