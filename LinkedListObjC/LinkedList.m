//
//  LinkedList.m
//
//  Created by Stephen Lardieri on 9/2/15.
//  Copyright © 2015 Stephen Lardieri. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList ()

@property (strong, nonatomic, readwrite) LinkedListNode * head;

@end


@implementation LinkedList

#pragma mark - Public methods

// Add "value" to the beginning of the list.
- (void) addValueToHead: (id) value {
  LinkedListNode * newNode = [[LinkedListNode alloc] initWithValue: value];

  newNode.next = self.head;
  self.head = newNode;
}


// Add "value" to the end of the list.
- (void) addValueToTail: (id) value {
  LinkedListNode * newNode = [[LinkedListNode alloc] initWithValue: value];

  // Special case if the list is empty.
  if (!self.head) {
    self.head = newNode;
    return;
  } else {
    LinkedListNode * current = self.head;
    while (current.next) {
      current = current.next;
    }

    current.next = newNode;
  }
}


// Remove the first instance of "value" from the list.
- (void) removeValue: (id) value {

  // Special case if the list is empty.
  if (!self.head) {
    return;
  }

  // Special case if the value appears at the head of the list.
  if (self.head.value == value) {
    self.head = self.head.next;
    return;
  }

  for (LinkedListNode * current = self.head; current.next; current = current.next) {
    if (current.next.value == value)
    {
      current.next = current.next.next;
      return;
    }
  }
}

#pragma mark - Test methods

- (void) printList {

  for (LinkedListNode *node = self.head; node; node = node.next) {
    NSLog(@"%@", node.value);
  }

}

+ (void) testList {

  NSNumber * zero = [NSNumber numberWithInt:0];
  NSNumber * one = [NSNumber numberWithInt:1];
  NSNumber * two = [NSNumber numberWithInt:2];
  NSNumber * three = [NSNumber numberWithInt:3];
  NSNumber * four = [NSNumber numberWithInt:4];
  NSNumber * five = [NSNumber numberWithInt:5];
  NSNumber * six = [NSNumber numberWithInt:6];
  NSNumber * seven = [NSNumber numberWithInt:7];
  NSNumber * eight = [NSNumber numberWithInt:8];
  NSNumber * nine = [NSNumber numberWithInt:9];
  NSNumber * ten = [NSNumber numberWithInt:10];

  LinkedList * testList = [[LinkedList alloc] init];
  [testList addValueToTail:one];
  [testList addValueToTail:two];
  [testList addValueToTail:three];
  [testList addValueToTail:four];
  [testList addValueToTail:five];
  [testList addValueToTail:six];
  [testList addValueToTail:seven];
  [testList addValueToTail:eight];
  [testList addValueToTail:nine];
  [testList addValueToTail:ten];

  NSLog(@"Original list:");
  [testList printList];

  NSLog(@"Remove three (some element in the middle)");
  [testList removeValue:three];
  [testList printList];

  NSLog(@"Remove one (first element)");
  [testList removeValue:one];
  [testList printList];

  NSLog(@"Remove ten (last element)");
  [testList removeValue:ten];
  [testList printList];

  NSLog(@"Remove zero (element not in the list)");
  [testList removeValue:zero];
  [testList printList];

}

@end
