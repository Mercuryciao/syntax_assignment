# syntax_assignment
## Setup
To work on this assignment, you'll need to setup a ruby environment. This
framework was made for Ruby version `3.2.2`, but should work just fine with older
versions of Ruby 3. 

If you're working on Windows, we recommend using the Windows Subsystem for Linux.

On most systems, you can install Ruby using [rbenv](https://github.com/rbenv/rbenv). Follow their guide to get started.

Once installed you can change directory to the root of this assignment and run the following commands to get setup:
```shell
gem install bundler
bundle install
```

Once bundler installs dependencies you should see a message that reads:
```
Bundle complete! 5 Gemfile dependencies, 23 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

## Project Overview
```shell
├── Gemfile # Defines ruby dependencies for the project.
├── Gemfile.lock # Defines locked versions of dependencies that will be installed.
├── README.md
├── Rakefile # Defines tasks that this project runs, like tests.
├── lib # This directory stores your implementation for the BST.
│   ├── binary_search_tree.rb
│   └── node.rb
├── setup.rb # Sets up the environment and loads dependencies.
└── test # Any test files for your implementations can go here.
    ├── binary_search_tree_test.rb
    └── helper.rb # The helper provides a baseline to setup and run tests.
```

The only files you should need to change are the BST implementation in `lib` and
`test/binary_search_tree_test.rb` where you can add your own tests for the tree.
If you wish to test other classes or ruby files you've implemented, you can add additional
test files and they will automatically be run. All test files must end in `_test.rb` and
their first line must be `require 'helper'`.

### Running Tests
You can run the test suite by running `bundle exec rake test` at the root of the project.
Initially, all your tests will be failing.

### Interactive Ruby Console
You can play around with Ruby, and mess with your binary search tree implementation
by running `bundle exec rake console`.

```shell
rake console
irb(main):001> tree = BinarySearchTree.new
=> #<BinarySearchTree:0x00000001098b88f0 @root=nil>
irb(main):002> tree.add("Hello, World!")
=> #<Node:0x000000010999d400 @value="Hello, World!">
irb(main):003> tree.contains?("Hello, World!")
=> true
```

### Debugging
The console is a great way to do exploratory programming and debugging,
but sometimes you need to debug a test. You can add `binding.pry` anywhere
in your ruby code to open up an interactive debugger at that line of code,
similar to the interactive console.

If you then run `bundle exec rake test`, you'll stop at the breakpoint you set
and will be able to interact with your code. The debugger provides extra commands
you can use to debug your code. Type `help` when at a breakpoint to see them.
Commonly used ones are `step` to step into a method call, `next` to execute the next line of code,
and `continue` to keep running the program until the next breakpoint.

```shell
bundle exec rake test
Run options: --seed 14696

# Running:
From: /.../binary_search_tree/lib/binary_search_tree.rb:8 BinarySearchTree#initialize:

    6: def initialize
    7:   binding.pry
 => 8:   @root = nil
    9: end

[1] pry(#<BinarySearchTree>)> @root
=> nil
[2] pry(#<BinarySearchTree>)> self
=> #<BinarySearchTree:0x0000000106eb73f8>
```
