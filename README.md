[WIP] - RailsAdmin Rollincode Theme
--------------------

This theme provide a modern override of default bootstrap 3 rails_admin theme.
Its provides news colors, adjustments and a brand new tree view menu.

![DASHBOARD](http://i.imgur.com/SL33qRC.jpg, "rollincode")

![DASHBOARD](http://i.imgur.com/78BseNp.png, "rollincode")

![DASHBOARD](http://i.imgur.com/ShGFOg6.png, "rollincode")

You can fork it and change `variables.scss` as you want !

Gemfile

```
gem 'wysiwyg-rails'
gem 'icheck-rails'
gem 'rails_admin_rollincode', git: 'https://github.com/rollincode/rails_admin_theme'
gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git', branch: 'master'
```

Inside `config/application.rb`, just after `Bundler.require`
```
ENV['RAILS_ADMIN_THEME'] = 'rollincode'
```

You'll have to run theses commands

`rake assets:clean` and `rake assets:precompile`

May be you should run `rm -rf tmp/cache/assets/development/`, for changes to take effect.

Like we can't include custom js in a bundled theme with raild_admin for now, so, you have to add in your `app/assets/javascripts/rails_admin/custom/ui.js` the following code :
It will make the javascript menu works.

````
//= require icheck

$(document).on('ready pjax:success', function() {
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-grey selectable',
    radioClass: 'iradio_flat-grey'
  });

  var checkBox = $('.table-striped > tbody > tr > td:first-child input[type="checkbox"]');
  var togglerCheck = $('th.shrink input[type="checkbox"]');

  checkBox.on('ifChecked', function(e) {
    $(this).parent().parent().parent().addClass('row-highlight');
  });
  checkBox.on('ifUnchecked', function(e) {
    $(this).parent().parent().parent().removeClass('row-highlight');
  });

  togglerCheck.on('ifChecked', function(e) {
    checkBox.iCheck('check');
    handleHighlight();
  });
  togglerCheck.on('ifUnchecked', function(e) {
    checkBox.iCheck('uncheck');
    $('.table-striped tbody tr').removeClass('row-highlight');
  });
  function handleHighlight() {
    $('.table-striped tbody td').has('div.checked').each(function(index, item) {
      $(item).parent().addClass('row-highlight');
    });
  }

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
