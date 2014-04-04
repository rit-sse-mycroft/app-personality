Personality App
===============

This is an app for Mycroft which contains a collection of sayings.

## Installation

Be sure to run `gem install` before running.

## Running

To run, execute `ruby personality.rb [--no-tls]`


The personality app depends on text-to-speech and speech-to-text, but they do not need to be started before the personality app.

## Sayings

All sayings are stored in the  file `sayings.yml`. Each saying is an element of an array, entered
in a way similar to the following:

```yaml
-
    trigger: come on and slam
    responses:
        - and welcome to
        - the jam
```

In this example, whenever someone says "come on and slam" mycroft will randomly
respond with either "and welcome to" or "the jam." _Note that whitespace is important:_ each block is indented
using exactly four spaces.

### Modifying Sayings

When you modify a saying you must then run `ruby grammar.rb > grammar.xml` to load the
grammar file with your new changes.

_Development tip:_
If you are currently running the personality app and have added or modified a trigger then you
must re-send your grammar to the speech to text application before any changes are reflected.
Follow the steps below to re-send your grammar
(after, of course, compiling the xml file as shown above):

* exit the speech-to-text and personality apps (in no particular order)
* ensure that both applications are closed
* launch the personality and speech-to-text apps (again in no particular order)
