To return a random record from a model in Rails
```
Model.offset(rand(Model.count)).first
```

To return a random set of N records from a model in Rails
```
# postgresql
Model.limit(N).order("RANDOM()")
# mysql
Model.limit(N).order("RAND()")
```

Source

https://hashrocket.com/blog/posts/rails-quick-tips-random-records
http://stackoverflow.com/questions/5342270/rails-3-get-random-record
http://www.titov.net/2005/09/21/do-not-use-order-by-rand-or-how-to-get-random-rows-from-table/
http://www.petefreitag.com/item/466.cfm
http://stackoverflow.com/questions/19412/how-to-request-a-random-row-in-sql/19568
