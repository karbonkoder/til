# Label workflow
My emails can be classified broadly into following buckets

1. Task - Someone is waiting on me to do something. A reply is must.
2. Read Later - Good to know, a reply is not required.
3. FYI Short Read - Status updates.

Here is workflow to label emails.

```ruby
while(any unread email) {
  if (reply needed) {
    label as task
  } else {
    if (status update) {
      // no label needed.
      if (is acknowledgement needed) {
        give short reply
      }
      continue
    } else {
      label as read later
    }
  }
}
```

Once emails are labeled, depending on your preference to do task or read stuff, pick a bucket.

## Action Workflow

```
for each task email, assign a broad theme to it.
prioritize themes.
go in theme priority and complete tasks and label as done.
repeat untill all tasks are finished or you are out of time.
```

