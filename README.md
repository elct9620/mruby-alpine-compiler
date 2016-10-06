# mruby Alpine compiler

This is a experimental project to prepare cross-compile mruby for ARM.

## Usage


### Run

> $ make

If you wants append argument, you can use `ARGS` to append into command.

> $ make ARGS="-a Apple"

### Compile

> $ make build

## Write your code

This project use `mrbc` to compile ruby code into C bytecode.
The default rule will scan all `.rb` files inside `src` directory.

For example, you can modify `src/entrypoint.rb`

```ruby
puts "Hello Alpine!"
```

Now, run `make`

## Environment

To make a command line application, we provide two constant to receive command line arguments.

```ruby
puts "The ruby receives #{ARGC} arguments."
puts "The argument valus is: "
puts ARGV
```


