//
//  Gift.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Gift.h"


@implementation Gift

@synthesize name = _name;
@synthesize price = _price;
@synthesize place = _place;
@synthesize person = _person;
@synthesize bought = _bought;

-(id)initWithName:(NSString *)name place:(NSString *)place price:(NSNumber *)price person:(NSString *)person bought:(BOOL) bought
{
    self = [super init];
    
    self.name = name;
    self.place = place;
    self.price = price;
    self.person = person;
    self.bought = bought;
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    self.name = [dict objectForKey:@"name"];
    self.place = [dict objectForKey:@"place"];
    self.price = [dict objectForKey:@"price"];
    self.person = [dict objectForKey:@"person"];
    self.bought = [dict objectForKey:@"bought"] == @"true";
    
    return self;
}

-(NSDictionary*) toDictionary
{
    return [NSDictionary dictionaryWithObjectsAndKeys:self.name ?: @"",@"name",self.place ?:@"",@"place",self.price, @"price",self.person ?: @"", @"person",self.bought? @"true":@"false",@"bought", nil];
}

@end
