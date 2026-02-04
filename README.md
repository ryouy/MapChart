# MapChart

A minimalist Swift project that demonstrates **interactive graph/chart features** implemented on iOS/macOS using native APIs.

This repository contains a small codebase focused on graph rendering and chart interaction. It is intended as a learning reference or a starting point for building custom visualization tools with Swift and Apple’s UI frameworks.([GitHub][1])

---

## Purpose

The goal of this project is to explore and document techniques for:

* Rendering graphs and charts with native Swift
* Utilizing CoreGraphics / UIKit / SwiftUI for custom drawing
* Managing interactions and test cases in a charting context
* Structuring a scalable iOS/macOS visualization codebase

This repository is designed to be a lightweight exercise in graphics and chart rendering, not a complete charting framework.

---

## Contents

The repository includes:

```
graphtest.xcodeproj
graphtest/
graphtestTests/
graphtestUITests/
```

* **graphtest.xcodeproj** — Xcode project file
* **graphtest/** — App source code (view controllers, chart drawing logic, data models)
* **graphtestTests/** — Unit tests for core logic
* **graphtestUITests/** — UI tests covering user interaction flows

The project is implemented entirely in Swift.([GitHub][1])

---

## Features (Planned / Demonstrated)

This sample application showcases:

* Custom graph/chart rendering
* View and layout management
* Basic interaction logic for highlighting/selecting chart elements
* Test harness for verifying rendering outcomes

> The current project functions as a **prototyping workspace** and a visual reference for chart drawing fundamentals in native Apple platforms.

---

## Requirements

To build and run this project, you will need:

* Xcode 14 or later
* macOS 12 or later
* Swift 5.7+

No external dependencies or CocoaPods packages are required.

---

## Getting Started

1. **Clone the repository**

   ```
   git clone https://github.com/ryouy/MapChart.git
   ```
2. **Open the Xcode project**

   ```
   open MapChart/graphtest.xcodeproj
   ```
3. **Build & Run**

   * Select a simulator or device
   * Press “Run” (⌘R)

The app will launch with the default view, showcasing basic chart/graph rendering.

---

## Development Notes

This project emphasizes:

* Clarity over complexity
* Understanding drawing primitives in Swift
* Practical architecture for small visualization apps

It is intended as both a learning tool and a template for future chart-focused applications.

---

## Tests

Unit and UI tests are included:

* Core rendering logic should be validated via unit tests
* UI tests ensure interactive behavior remains stable

Run tests via:

```
⌘U (Run Tests)
```

---


