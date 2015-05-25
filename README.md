# ISO 8583
ISO 8583 Financial Messaging for Ruby. This gem aims to provide a easy
and simple way to code an decode ISO 8583 Financial Messages.


## Installation
Add this line to your Gemfile:
```ruby
gem 'iso-8583'
```
Run the bundle command to install it.


## Usage
### Decoding a ISO 8583 message
```ruby
require 'iso8583'

message = ISO8583::Message.new('ISO02110005508100220000002000000082108321601579500301')

# Getting properties.
message.header  # => <ISO8583::Header:0x007fe7a33ac4c8 @data="ISO021100055">
message.mti     # => <ISO8583::MTI:0x007fe7a33ac428 @data="0810">
message.bitmap  # => <ISO8583::Bitmap:0x007fe7a33ac388 @data="0220000002000000">
message.data    # => <ISO8583::Data:0x007fe7a33ac360 @data="082108321601579500301">

# Getting fields.
message.fields.ids        # => [7, 11, 39]
message.fields[7]         # => <ISO8583::Field:0x007fe7a31a2da8>
message.fields[7].id      # => 7
message.fields[7].data    # => "0821083216"
message.fields[7].value   # => "0821083216"
message.fields[7].length  # => 10
message.fields[7].codec   # => :N
message.fields[7].type    # => :FIXED
```

### Encoding a ISO 8583 message
```ruby
require 'iso8583'

message = ISO8583::Message.new

# Setting properties.
message.header = 'ISO021100055' #Optional
message.mti = '0810'

# Adding fields.
message.set_field(7, '0821083216')  # => <ISO8583::Field:0x007fe7a33552e0>
message.set_field(11, '015795')     # => <ISO8583::Field:0x007fe7a3355268>
message.set_field(39, '00')         # => <ISO8583::Field:0x007fe7a3355218>

# Deleting fields.
message.unset_field(11)   # => 11
message.unset_field(39)   # => 39

# Getting full message.
message.bitmap  # => <ISO8583::Bitmap:0x007fe7a33ac388 @data="0200000000000000">
message.to_s    # => "ISO021100055081002000000000000000821083216"
```

### Exceptions
```ruby
require 'iso8583'

message = ISO8583::Message.new

# Raising exceptions.
message.mti = '02000' # => ISO8583::ISO8583LengthException: Must have length == 4
message.header = 'ISO02' # => ISO8583::ISO8583LengthException: Must have length == 12

# ISO 8583 defines that data element 11 must be numeric and have length of 6.
message.set_field(11, '01579A') # => ISO8583::ISO8583CodecException: Must match /^[0-9]*$/
message.set_field(11, '01579') # => ISO8583::ISO8583LengthException: Must have length == 6
```


## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
