# The Ceylon programming language - Introduction

This is the first of a post series where I'm going to talk about some new
programming languages with a nice future ahead. During this series I'll explore
deeper the **Ceylon**, **Dart**, **Elixir**, **Rust** and **Swift 2** languages.

The plan is to make a post a week until December 15 (or maybe a little more) and
spend 2 weeks exploring each one of them. In the first week I'll explore the
general aspects of the language and make some comparisons with other very known
and established languages. In the post of the second week I'll go deeper inside
each one of the languages and explore the individual advantages on use them.

## Preface

There are hundred of programming languages out there. Which one should we use?
Which help do we have to choose well? How do they compare to each other? This
document is an attempt to provide some answers to these questions. Naturally, it
would not be possible to provide complete answers: as I mentioned, there are too
many programming languages. Nevertheless, we chose five languages with a
potential to grow in importance in the coming years. These programming languages
are Elixir, Rust, Dart, Swift and Ceylon. During this project, we shall be
talking about each one of them. These discussions will be in breath, not in
depth. Their goal is to provide the reader with the minimum of information
necessary to compare them, and who knows, to lure one or other interested person
in learning them in a greater level of details. In any case, we hope to
contribute a bit to the popularization of these programming languages, which -
likely - will be paramount to the development of computer science in the next
ten years.

## Ceylon

### How did it appear?

Red Hat<sup><a name="1_b" href="#1">1</a></sup> is the world's leading
provider of open source software solutions and it has initiated and
sponsored<sup><a href="#2" name="2_b">2</a></sup> the development of the Ceylon
programming language. Ceylon is first and foremost an open source community
project.

According to the language's F.A.Q<sup><a href="#3" name="3_b">3</a></sup>, Ceylon
was
designed to be a modern Java with better specification, as we can see in the
excerpt:

> Well, we've been designing and building frameworks and libraries for Java for
> ten years, and we know its limitations intimately. And we're frustrated. The
> most recent releases of Java go some distance to alleviating some problems,
> but even the newest language features strain to accommodate past mistakes and
> the requirement for full backward compatibility.
>
> But much of our frustration is not even with the Java language itself. The
> extremely outdated class libraries that form the Java SE SDK are riddled with
> problems. Developing a great SDK is a top priority of the project.

### Why was it designed and implemented?

Ceylon has a lot of interesting features but, we can start with this
definition on the homepage<sup><a href="#4" name="4_b">4</a></sup>: _"Ceylon is
a language for writing large programs in teams"_. The language is deeply
influenced by Java and it was designed and implemented by people who were
hugely involved with Java. People like Gavin King, the lead of the Ceylon
project in Red Hat and also the creator of Hibernate<sup><a href="#5"
name="5_b">5</a></sup> (the most popular Object Relational Mapper for Java) and
other projects in the Oracle's platform.

Modularity is in the very core of the Ceylon language. When a Ceylon's code is
compiled, it produces module archives. In fact is very similar to Java's
modules. It generates a _*.car_ file, with _*.class_ files zipped on it. Just
like Java's _*.jar_. You'll never be exposed to unpacked _*.class_ files in
Ceylon. So here we got 2 conclusions. The first one is that the compiler
really forces the modularity and facilitates the distribution of the generated
code. The second one is that the Ceylon compiled code runs on the Java Virtual
Machine (JVM). This second fact is very important because by running on the JVM,
Ceylon's code is fully interoperable with Java, the Java SDK and its libraries.
In fact, this interoperability is a major priority of the project.

<!-- exemplo de código interoperável com Java -->
This is an example of the use of the Java's HashMap data structure on a Ceylon
program:

``` js
import java.util { HashMap }

value javaHashMap = HashMap<String,Integer>();
javaHashMap.put("zero", 0);
javaHashMap.put("one", 1);
javaHashMap.put("two", 2);
print(javaHashMap.values());
```

Ceylon runs on the Javascript virtual machine too. In fact the Ceylon's compiler
can generate Javascript code if told to do so. It generates modular Javascript
in the CommonJS modules format. We'll see more on Javascript generation in the
future.

<!-- TODO inserir aqui um exemplo de código interoperável com Javascript -->
``` js
dynamic {
    dynamic req = XMLHttpRequest();
    req.onreadystatechange = void () {
        if (req.readyState==4) {
            document.getElementById("greeting")
                    .innerHTML = req.status==200
                            then req.responseText
                            else "error";
        }
    };
    req.open("GET", "/sayHello", true);
    req.send();
}
```

Ceylon's project always tells how important is the toolset for a complete and
successful programing project so it ships with a really great Integrated
Development Environment (IDE) built on a Eclipse plug-in. We'll see more
detailed information on the **install and run** section below.

### How can we use it, e.g., install and run?

