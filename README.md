# Pushover
A simple ruby module for sending notifications via Pushover.

Requires a [pushover account](https://pushover.net/).


### Example:
```ruby
require 'pushover'

Pushover.send('Your message', user: 'pushover_user_key', token: 'pushover_application_token')

default_pushover_config = Pushover.load_config('/path/to/pushover.conf')
default_pushover_config[:title] = 'Title'
Pushover.save_config('/path/to/pushover.conf', default_pushover_config)

Pushover.send('Another message', default_pushover_config)
```
For more info on which parameters are available, see (https://pushover.net/api).

**NOTE:** This module does not currently support image attachments.