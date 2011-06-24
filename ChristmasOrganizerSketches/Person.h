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

-(id)initWithName: (NSString* ) name budget: (NSNumber* ) budget image: (UIImage*) image;
-(id)initWithIdent: (NSNumber*) ident name: (NSString* ) name budget: (NSNumber* ) budget image: (UIImage*) image;

-(id)initWithDictionary:(NSDictionary *)dict;

-(NSDictionary*) toDictionary;

-(BOOL) isEqualToOtherPerson:(Person*) p;

@property (nonatomic, copy) NSNumber* ident;
@property (nonatomic, copy) NSString* name;
@property (nonatomic,copy) NSNumber* budget;
@property (nonatomic,copy) UIImage* image;

@end
