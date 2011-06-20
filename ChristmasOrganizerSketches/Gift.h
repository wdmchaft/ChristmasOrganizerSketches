//
//  Gift.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Gift : NSObject {
    
}

-(id)initWithName: (NSString* ) name place: (NSString*) place price: (NSNumber* ) price person: (NSString*) person bought:(BOOL) bought image: (UIImage*) image;

-(id)initWithDictionary:(NSDictionary *)dict;

-(NSDictionary*) toDictionary;

@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* place;
@property (nonatomic,copy) NSNumber* price;
@property (nonatomic,copy) NSString* person;
@property (nonatomic,assign) BOOL bought;
@property (nonatomic,copy) UIImage* image;

@end
