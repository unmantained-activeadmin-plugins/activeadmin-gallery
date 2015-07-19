# Active Admin Gallery

### :warning: Unmaintained :warning:

Sorry, but I no longer work on ActiveAdmin often enough to justify mantaining this gem. Take it as it is. If you are interested to update and maintain the gem, please let me know! :heart:

## Description

With activeadmin-gallery, you are able to DRY up your models and freely associate images and galleries to your models.
This version is compatible with ActiveAdmin 1.0.x and Rails 4.1.5, for the old 0.6.x release see [0-6-stable branch](//github.com/stefanoverna/activeadmin-gallery/tree/0-6-stable).


## Installation

Add `activeadmin-gallery` to your Gemfile:

```ruby
   gem 'activeadmin-gallery', github: 'stefanoverna/activeadmin-gallery'
```

Run the generator that will create the images table, and migrate.

```
> rake activeadmin_gallery:install:migrations
> rake db:migrate
```

## Gallery usage

Suppose you want a Page model with an image gallery. In `app/models/page.rb`:

```ruby
class Page < ActiveRecord::Base
  has_many_images :album_images
end
```

In `app/controllers/pages_controller.rb`:

```ruby
class PagesController < ApplicationController
  private
  def page_params
    params.require(:page).permit(:title, :content, album_images_attributes: [
                                  :alt,
                                  :title,
                                  :position,
                                  :image,
                                  :id,
                                  :_destroy,
                                  :retained_image ])
  end
end
```

No migrations, no models. That's all you need.

In your ActiveAdmin config file:

```ruby
ActiveAdmin.register Page do

  permit_params :title, :content, album_images_attributes: [
                :alt,
                :title,
                :position,
                :image,
                :id,
                :_destroy,
                :retained_image]  

  form do |f|
    # ...
    f.inputs :gallery do
      f.has_many_images :album_images
    end
    # ...
  end

end
```

## Single image usage

For use with Rails 4.1.5 adapt **Gallery usage** instructions.

Suppose you want a Page model with a single image. Edit `app/models/page.rb`

```ruby
class Page < ActiveRecord::Base
  has_image :featured_image
end

No migrations, no models. That's all you need.
In your ActiveAdmin config file:

```ruby
ActiveAdmin.register Page do

  form do |f|
    # ...
    f.inputs :image do
      f.has_image :featured_image
    end
    # ...
  end

end
```

## Copyright

Copyright (c) 2012 Stefano Verna, Cantiere Creativo
See the file LICENSE.txt for details.
