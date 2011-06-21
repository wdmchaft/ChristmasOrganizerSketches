//
//  Person.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 21.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize firstname = _firstname;
@synthesize lastname = _lastname;
@synthesize nickname = _nickname;
@synthesize budget = _budget;
@synthesize image = _image;

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    self.firstname = [dict objectForKey:@"firstname"];
    self.lastname = [dict objectForKey:@"lastname"];
    self.nickname = [dict objectForKey:@"nickname"];
    self.budget = [dict objectForKey:@"budget"];
    NSData* imageData = [dict objectForKey:@"image"];
    if(imageData != nil){
        self.image = [[UIImage alloc ] initWithData:imageData];
        [self.image release];
    }
    return self;
}

-(id) initWithFirstname:(NSString *)first lastname:(NSString *)last nickname:(NSString *)nick budget:(NSNumber *)budget image:(UIImage *)image
{
    self = [super init];
    
    self.firstname = first;
    self.lastname = last;
    self.nickname = nick;
    self.budget = budget;
    self.image = image;
    
    return self;
    
}

-(NSDictionary* ) toDictionary
{
    NSData* imageData = UIImageJPEGRepresentation(self.image, 1.0);
    return [NSDictionary dictionaryWithObjectsAndKeys:self.firstname ?: @"",@"firstname",self.lastname ?: @"",@"lastname",self.nickname ?: @"",@"nickname",self.budget,@"budget", imageData,@"image", nil];
}

@end
