# RPGDiceCalculator
> A Swift Package for creating and rolling dice formulae. 

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![codebeat-badge][codebeat-image]][codebeat-url]

One to two paragraph statement about your product and what it does.

![](header.png)

## Installation

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/Michaelcraun/DiceCalc.git", majorVersion: 0, minor: 0)
    ]
)
```

## Usage example

You can use the default layout simply by using the default initializer like so:
```swift
import RPGDiceCalculator

struct SomeView: View {
    var body: some View {
        DiceCalculatorView()
    }
}
```

Or you can customize the view's appearance using an instance of the DiceCalculatorConfiguration, like so:
```swift
import RPGDiceCalculator

struct SomeView: View {
    var configuration: DiceCalculatorConfiguration {
        DiceCalculatorConfiguration(
    }
}
```

## Development setup

Describe how to install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

```sh
make install
```

## Release History

* 0.0.5
    * Fixed some layout issues
* 0.0.4
    * Fixed public availability of needed functionality
* 0.0.3
    * Fixed iOS dependency issues
    * *NOTE:* Minimum iOS version is now iOS 14.0
* 0.0.2
    * Fixed iOS dependency issues
    * *NOTE:* Minimum iOS version is now iOS 13.0
* 0.0.1
    * Work in progress

## Meta

Michael Craun – [@opkurix](https://twitter.com/opkurix) – michael.craun@gmail.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
