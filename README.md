# Pre-work - *Tip*

**Tip** is a tip calculator application for iOS.

Submitted by: **Hannah Ryan**

Time spent: **9** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Change default tip percentage in Settings
- [x] Split bill calculation

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/Kzia91Vv0TzXYSF75G/giphy.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

GIF created with GIPHY

## Notes

In order to get the view somewhat centered, I had to align the right side further left than I had expected.
I ran into issues with the input when using a comma instead of a period and implemented special handling.
When trying to split currency formatting into its own function (to be used independently both upon loading the initial zeros and when changing the bill amount), I ran into unwrapping issues.

## License

    Copyright 2020 Hannah Ryan

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
