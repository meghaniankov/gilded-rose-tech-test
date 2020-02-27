# Gilded Rose Tech Test

Practice tech test in week 10 of Makers.

Refactor and extend legacy code with lengthy nested if statements into clean, readable code. See tech test [requirements](https://github.com/meghaniankov/gilded-rose-tech-test#requirements) and [approach](https://github.com/meghaniankov/gilded-rose-tech-test#approach).

## Overview

This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code. 

## Getting Started

### Run Bundle Install

Before you run the program, make sure your gems are up to date by running:

```
$ bundle install
```

## Running the Progrm

### IRB

```sh
2.6.3 :001 > require './lib/gilded_rose.rb'
 => true 
2.6.3 :002 > aged_brie = Item.new("Aged Brie", 5, 10)
 => #<Item:0x00007f891b13d1d8 @name="Aged Brie", @sell_in=5, @quality=10> 
2.6.3 :003 > backstage_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
 => #<Item:0x00007f891b156ae8 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=11, @quality=10> 
2.6.3 :004 > sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 0, 10)
 => #<Item:0x00007f891ab2db30 @name="Sulfuras, Hand of Ragnaros", @sell_in=0, @quality=10> 
2.6.3 :005 > other_item = Item.new("foo", 5, 10)
 => #<Item:0x00007f891b15fe40 @name="foo", @sell_in=5, @quality=10> 
2.6.3 :006 > conjured_item = Item.new("Conjured Mana Cake", 5, 10)
 => #<Item:0x00007f891b1647d8 @name="Conjured Mana Cake", @sell_in=5, @quality=10> 
2.6.3 :007 > items = [aged_brie, other_item, backstage_pass, sulfuras, conjured_item]
 => [#<Item:0x00007f891b13d1d8 @name="Aged Brie", @sell_in=5, @quality=10>, #<Item:0x00007f891b15fe40 @name="foo", @sell_in=5, @quality=10>, #<Item:0x00007f891b156ae8 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=11, @quality=10>, #<Item:0x00007f891ab2db30 @name="Sulfuras, Hand of Ragnaros", @sell_in=0, @quality=10>, #<Item:0x00007f891b1647d8 @name="Conjured Mana Cake", @sell_in=5, @quality=10>] 
2.6.3 :008 > gilded_rose = GildedRose.new
 => #<GildedRose:0x00007f891b1848f8> 
2.6.3 :009 > gilded_rose.update_quality(items)
 => [#<Item:0x00007f891b13d1d8 @name="Aged Brie", @sell_in=4, @quality=11>, #<Item:0x00007f891b15fe40 @name="foo", @sell_in=4, @quality=9>, #<Item:0x00007f891b156ae8 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=10, @quality=11>, #<Item:0x00007f891ab2db30 @name="Sulfuras, Hand of Ragnaros", @sell_in=0, @quality=10>, #<Item:0x00007f891b1647d8 @name="Conjured Mana Cake", @sell_in=4, @quality=8>] 
```

## Running the tests

To run tests for this program, run:

```
$ rspec
```

## Built With

* Ruby
* Rspec (testing)


## Requirements

Here is the text of the kata:

"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

## The brief:

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

## Approach

* After reviewing the test overview and legacy code, I wrote feature tests based on the program's requirements.
  - These tests all passed so I felt confident that I understood how the legacy code worked before more moving on to making any changes.
* My next step was to break out the programs requirements by Item type and build methods for updating each one. 
  - I made sure that the feature tests never failed. 
  - After I extracted all of the logic into individual methods, I replaced the legacy code with each method.
* At this point I had refactored all of the legacy code but the new code was not DRY. 
* I chose to break out the Item types into Modules for two reasons:
  1. The modules would encapsulate all of the calculations for that item type. 
  2. It would be easy to extend the program with new items. The only changes would be making a new module with corresponding calculations and adding that items name/module pair to the ITEM_TYPES hash in the GildedRose class.
* As always, I used TDD throughout.
