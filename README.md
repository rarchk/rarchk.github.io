# rarchk.github.io

This is my personal website, where I share my thoughts, experiments and other literary works. It has been fun designing this website bit by bit.

Still not used to many frontend stuff,  

## Installation & Setup

1. Install Ruby using rbenv (recommended)
```bash
# Install rbenv and ruby-build
brew install rbenv ruby-build

# Add rbenv to bash/zsh
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc  # For zsh
source ~/.zshrc

# Install Ruby 3.2.2
rbenv install 3.2.2
rbenv global 3.2.2

# Install dependencies
gem install bundler
bundle install
```

## Usage 

### Running the Site Locally
```bash
bundle exec jekyll serve --livereload  # Start server with live reload
```

### Creating New Content
```bash
source site_tools.sh 
new_post  # Creates a new post 
new_page  # Creates a new page 
```

### Development Requirements
- Ruby 3.2.2 or higher
- Bundler 2.x
- Jekyll 3.9.3 (via github-pages gem)
## Acknowledgements 
This is a jekyll template based on [Lanyon](https://github.com/poole/lanyon). 

*Lanyon is an unassuming [Jekyll](http://jekyllrb.com) theme that places content first by tucking away navigation in a hidden drawer. It's based on [Poole](http://getpoole.com), the Jekyll butler.*

All the configurations are inside either `_config.yml` or `_config.scss`. The options are fairly straightforward. 

The theme supports: 

1. Theme colors: you can choose your favorite theme color
2. Changable sidebar locations
3. Integration of FontAwesome, MathJax, Disqus and Google Analytics
4. and numerous improvements over original Lanyon

## License
Open sourced under the [MIT license](LICENSE.md).

