
To do some endpoint response ad-hoc analysis

```ruby
require 'net/http'
require 'json'
 
url = 'your_url'
uri = URI(url)
response = Net::HTTP.get(uri)
response_json = JSON.parse(response)
# now go play with response_json
```
