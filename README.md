#Basic ERB

ERB is an important tool that we use to generate HTML. This exercise is the same as generating HTML strings with one twist; you use ERB to get to the solutions instead of doing it all yourself. You should find that you have to write less code, with less `if`s to solve the same problems. You should also find that the string representing the HTML we want to produce is much more readable. ERB does a lot of the heavy lifting.

## Goals

* More class/object practice
* Using a library (gem) to do work for us
* More practice with getting tests green
* Beginning to look at inheritance. `HTMLGenerator` inherits from `ERBGenerator`. `HTMLGenerator` inherits the `erb` method from `ERBGenerator`
* Passing hashes as arguments to methods. Notice how you can drop the `{}` if it's the last argument!

## Exercise

Follow the tests! Remember to remove the `skip` method call to move on to the next test.
