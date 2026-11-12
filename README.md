# Linked Lists in Objective-C: There’s a Protocol for That!

_Seattle, Washington — October 7, 2015_

The interviewer studied my scribbles on the whiteboard.

“Well, your code looks _correct_—but can you eliminate the special cases?”

The year was 1992, the language was C++, and I was applying for an internship across the lake at Microsoft. I had just finished writing a typical answer to a typical interview question: implement a linked list, with methods to insert nodes at the head and tail, and delete the first node with a given value.

Microsoft interns back then did not get free tablets or private concerts at Gas Works Park, as they did in 2015, but they did get to throw Bill Gates into his own swimming pool. Standing between me and a backyard barbecue in Medina was bunch of code that looked like this:

```C++
void LinkedList::removeValue (void * value) {
  if (!this->head) {
    return;
  }

  if (this->head->value == value) {
    LinkedListNode * zombie = this->head;
    this->head = this->head->next;
    delete zombie;
  }

  for (LinkedListNode * current = this->head; current->next; current = current->next) {
    if (current->next->value == value)
    {
      LinkedListNode * zombie = current->next;
      current->next = zombie->next;
      delete zombie;
      return;
    }
  }
}
```

I thought about the interviewer’s challenge for a minute, and realized that I could use a pointer to a pointer—a double-pointer—to track whose “next” pointer needed to be modified when I removed a node from the list.

```C++
void LinkedList::removeValue (void * value) {
  for (LinkedListNode ** current = &this->head; *current; current = &(*current)->next) {
    if ((*current)->value == value)
    {
      LinkedListNode * zombie = *current;
      *current = zombie->next;
      delete zombie;
      return;
    }
  }
}
```

Satisfied, my interviewer started asking me soft questions about what kinds of programming I enjoyed and what my favorite classes were; the questions you get asked when you have passed the interview but it is not quite time to hand you off to the next interviewer.

Fast forward to September 2015. After leaving Microsoft, I had decided to jump into the world of Apple mobile devices, and I wanted to get up to speed on iOS development quickly. At the time, there was a programming boot camp in South Lake Union (now defunct) that offered an “iOS Development Accelerator” class, so I signed up.

“You have to learn Objective-C. Every iOS development job out there requires Objective-C,” explained Brad, my instructor, at the beginning of the fifth week. “Maybe someday the world will convert over to Swift, but for now…” My fifteen classmates and I groaned. After spending the first month of the class writing in Swift, it was apparently time for us all to grow up.

Okay, let’s see. Header files. Yes, I remember those; I used to use them back in the ’90s. And pointers. Yeah, I remember those too—and all the problems they can cause. “ARC has eliminated most of those problems,” Brad reassured us. “Of course, you can turn _off_ ARC, but we’ll save that for Week 7. For right now, just practice implementing some data structures.”

Stack. Queue. Linked List. The weekly homework assignment read like every job interview I had ever been on. “How hard could this be?” I thought. “Objective-C is based on C, and so is C++, so I should able to bang this out.”

Well, not quite.

It turns out that the very same Objective-C mechanism that saves us from ourselves—ARC—really doesn’t like it when you take the address of a pointer. So my old college trick of using a double-pointer to eliminate the special-case code in the linked list wasn’t going to work.

Luckily, I understood that the C++ technique of taking the address of a variable isn’t really about the address; it’s about obtaining a _writeable reference_ to a variable that can be used to modify the variable’s value without having to know who owns it.

In my case, there were two different variables that I might need to modify, depending on circumstances:

- The `head` property in the list class itself.
- The `next` property in the node class.

So then I began to think about how I might persuade two different classes to give me a writeable reference to one of their properties, in a uniform way.

Even though I had only been an iOS developer for a month, and an Objective-C developer for three days, I had already learned that whenever I found myself saying, “I know how to do that on [some other platform], there must be a way in iOS…” the wise oracles of Stack Overflow, Ray Wenderlich, and NSHipster would rise up to sing in chorus:

_“There’s a protocol for that!”_

Brad had already taught us about protocols in Swift, and I had even written a few of my own for previous homework projects. I knew that protocols are Apple’s answer to polymorphism: giving different classes a uniform interface, so they can be used by other code that doesn’t have to know which specific class is conforming to (implementing) that protocol.

What, exactly, did my protocol need to require of its conforming classes? Well, a node pointer property: specifically, a node pointer property that can be read with a “getter” to walk the list, and that can be changed with a “setter” to point to some other node when inserting or removing a node in the list.

A quick check of the relevant Objective-C syntax persuaded me that I could implement custom getters and setters in my conforming classes to synthesize the protocol’s property any way I wanted, including by redirecting it to another property in the same class.

With that, I was finally able to write a basic linked list in Objective-C with no special-case code for the head node versus other nodes.
