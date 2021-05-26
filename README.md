# Solidus Spina

[![CircleCI](https://circleci.com/gh/kbuckler/solidus_spina.svg?style=shield)](https://circleci.com/gh/kbuckler/solidus_spina)
[![codecov](https://codecov.io/gh/solidusio-contrib/solidus_spina/branch/master/graph/badge.svg)](https://codecov.io/gh/solidusio-contrib/solidus_spina)

## Installation

:warning: **Spina depends on PostgresSQL**

Add solidus_spina to your Gemfile:

```ruby
gem 'solidus_spina'
```

Bundle your dependencies and run the installation generator:

```shell
bin/rails generate solidus_spina:install
```

## Usage

This gem integrates the [SpinaCMS](https://github.com/SpinaCMS/Spina) content management system with the [Solidus](https://github.com/solidusio/solidus) e-commerce platform. Included in the project are several Spina parts that you can use in your [Spina view templates](https://www.spinacms.com/guide/themes/view-templates), Solidus view helpers to assist in rendering Spina content, and a custom Spina page that can directly link Spina content to your Solidus product pages.

### Modifying your Spina theme

#### Solidus Products

If you would like to simply reference arbitrary Solidus products from within a Spina page, you'll just need to register a `SolidusSpina::Parts::SolidusProduct` part in your theme. For example:

```ruby
theme.parts = [
  {
    name: 'product',
    title: 'Product',
    part_type: 'SolidusSpina::Parts::SolidusProduct'
  }
]
```

You may of course use a Solidus product part within Spina repeaters. For example, a list of featured products could be represented as follows:

```ruby
theme.parts = [
  {
    name: 'featured_products',
    title: 'Featured Products',
    parts: %w[product],
    part_type: 'Spina::Parts::Repeater'
  },
  {
    name: 'product',
    title: 'Product',
    part_type: 'SolidusSpina::Parts::SolidusProduct'
  }
]
```

#### Spina Product Pages

In addition to referencing arbitrary Solidus products, you may also create complete Spina pages for Solidus products in your store. This allows for deeply structured content related to your Solidus product catalog. This is a one-to-one reference between a product and a structured content page in Spina.

In your Spina theme, this is accomplished by adding a new resource and view template to your theme. By default, your theme file is located at `config/initializers/default/theme.rb`.

The resource:

```ruby
theme.resources = [
  {
    # ...
  },
  {
    name: SolidusSpina::SOLIDUS_RESOURCE_NAME,
    label: 'Solidus Products',
    view_template: 'solidus_product'
  }
]
```

The product view template:

```ruby
theme.view_templates = [
  {
    # ...
  },
  {
    name: 'solidus_product',
    title: 'Solidus Product',
    parts: %w[ additional_text customer_quotes ]
  }
]
```

Of course, you may use any Spina parts that you've registered in your theme.

After adding this to your theme file, you'll need to save your Spina preferences once in the admin panel.

You'll find a "Solidus Products" resource in the Spina admin area. Pages created here will be linked to Solidus products, with the view template defined above. See "Solidus View Helpers" for instructions on referencing these pages in your Solidus views.

#### Solidus Related Products

Furthermore, if you are using Solidus Related Products, this gem includes a `SolidusRelatedProductsRepeater` part which allows you to enumerate a product's related products similarly to a `Spina::Parts::Repeater`.

You'll need to register the following parts in your theme:

- `SolidusSpina::Parts::SolidusRelatedProduct`
- `SolidusSpina::Parts::SolidusRelatedProductsRepeater`

For example:

```ruby
theme.parts = [
  {
    # ...
  },
  {
    name: 'solidus_related_product',
    title: 'Related Product',
    part_type: 'SolidusSpina::Parts::SolidusRelatedProduct'
  },
  {
    name: 'related_products',
    title: 'Related Products',
    parts: %w[solidus_related_product text image],
    part_type: 'SolidusSpina::Parts::SolidusRelatedProductsRepeater'
  }
```

Internally, `SolidusSpina::Parts::SolidusRelatedProduct` references a `Spree::Relation`.

### Solidus View Helpers

todo

## Development

### Testing the extension

First bundle your dependencies, then run `bin/rake`. `bin/rake` will default to building the dummy
app if it does not exist, then it will run specs. The dummy app can be regenerated by using
`bin/rake extension:test_app`.

```shell
bin/rake
```

To run [Rubocop](https://github.com/bbatsov/rubocop) static code analysis run

```shell
bundle exec rubocop
```

When testing your application's integration with this extension you may use its factories.
Simply add this require statement to your `spec/spec_helper.rb`:

```ruby
require 'solidus_spina/testing_support/factories'
```

Or, if you are using `FactoryBot.definition_file_paths`, you can load Solidus core
factories along with this extension's factories using this statement:

```ruby
SolidusDevSupport::TestingSupport::Factories.load_for(SolidusSpina::Engine)
```

### Running the sandbox

To run this extension in a sandboxed Solidus application, you can run `bin/sandbox`. The path for
the sandbox app is `./sandbox` and `bin/rails` will forward any Rails commands to
`sandbox/bin/rails`.

Here's an example:

```
$ bin/rails server
=> Booting Puma
=> Rails 6.0.2.1 application starting in development
* Listening on tcp://127.0.0.1:3000
Use Ctrl-C to stop
```

### Updating the changelog

Before and after releases the changelog should be updated to reflect the up-to-date status of
the project:

```shell
bin/rake changelog
git add CHANGELOG.md
git commit -m "Update the changelog"
```

### Releasing new versions

Please refer to the dedicated [page](https://github.com/solidusio/solidus/wiki/How-to-release-extensions) on Solidus wiki.

## License

Copyright (c) 2021 Kenny Buckler, released under the New BSD License.
