//
//  Person.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 21.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
    
}

-(id)initWithFirstname: (NSString* ) first lastname: (NSString*) last nickname: (NSString*) nick budget: (NSNumber* ) budget image: (UIImage*) image;

-(id)initWithDictionary:(NSDictionary *)dict;

-(NSDictionary*) toDictionary;

@property (nonatomic, copy) NSString* firstname;
@property (nonatomic, copy) NSString* lastname;
@property (nonatomic, copy) NSString* nickname;
@property (nonatomic,copy) NSNumber* budget;
@property (nonatomic,copy) UIImage* image;

@end
