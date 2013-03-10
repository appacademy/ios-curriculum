# Notes on Software Design and Object Orientation

* Biggest theme: keep things simple
 * Keep things short, and to the point
 * Classes and methods should be describable in a few words; should be "real"
   things that would make sense to a non programmer
 * Reduce the level of interconnections; highly interconnected systems are
   difficult to understand and fragile
 * These are guidelines; the goal is to create code that, when you come back
   to it later is easy to understand, extend, test
 * Investing in thinking about design can pay dividends later, but also try to
   be pragmatic; focus on areas which you think will be likely to be
   problematic later
* Public/private APIs
 * Safety: don't expose methods that let the user mess up your object's data
* Keep the classes simple and short
 * It's hard to digest lots of code at one time
 * Break problem down into understandable, bite-sized components
 * It's easier to understand a class when you can summarize it in a few words
* Keep internal state small
 * Classes need instance variables for settings
 * A warning sign that a class does too much is if it has lots of variables
 * Often it becomes hard to reason about too much state
  * As you add more state, you have to think about all the ways these
    variables could interact
* Don't Repeat Yourself
 * avoid repetition, because if you ever want to change this logic, you have
   to touch many places
 * hard to keep everything consistent; bugs can be introduced
 * If you see something repetitious, consider "factoring out" that
   functionality into another method
* Don't write code until you need it
 * Only wastes your time; overwhelms user with options; more code to maintain
   and understand later
 * Don't write methods until you want to use them
 * Don't create abstractions and factor out code until you need to
 * Reduces complexity of interactions
 * Design interfaces which let you 
* Loose coupling
 * Try hard not to rely on the implementations of specific classes; rely on
   an "interface"
 * Future programmers should be able to come up with a new implementation
   meeting that interface, and not change your code
