RailsAdmin Rollincode Theme
--------------------

[![Gem Version](https://badge.fury.io/rb/rails_admin_rollincode.svg)](https://badge.fury.io/rb/rails_admin_rollincode)

A modern override of default bootstrap 3 rails_admin theme.
It provides news colors, adjustments and a brand new tree view menu.

![DASHBOARD](http://i.imgur.com/SL33qRC.jpg, "rollincode")

![DASHBOARD](http://i.imgur.com/78BseNp.png, "rollincode")

![DASHBOARD](http://i.imgur.com/ShGFOg6.png, "rollincode")

You can fork it and change `variables.scss` as you want !

Gemfile

```ruby
gem 'rails_admin_rollincode', '~> 1.0'
gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git'
```

Inside `config/application.rb`, just after `Bundler.require`

```ruby
ENV['RAILS_ADMIN_THEME'] = 'rollincode'
```

You'll have to run theses commands for changes to take effect

`rake assets:clean && rake assets:precompile`

or

`rm -rf tmp/cache/assets/development/`

Like we can't include custom js in a bundled theme with rails_admin for now, you have to add in your `app/assets/javascripts/rails_admin/custom/ui.js` the following code :
It will make the javascript menu works.

````javascript
$(document).on('ready pjax:success', function() {
  handleActiveBase();
  function handleActiveBase() {
    $('.sub-menu').each(function () {
      if ($(this).hasClass('active')) {
        $(this).parent().prev().addClass('active');
        $(this).parent().prev().addClass('open');
        $(this).parent().slideDown();
      }
    });
  }
});

$(function () {
  var width = $('.nav-stacked').width();
  $('.navbar-header').width(width);

  var array_menu = [];
  var lvl_1 = null;
  var count = 0;

  $('.sidebar-nav li').each(function (index, item) {
    if ($(item).hasClass('dropdown-header')) {
      lvl_1 = count++;
      array_menu[lvl_1] = []
    } else {
      $(item).addClass('sub-menu sub-menu-' + lvl_1);
    }
  });

  for (var i = 0; i <= array_menu.length; i++) {
    $('.sub-menu-' + i).wrapAll("<div class='sub-menu-container' />");
  }

  $('.sub-menu-container').hide();

  handleActiveBase();
  function handleActiveBase() {
    $('.sub-menu').each(function () {
      if ($(this).hasClass('active')) {
        $(this).parent().prev().addClass('active');
        $(this).parent().slideDown();
      }
    });
  }

  $('.dropdown-header').bind('click', function () {
    $('.dropdown-header').removeClass('open');
    $(this).addClass('open');

    $('.dropdown-header').removeClass('active');
    $('.sub-menu-container').stop().slideUp();
    $(this).toggleClass('active');
    $(this).next('.sub-menu-container').stop().slideDown();
  });
});
````

Example: 
https://github.com/rollincode/rollinbox
