//
//  LinkedListNode.m
//
//  Created by Stephen Lardieri on 9/2/15.
//  Copyright (c) 2015 Stephen Lardieri. All rights reserved.
//

#import "LinkedListNode.h"

@implementation LinkedListNode

#pragma mark - Initializer

- (instancetype) initWithValue: (id) value {
  self = [super init];
  if (self) {
    self.value = value;
  }
  return self;
}

@end
