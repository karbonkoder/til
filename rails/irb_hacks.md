Load a file
```
load './filename.rb'
```

Building hack tool belt
```ruby
# Call reload in IRB if this file is changed during session
def reload
  load __FILE__
end

def hack
  # TODO Add specific hack here
end

def toggle
  irb_context.echo ? irb_context.echo = false : irb_context.echo = true
end

# TODO add other helper methods
```
