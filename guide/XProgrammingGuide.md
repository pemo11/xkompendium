# The little X# programming guide (by Peter Monadjemi)

*** **this is only an early and incomplete draft** *** **this is only an early and incomplete draft**  *** **this is only an early and incomplete draft**  *** this is only an early draft *** this is only an early draft *** 

version 0.1
last update: 06/10/22

**Disclaimer:** This is neither a complete guide nor a rehash of the official X# documentation.

So what is it? Its a light introduction to the X# language by using examples instead of textual descriptions. Its aimed for developers who already know a language like VO, Visual Basic or even C# and like to start with X#.

Please always refer to the X# documentation by the X# team for any reference or if you are in doubt about anything written in this document.

As being said this guide is not complete and its not perfect either. When I started this book the idea was just to document my own coding examples I had created over the years. The purpose of these examples were to help me better understand the nitty gritty details of the X# language (mostly as a note to myself).

While writing this guide I soon realized that I did't cover all the important topics and the number and that the quality of the examples differs as well.

As a real software project this guide is work in progress as well. And altough this not a wiki I will accept pull requests so that any X# developer can contribute her or his examples.

An emphasis in this programming guide will be on database access "the .Net way" (which means 100% offline) but from code only. No bBrowser, no DbServer and no GUI.

## Naming conventions

This topic is really hard because there is no official naming convention and if you ask developers about the conventions they use you will probably get two kind of ansers:

1. We don't use any conventions
2. We use our own conventions

I think we can all (hopefully) agree that using the good old _Hungarian notation_ is not something that fits for being in the 21st century.

Just in case [Hungarian notation](https://en.wikipedia.org/wiki/Hungarian_notation)

## The impact of Roslyn

You may have read this at several occasions. X# sits on top of Roslyn (so to speak) or is based on Roslyn or depends on Roslyn.

Roslyn is just one of these Microsoft "codewords" that the company used extensively in the 80ties and 90ties - like jackets with rolled up sleeves (for example the one that Michael Jackson wore in the famous Thriller video).

The official name is *.NET Compiler platform*.

*(all the pictures in this section have the copyright of Microsoft - taken from https://docs.microsoft.com/en-us/dotnet/csharp/roslyn-sdk/compiler-api-model)*

![Alt Roslyn part 1](images/Roslyn01.png "the Compiler Pipeline")
*Fig 1: the Compiler Pipeline*

Even if a X# developer doesn't know anything about Roslyn and/or doesn't care all (both are totally legit points) there are two takeaways that every X# developer should be aware of:

1. Roslyn makes it easy for developers to write coding helpers for the Visual Studio code editor
2. Roslyn makes it easy for the X# development team to implement new features of the C# language

Argument 2 is especially compelling because we can expect that any or most C# features of a new C# version (remember, C# is already at version 11) will be implemented in X# sooner or later.

## Data types

Since X# is based on the CLR (_Common Language Runtime_) of the underlying .NET runtime it has to use the same datatypes. But they do not have to hame the same names of couse.

### handling of null values
One aspect that had been constantly improved with the different C# version over the years is the handling of null values. Gone are the days where a reference value had to be compared with Null with the == operator or even worse severval null checks had to be chained together if the property of an object property that both can be null had to be checked separately.

Since X# follows C# closely, these kind of convieniences are also available for X#.

### precision and rounding

There are several floating point numeric types (table 1) but I recommend using decimal:

- No rounding errors
- The best way to handle float values in an Oracle database

One reason for not using _decimal_ in the early days of .Net was the fact that each value occupies 28 bytes in memory. But even with older PCs that may "only" be equipped with 2 GB memory space should not be an issue.

