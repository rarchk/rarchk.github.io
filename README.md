# rarchk.github.io

This is my personal website built with Jekyll, where I share thoughts, experiments, and other literary works.

## Prerequisites

- Ruby version 3.2.2 or higher
- RubyGems
- GCC and Make (for building native extensions)

## Setup

1. Install Ruby (if not already installed):
   ```bash
    # Install rbenv and ruby-build
    brew install rbenv ruby-build

    # Add rbenv to bash/zsh
    echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc  # For zsh
    source ~/.zshrc
   
    # Using rbenv (recommended)
    rbenv install 3.2.2
    rbenv global 3.2.2
   
    # Or using asdf
    asdf install ruby 3.2.2
    asdf global ruby 3.2.2
   ```

2. Install Jekyll and dependencies:
   ```bash
   # Install bundler
   gem install bundler
   
   # Install dependencies
   bundle install
   ```

3. Run the development server:
   ```bash
   bundle exec jekyll serve --livereload
   ```

   The site will be available at http://localhost:4000

## Usage 

The site includes several helpful scripts in `siteTools.sh`:

```bash
source siteTools.sh 
new_post   # Creates a new blog post with proper frontmatter
new_page   # Creates a new page with proper layout
```

## Directory Structure

- `_posts/` - Blog posts (format: YYYY-MM-DD-title.md)
- `_drafts/` - Unpublished posts
- `_layouts/` - Page templates
- `_includes/` - Reusable components
- `_scss/` - Sass stylesheets
- `public/` - Static assets
- `blog/` - Blog-related pages and archives

## Configuration

- Site settings are in `_config.yml`
- Style configurations are in `_config.scss`
- The theme supports:
  1. Customizable theme colors
  2. Changeable sidebar locations
  3. Integration with FontAwesome, MathJax, Disqus, and Google Analytics
  4. Numerous improvements over the original Lanyon theme

## Writing Posts

Create new posts in the `_posts` directory following the naming convention `YYYY-MM-DD-title.md`. Each post needs frontmatter:

```yaml
---
layout: post
title: Your Post Title
date: YYYY-MM-DD HH:MM:SS
categories: [category1, category2]
tags: [tag1, tag2]
---
```

## Theme

This site uses a customized version of the [Lanyon](https://github.com/poole/lanyon) Jekyll theme, which is based on [Poole](http://getpoole.com).

## License

Open sourced under the [MIT license](LICENSE.md).

