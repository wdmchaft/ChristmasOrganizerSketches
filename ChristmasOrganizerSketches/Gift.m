//
//  Gift.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Gift.h"


@implementation Gift

@synthesize ident = _ident;
@synthesize name = _name;
@synthesize price = _price;
@synthesize place = _place;
@synthesize person = _person;
@synthesize bought = _bought;
@synthesize image = _image;

-(id)initWithIdent: (NSNumber*) ident Name:(NSString *)name place:(NSString *)place price:(NSNumber *)price person:(NSString *)person bought:(BOOL) bought image:(UIImage *)image
{
    self = [super init];
    
    self.ident = ident;
    self.name = name;
    self.place = place;
    self.price = price;
    self.person = person;
    self.bought = bought;
    self.image = image;
    
    return self;
}
-(id)initWithName:(NSString *)name place:(NSString *)place price:(NSNumber *)price person:(NSString *)person bought:(BOOL) bought image:(UIImage *)image
{
    self = [super init];
    
    self.ident = nil;
    self.name = name;
    self.place = place;
    self.price = price;
    self.person = person;
    self.bought = bought;
    self.image = image;
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    self.ident = [dict objectForKey:@"ident"];
    self.name = [dict objectForKey:@"name"];
    self.place = [dict objectForKey:@"place"];
    self.price = [dict objectForKey:@"price"];
    self.person = [dict objectForKey:@"person"];
    self.bought = [(NSString* )[dict objectForKey:@"bought"] isEqualToString:@"true"];
    NSData* imageData = [dict objectForKey:@"image"];
    if(imageData != nil){
        self.image = [[UIImage alloc ] initWithData:imageData];
        [self.image release];
    }
    return self;
}

-(NSDictionary*) toDictionary
{
    NSData* imageData = UIImageJPEGRepresentation(self.image, 1.0);
    NSLog(@"%@", self.ident);
    return [NSDictionary dictionaryWithObjectsAndKeys:self.ident, @"ident", self.name ?: @"",@"name",self.place ?:@"",@"place",self.price, @"price",self.person ?: @"", @"person",self.bought? @"true":@"false",@"bought", imageData,@"image", nil];
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
    return [self.ident isEqual:[object ident]];
}

-(BOOL) isEqualToOtherGift:(Gift *)g
{
    return [self.name isEqual:g.name] && ![self.ident isEqual:g.ident];
}

@end
