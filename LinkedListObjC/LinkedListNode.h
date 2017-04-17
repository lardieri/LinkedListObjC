//
//  LinkedListNode.h
//
//  Created by Stephen Lardieri on 9/2/15.
//  Copyright © 2015 Stephen Lardieri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedListNode : NSObject

@property (strong, nonatomic) id value;
@property (strong, nonatomic) LinkedListNode * next;

- (instancetype) initWithValue: (id) value;

@end
