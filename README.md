# -unsolved-Exercise-Files---CSS-Core-Concepts-by-James-Williamson-jameswillweb
(unsolved) Exercise Files of CSS: Core Concepts by James Williamson @jameswillweb

These are the unsolved exercise files of Lynda.com course titled; CSS: Core Concepts - by James Williamson
@jameswillweb

* class selector takeaway
* id selector takeaway = A fair amount of thought should go into using ID and Class selectors. Classes and IDs are not a means of styling page content. They exist to help give your content more meaning. ex 02_05.
* Reason to use ID: Is the content unique and does that content need to be identified?
 
 ** Sometimes ID won't be the appropriate element to extend the meaning. ex 02_05 artists in ul.
 
 * element-specific selectors: These selectors require bit more processing work from the browser. Limit their use to times when they are the most effient selector available. Use only when it is the best selector for the job.
 
 * Kind of selectors: Total 9 mentioned in the course. 1- element selector, 2- descendent selector, 3- child selector, 4- adjacent selector, 5- attribute selector, 6- pseudo-class selector, 7- pseudo element selector, 8-  nth child and 9- structural
 
 * Universal-selector: Often overlooked, and rightly so. Do not confuse this with inheritence.
 
 ** Child-style overriding the parent style, that is how inhritence works.
 
 * Descendent selector: general. any selector contained within the selector to the left, no matter how deeply nested
 
 * Child selector: targets only the immediate children (nested).
 
 * adjacent selector: targets only the selector(s) immediately following the selector to the left. (sibling?)
 
 * Attribute selector[]: targets the attributes or the values inside the element.
 Kinds: ^= begins with, $= ends with, p[class="red"] will target only the element with class "red" in case there are elements with multiple classes. p[class"red"] means the value "red" must match exactly.
 p[class~="green"] will target only the space seperated words that includes this word.
 a[href^="http://"] begins with
 a[href$="pdf"] ends with. useful with putting pdf icons
 a[title*="visit] existance of value - visit - white space not necessary - literal string and not white spaced ... LARGE difference w/ a[title*="visit"].
 *= space separated values as in a class to be singled out amongst multiple classes.
 - e.g. a[href*="_docs"]
 
 ** upto here, the selectors manipulate the DOM.
 ** below are pseudo class selectors that target selectors outside of the DOM, like in changed states, that are too specific to be targetd with simple selectors.
 ** Types of pseudo class selectors:
 
 * dynamic pseudo-class selectors: target elements based on something other than attributes, content, or element type. Usually refers to something that can change over time, or that is based on user interaction.
 This is the most commong pseudo-class selector.
 e.g. ExF 02_14
 - link, - link states, and - target
 
 * UI element state pseudo-class selectors: target specific user interface elements in regards to whether or not they are currently enabled. To learn more about them, read the selector level specs. Used in online applications.
 
 * structural pseudo-class selectors: target elements based on specialized information within the DOM that simple selectors cannot target. This can be pattern-matching, child-to-parent relationship, or other structural information.
 e.g. the nth-child selector
 Lets you targets element based on more complex patterns withing the dom
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 