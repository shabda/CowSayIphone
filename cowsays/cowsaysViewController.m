//
//  cowsaysViewController.m
//  cowsays
//
//  Created by Shabda Raaj on 10/11/11.
//  Copyright 2011 Agiliq. All rights reserved.

//

/*
 
 ________________________________________
 / You have Egyptian flu: you're going to \
 \ be a mummy.                            /
 ----------------------------------------
 \   ^__^
 \  (oo)\_______
 (__)\       )\/\
 ||----w |
 ||     ||
 */

#import "cowsaysViewController.h"

@interface NSString (Extended)
-(NSString *) withCow;
-(NSString *) normalizeString;
@end

@implementation NSString (Extended)
-(NSString *) normalizeString{
    int max_length = 40;
    //NSLog(@"%@", max_length);
    int strn_count = [self length];
    if (strn_count < max_length){
        return [NSArray arrayWithObject: self];
    }
    NSMutableArray* strings = [NSMutableArray arrayWithCapacity: 10];
    int elem = strn_count/max_length+1;
    int i;
    for (i = 0; i < elem-1; i++){
        NSRange range = NSMakeRange(i*max_length, max_length);
        NSLog(@"%d", i);
        NSString* subs = [self substringWithRange: range];
        [strings addObject: subs];
    }
    int last = strn_count - i * max_length;
    NSRange range = NSMakeRange(i*max_length, last);
    
    NSString* last_strn = [self substringWithRange: range];
    last_strn = [last_strn stringByPaddingToLength: max_length withString: @" " startingAtIndex: 0];
    [strings addObject: last_strn];
    
    int j;
    for (j=0; j<=i; j++){
        if (j == 0){
            [strings replaceObjectAtIndex: j 
                    withObject:[NSString stringWithFormat:@"/%@\\", [strings objectAtIndex:j]]];
        }
        else if (j == i){
            [strings replaceObjectAtIndex: j 
                    withObject:[NSString stringWithFormat:@"\\%@/", [strings objectAtIndex:j]]];
        }
        else{
            [strings replaceObjectAtIndex: j 
                               withObject:[NSString stringWithFormat:@"|%@|", [strings objectAtIndex:j]]];
        }
        
    }
    return [strings componentsJoinedByString:@"\n"];
    
    
}

-(NSString *) withCow
{
    NSString *cow = @" ________________________________________\n"
    @"%@\n"
    @" ----------------------------------------\n"
    @"        \\   ^__^\n"
    @"         \\  (oo)\\_______\n"
    @"            (__)\\       )\\/\\\n"
    @"                ||----w |\n"
    @"                ||     ||\n";
    
    NSString* thought = [self normalizeString];
    cow = [NSString stringWithFormat: cow, thought];
    return cow;
}

@end




@implementation cowsaysViewController
@synthesize withCow;
@synthesize original;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    withCow.text = [original.text withCow];
}


- (void)viewDidUnload
{
    [self setOriginal:nil];
    [withCow release];
    withCow = nil;
    [self setWithCow:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cowSay:(id)sender {
    withCow.text = [original.text withCow];
    [original resignFirstResponder];
}
- (void)dealloc {
    [original release];
    [withCow release];
    [withCow release];
    [super dealloc];
}
@end
