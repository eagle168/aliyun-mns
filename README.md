# aliyun-mns
[![Build Status](https://travis-ci.org/skinnyworm/aliyun-mns.svg)](https://travis-ci.org/skinnyworm/aliyun-mns) [![Code Climate](https://codeclimate.com/github/skinnyworm/aliyun-mns.png)](https://codeclimate.com/github/skinnyworm/aliyun-mns) [![Code Coverage](https://codeclimate.com/github/skinnyworm/aliyun-mns/coverage.png)](https://codeclimate.com/github/skinnyworm/aliyun-mns) [![Gem Version](https://badge.fury.io/rb/aliyun-mns.svg)](http://badge.fury.io/rb/aliyun-mns)

Talk to the mighty Aliyun mns with charming ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aliyun-mns'
```

And then execute:

    $ bundle

As this branch of the gem is not yet merged into the master branch, you can not install it via `gem install` for now.

## Configuration

### Command line configuration

The gem come with a command line tool `mns`. It can help you easily manage the aliyun mns within the terminal. In order to use this tool, you need to provide a configuration yaml file in your home directory which contains information about your mns access_id and keys.

The configuration file should be stored at `~/.aliyun-mns.yml`

```

access_id:  'lUxxxxxxxx'
key:        'VWxxxxxxxxxxxxxxxxxxxxx'
region:     'cn-hangzhou'
owner_id:   'ckxxxxxxxx'

```


### Rails configuration

If you are going to use this gem in a rails environment. You need to create a configuration file at `<RAILS_ROOT>/config/aliyun-mns.yml`. In this way, you can use different set of queues for your development or production environments.

```

development:
	access_id:  'lUxxxxxxxx'
	key:        'VWxxxxxxxxxxxxxxxxxxxxx'
	region:     'cn-hangzhou'
	owner_id:   'ckxxxxxxxx'

production:
	access_id:  'lUxxxxxxxx'
	key:        'VWxxxxxxxxxxxxxxxxxxxxx'
	region:     'cn-hangzhou'
	owner_id:   'ckxxxxxxxx'

```

### Config in an application

At last you can also config the gem in place, by excute the following code before invoking and queue service.

```ruby
Aliyun::Mns.configure do |config|
  config.access_id = 'access-id'
  config.key = "key"
  config.region = 'region'
  config.owner_id = 'owner-id'
end
```


## Commandline

This gem comes with a handy commandline tool `mns` to help you manage your queue. Once the queue is installed. Execute 'mns --help' to find out what commands are supported.

```
$ mns --help

Commands:
  mns consume [queue] -wait <wait_seconds>  # 从[queue]队列接受消息并删除
  mns create [queue]                        # 创建一个消息队列
  mns delete [queue]                        # 删除一个消息队列
  mns peek [queue]                          # 从[queue]队列中peek消息
  mns queues                                # 列出所有消息队列列表
  mns send [queue] [message]                # 往[queue]队列发送[message]消息
```

Following are few examples.

#### 消息队列列表

```
$ mns queues
消息队列列表
another
another1
another2
another3
another4
another5
```

#### 往队列发送消息

```
$ mns send another "Test message"
发送消息到another队列
<?xml version="1.0"?>
<Message xmlns="http://mns.aliyuncs.com/doc/v1">
  <MessageBodyMD5>82DFA5549EBC9AFC168EB7931EBECE5F</MessageBodyMD5>
  <MessageId>55D5B01D1AE93D78-1-14979D45F33-200000001</MessageId>
</Message>
```

#### Peek队列中的消息
 ```
$ mns peek another
Peek 队列another中的消息
=============================================
队列: another
ID: 55D5B01D1AE93D78-1-14979D45F33-200000001
MD5: 82DFA5549EBC9AFC168EB7931EBECE5F
Enqueue at: 2014-11-04 16:03:21 +0800
First enqueue at: 2014-11-04 16:03:21 +0800
Dequeue count: 0
Priority: 10
=============================================
Test message
```


#### 消费队列中的消息

Be careful, consume command will first receive the message and then delete the message within a time period specfied by the queue.

 ```
$ mns consume another
Consume 队列another中的消息
=============================================
队列: another
ID: 55D5B01D1AE93D78-1-14979D45F33-200000001
MD5: 82DFA5549EBC9AFC168EB7931EBECE5F
Receipt handle: 1-ODU4OTkzNDU5My0xNDE1MDg4MzU2LTEtMTA=
Enqueue at: 2014-11-04 16:03:21 +0800
First enqueue at: 2014-11-04 16:05:26 +0800
Next visible at: 2014-11-04 16:05:56 +0800
Dequeue count: 1
Priority: 10
=============================================
Test message
```



## Usage

Following are some example useage of the gem. You can read the specs to understand the full features of this gem

```ruby
#get a list of queue object
queues = Aliyun::Mns::Queue.queues

#get all queues start with name 'query'
queues =Aliyun::Mns::Queue.queues(query: "query")

#get all queues start with name 'query'
queues = Aliyun::Mns::Queue.queues(size: 5)

#Obtain a queue object with name "aQueue"
queue = Aliyun::Mns::Queue["aQueue"]

#Create a new queue
Aliyun::Mns::Queue["aQueue"].create

#Create a new queue with polling wait 30 seconds
Aliyun::Mns::Queue["aQueue"].create(:PollingWaitSeconds => 30)

#Delete an existing queue
Aliyun::Mns::Queue["aQueue"].delete

#Send a text message
Aliyun::Mns::Queue["aQueue"].send_message "text message"

#Send a text message with priority option
Aliyun::Mns::Queue["aQueue"].send_message "text message", :Priority=>1

#Receive a message
message = Aliyun::Mns::Queue["aQueue"].receive_message

#Sample rspec for a message
expect(message).not_to be_nil
expect(message.id).to eq("5fea7756-0ea4-451a-a703-a558b933e274")
expect(message.body).to eq("This is a test message")
expect(message.body_md5).to eq("fafb00f5732ab283681e124bf8747ed1")
expect(message.receipt_handle).to eq("MbZj6wDWli+QEauMZc8ZRv37sIW2iJKq3M9Mx/KSbkJ0")
expect(message.enqueue_at).to eq(Time.at(1250700979248000/1000.0))
expect(message.first_enqueue_at).to eq(Time.at(1250700779318000/1000.0))
expect(message.next_visible_at).to eq(Time.at(1250700799348000/1000.0))
expect(message.dequeue_count).to eq(1)
expect(message.priority).to eq(8)

#Receive a message with option to override the default poll wait time of the queue.
message = Aliyun::Mns::Queue["aQueue"].receive_message wait_seconds: 60

#Peek message in the queue
message = Aliyun::Mns::Queue["aQueue"].peek_message

#Delete received message
message = Aliyun::Mns::Queue["aQueue"].receive_message
message.delete

#Change message visibility
message = Aliyun::Mns::Queue["aQueue"].receive_message
message.change_visibility 10

```


## Contributing

1. Fork it ( https://github.com/mgampkay/aliyun-mns/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request