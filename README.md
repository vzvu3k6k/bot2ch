# Bot2ch
[![Build Status](https://travis-ci.org/Manbo-/bot2ch.png)](https://travis-ci.org/Manbo-/bot2ch)

## Usage

    football = Bot2ch::Menu.get_board("football")
    thread = football.threads.find{ |thread| thread.title =~ /nanika/ }
    puts thread.title
    thread.posts.each do |post|
      puts post.plain # or post.block
      post.replies.each do |reply|
        puts "\t#{reply.plain}"
      end
    end

    Bot2ch.enable_downloader
    thread.images.each_with_index{ |image, idx| image.download("#{idx}.jpg") }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
