//
//  LinkedList.h
//
//  Created by Stephen Lardieri on 9/2/15.
//  Copyright © 2015 Stephen Lardieri. All rights reserved.
//

#import "LinkedListNode.h"

@interface LinkedList : NSObject

- (void) addValueToHead: (id) value;
- (void) addValueToTail: (id) value;
- (void) removeValue: (id) value;

+ (void) testList;

@end