By running in the JVM, the Ceylon's compiler got the advantage to run
on every operating system which has a Java Virtual Machine implementation. It  
runs both on Java 7 and Java 8 (prior versions are not supported). So before
installing the Ceylon package, be sure to have the correct Java version
installed. On this work, I'm using the 1.1 version of the language, released on
09 October 2014.

For installation on a Mac, you can use the Homebrew installer:

```
brew update
brew install ceylon
```

There are packages for both Debian and Fedora/Red Hat GNU/Linux flavors on the
project's download page: [http://ceylon-lang.org/download/](http://ceylon-lang.org/download/).

For a platform agnostic installation, download the zip archive (http://ceylon-lang.org/download/dist/1_1_0),
unzip on your system's prefered folder and add the **/ceylon-1.1.0/bin** folder
to the path of your system. In a unix-like system you can do that by adding the
line below on the **~/.bashrc** file of you user's directory:

```
export PATH="/path/to/ceylon-1.1.0/bin:$PATH"
```

Now let's check if the installation works. By forcing the modularity, Ceylon
implies some conventions on the compilation process. At first the code we'll
write must be on a **"source"** directory. So place the following code on a file
called **"./source/hello.ceylon"**:

``` java
shared void hello() {
  print("Hello Ceylon!");
}
```

Outside the **source's** folder, run the command:

```
ceylon compile source/hello.ceylon
```

Checkout the **module** folder created on the same level as the **source**
folder. Check it's content for the _*.car_ file and some others. To run the
compiled source, run the following command:

```
ceylon run --run hello default
```

### Simple programs

I will demonstrate some features of the language by writing some simple programs
and analysing some details right after it.

#### The treelike structure, simple classes and visibility

I'll use this example to illustrate the treelike structure that Ceylon has.
Ceylon's named argument lists provide an elegant way for initializing objects
and collections. The goal of this facility is to replace the use of XML for
expressing hierarchical structures such as documents, user interfaces,
configuration and serialized data.

I'll use this notation to create a binary search tree and make a depth-first
in-order traversal.

```js
shared class Node(val, left = null, right = null) {
    shared Integer val;
    shared Node? left;
    shared Node? right;
}

shared void caminhamento_central(Node b) {
    if(exists next = b.left) {
        caminhamento_central(next);
    }
    process.write(b.val.string + " ");
    if(exists next = b.right) {
        caminhamento_central(next);
    }
}

shared void run() {
    Node arvore = Node {
        val = 1;
        left = Node {
            val = 2;
            left = Node {
                val = 4;
                left = Node { val = 8; };
                right = Node { val = 9; };
            };
            right = Node {
                val = 5;
                left = Node { val = 10; };
                right = Node { val = 11; };
            };
        };
        right = Node {
            val = 3;
            left = Node {
                val = 6;
                left = Node { val = 12; };
                right = Node { val = 13; };
            };
            right = Node {
                val = 7;
                left = Node { val = 17; };
                right = Node { val = 15; };
            };
        };
    };

    caminhamento_central(arvore);
    print("");
}
```

The result of this program must be:

```
8 4 9 2 10 5 11 1 12 6 13 3 17 7 15
```

Look at the word _shared_ on some points of the example. This _shared_
annotation marks a declaration as being visible outside the scope in which it is
defined, or a package as being visible outside the module to which it
belongs<sup><a href="#6" name="6_b">6</a></sup>.

It's all about visibility<sup><a href="#7" name="7_b">7</a></sup>. Classes,
interfaces, functions, values, aliases, and type parameters have names.
Occurrence of a name in code implies a hard dependency from the code in which
the name occurs to the schema of the named declaration. We say that a class,
interface, value, function, alias, or type parameter is visible to a certain
program element if its name may occur in the  code that belongs to that program
element. The visibility of a declaration depends upon where it occurs, and upon
whether it is annotated _shared_. 

#### Random numbers and Java interoperability

Ceylon's SDK is under constant development<sup><a href="#8"
name="8_b">8</a></sup> and there
aren't a random numbers implementation yet. But Ceylon can use the Java SDK, so
I'll use the Java random numbers interface to work on a Ceylon's simple example.

``` js
// Import from Java SDK
import java.util { Random }

shared Integer getRandomInteger(Integer a, Integer b, Random r) {
    value range = b - a + 1;
    value fraction = (range * r.nextDouble());
    return (fraction + a).integer;
}

shared void run() {
    Random random = Random();
    for(number in 1..100) {
        print(getRandomInteger(1, 100, random));
    }
}
```

To use the Java SDK (and other libraries from outside the language's SDK) you
must use the module structure that is conventioned in the language. I'll use
this example to show it.

Save the code above on a file called **random.ceylon** inside of the following
structure of directories: **./source/example/random/**. This structure
corresponds to the namespace of the module we are creating. It's just like Java
always did.

Inside this same folder, create the file **module.ceylon**. It is the file that
will specify the dependencies our module have with external resources (like Java
libraries) and formalize it's namespace. The content of this file must be:

```js
module example.random "1.0.0" {
    import java.base "8";
}
```

The _java.base_ module in JDK has Java base packages such as _java.lang_,
_java.util_, _java.io_, _java.net_, _java.text_, NIO and security<sup><a
href="#9" name="9_b">9</a></sup>.
All done, inside of the project's root, run the command:

```
ceylon compile
```

The module will be compiled with the correct dependencies and the files will be
generated in the correspondent directory of the module (in our example, it
would be **./modules/example/random/1.0.0/**). Then we can run the code with the
command:

```
ceylon run example.random
```

The program will execute calling the method _run_ (like the _main_ method in
Java) inside the package _example.random_.

## Quotes

- <sup>[[1](#1_b)]</sup> <a name="1" href="https://www.redhat.com/" target="_blank">https://www.redhat.com/</a>
- <sup>[[2](#2_b)]</sup> <a name="2" href="http://ceylon-lang.org/documentation/1.1/faq/#who_s_behind_this_project/" target="_blank">http://ceylon-lang.org/documentation/1.1/faq/#who_s_behind_this_project/</a>
- <sup>[[3](#3_b)]</sup> <a name="3" href="http://ceylon-lang.org/documentation/1.1/faq/#why_a_new_language/" target="_blank">http://ceylon-lang.org/documentation/1.1/faq/#why_a_new_language/</a>
- <sup>[[4](#4_b)]</sup> <a name="4" href="http://ceylon-lang.org/documentation/1.1/faq/#what_is_ceylon/" target="_blank">http://ceylon-lang.org/documentation/1.1/faq/#what_is_ceylon/</a>
- <sup>[[5](#5_b)]</sup> <a name="5" href="http://hibernate.org/" target="_blank">http://hibernate.org/</a>
- <sup>[[6](#6_b)]</sup> <a name="6" href="http://ceylon-lang.org/documentation/1.1/reference/annotation/shared/">http://ceylon-lang.org/documentation/1.1/reference/annotation/shared/</a>
- <sup>[[7](#7_b)]</sup> <a name="7" href="http://ceylon-lang.org/documentation/current/spec/html_single/index.html#visibility">http://ceylon-lang.org/documentation/current/spec/html_single/index.html#visibility</a>
- <sup>[[8](#8_b)]</sup> <a name="8" href="https://github.com/ceylon/ceylon-sdk/" target="_blank">https://github.com/ceylon/ceylon-sdk/</a>
- <sup>[[9](#9_b)]</sup> <a name="9" href="http://ceylon-lang.org/documentation/1.1/reference/interoperability/java-from-ceylon/" target="_blank">http://ceylon-lang.org/documentation/1.1/reference/interoperability/java-from-ceylon/</a>

## References

- [http://ceylon-lang.org/blog/2013/02/26/ceylon-in-the-browser/](http://ceylon-lang.org/blog/2013/02/26/ceylon-in-the-browser/)
- [http://ceylon-lang.org/blog/](http://ceylon-lang.org/blog/)
- [http://ceylon-lang.org/documentation/1.1/faq/language-design/](http://ceylon-lang.org/documentation/1.1/faq/language-design/)
- [http://ceylon-lang.org/documentation/1.1/spec/html_single/](http://ceylon-lang.org/documentation/1.1/spec/html_single/)
- [http://ceylon-lang.org/documentation/faq/](http://ceylon-lang.org/documentation/faq/)
- [http://ceylon-lang.org/documentation/roadmap/](http://ceylon-lang.org/documentation/roadmap/)
- [http://ceylon-lang.org/](http://ceylon-lang.org/)
- [http://lingualeo.com/pt/jungle/syntactic-sugar-319567#/page/1](http://lingualeo.com/pt/jungle/syntactic-sugar-319567#/page/1)
- [https://blog.openshift.com/ceylon-awesome-tea-or-a-new-language-to-learn/](https://blog.openshift.com/ceylon-awesome-tea-or-a-new-language-to-learn/)
- [https://github.com/ceylon](https://github.com/ceylon)
- [https://news.ycombinator.com/item?id=8436326](https://news.ycombinator.com/item?id=8436326)
- [http://spinejs.com/docs/commonjs](http://spinejs.com/docs/commonjs)
- [https://under-linux.org/content.php?r=8009](https://under-linux.org/content.php?r=8009)
- [https://www.reddit.com/r/programming/comments/1qjcvy/first_production_release_of_ceylon_language/cddo162](https://www.reddit.com/r/programming/comments/1qjcvy/first_production_release_of_ceylon_language/cddo162)
- [https://www.youtube.com/watch?v=gbI6nooTHQY](https://www.youtube.com/watch?v=gbI6nooTHQY)
