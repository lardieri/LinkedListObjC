//
//  SettableNodePointer.h
//
//  Created by Stephen Lardieri on 9/3/15.
//  Copyright © 2015 Stephen Lardieri. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LinkedListNode;

@protocol SettableNodePointer <NSObject>

@property (strong, nonatomic, readwrite) LinkedListNode * node;

@end
