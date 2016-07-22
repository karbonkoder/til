Console one liners to compute ngrams

```ruby
# To compute unigram = word frequency analysis
cat /tmp/1 | ruby -e 'x=Hash.new(0); ARGF.each {|l| l.split.each {|w| x[w]+=1 }}; puts x.sort_by{|k,v| -v}.map{|k,v| "#{k},#{v}"}' > /tmp/ngram

# To compute bigram
cat /tmp/1 | ruby -e 'x=Hash.new(0); y=""; ARGF.each {|l| l.split.each {|w| x[[y,w]]+=1; y=w }}; puts x.sort_by{|k,v| -v}.map{|k,v| "#{k[0]},#{k[1]},#{v}"}' > /tmp/bigram

# To compute trigram
cat /tmp/1 | ruby -e 'x=Hash.new(0); y=""; z=""; ARGF.each {|l| l.split.each {|w| x[[z,y,w]]+=1; z=y;y=w }}; puts x.sort_by{|k,v| -v}.map{|k,v| "#{k[0]},#{k[1]},#{k[2]},#{v}"}' > /tmp/trigram
```
