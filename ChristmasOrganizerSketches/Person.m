//
//  Person.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 21.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize ident = _ident;
@synthesize name = _name;
@synthesize budget = _budget;
@synthesize image = _image;

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    self.ident = [dict objectForKey:@"ident"];
    self.name = [dict objectForKey:@"name"];
    self.budget = [dict objectForKey:@"budget"];
    NSData* imageData = [dict objectForKey:@"image"];
    if(imageData != nil){
        self.image = [[UIImage alloc ] initWithData:imageData];
        [self.image release];
    }
    return self;
}

-(id) initWithName:(NSString *)name budget :(NSNumber *)budget image:(UIImage *)image
{
    self = [super init];
    
    self.ident = nil;
    self.name = name;
    self.budget = budget;
    self.image = image;
    
    return self;
    
}

-(id) initWithIdent: (NSNumber*) ident name:(NSString *)name budget:(NSNumber *)budget image:(UIImage *)image
{
    self = [super init];
    
    self.ident = ident;
    self.name = name;
    self.budget = budget;
    self.image = image;
    
    return self;
    
}

-(NSDictionary* ) toDictionary
{
    NSData* imageData = UIImageJPEGRepresentation(self.image, 1.0);
    return [NSDictionary dictionaryWithObjectsAndKeys:self.ident,@"ident", self.name ?: @"",@"name",self.budget,@"budget", imageData,@"image", nil];
}

-(BOOL)isEqual:(id)object
{
    if (object == self)
    {
     return YES;   
    }
    if (!object || ![object isKindOfClass:[self class]])
    {
        return NO;
    }
    return [self.ident isEqual: [object ident]];
}

-(BOOL) isEqualToOtherPerson:(Person*) p{
    NSLog(@"%@,%@" , self.ident, p.ident);
    return [self.name isEqual:p.name] && ![self.ident isEqual:p.ident];
}

@end
