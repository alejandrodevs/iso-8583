# ISO8583

## Installation
Add this line to your Gemfile:
```ruby
gem 'iso-8583'
```
Run the bundle command to install it.


## Usage
### Decoding a ISO8583 message
```ruby
require 'iso8583'

message = ISO8583::Message.new('ISO02110005508100220000002000000082108321601579500301')

# Getting properties.
message.header  # => <ISO8583::Header:0x007fe7a33ac4c8 @data="ISO021100055">
message.mti     # => <ISO8583::MTI:0x007fe7a33ac428 @data="0810">
message.bitmap  # => <ISO8583::Bitmap:0x007fe7a33ac388 @data="0220000002000000">
message.data    # => <ISO8583::Data:0x007fe7a33ac360 @data="082108321601579500301">

# Getting fields.
message.fields.keys       # => [7, 11, 39]
message.fields[7]         # => <ISO8583::Field:0x007fe7a31a2da8>
message.fields[7].id      # => 7
message.fields[7].data    # => "0821083216"
message.fields[7].value   # => "0821083216"
message.fields[7].options # => {length: 10, codec: :N, type: :FIXED}
```

### Encoding a ISO8583 message
```ruby
require 'iso8583'

message = ISO8583::Message.new

# Setting properties.
message.header = 'ISO021100055' #Optional
message.mti = '0810'

# Setting fields.
message.add_field(7, '0821083216')  # => <ISO8583::Field:0x007fe7a33552e0>
message.add_field(11, '015795')     # => <ISO8583::Field:0x007fe7a3355268>
message.add_field(39, '00')         # => <ISO8583::Field:0x007fe7a3355218>

# Getting full message.
message.bitmap  # => <ISO8583::Bitmap:0x007fe7a33ac388 @data="0220000002000000">
message.to_s    # => 'ISO02110005508100220000002000000082108321601579500301'
```


## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
