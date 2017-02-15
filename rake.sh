
#!/bin/bash

# bash application to maintain your jekyll website

# Create new_post 
function new_post()
{
	imagedir="public/images"
	postdir="_posts"

	echo "Enter title of the post: "; 
	read title;
	origTitle=$title;
	title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^0-9a-z\-]/ /g' | sed -e 's/  */ /g' | sed -e 's/ $//g' |  tr " " -);
	

	echo "Enter type of the post(ref|blog): "
	read typepost;
	
	echo "Enter tags to classify your post (comma separated): "
	read tags; 
	
	echo "Enter Category to which your post belong (comma separated): "
	read categories; 
	
	postdate=$(date +%Y-%m-%d);

	echo $postdate
	echo "Enter banner image: "
	read banner_image;
	if [ ! -z $banner_image ];
		then 
			banner_image=$(echo $imagedir/$banner_image)
			echo "Enter banner image alt: "
			read banner_image_alt;
	fi
	
	# check whether post exists or not 
	filename="$postdate-$title.md"
	if [ -f "$postdir/$filename" ];
	then
   		echo "File $postdir/$filename exists."
		return;
	fi

	echo "Creating new post: $postdir/$filename"

	echo "---" >> "$postdir/$filename"
    echo "layout: post" >> "$postdir/$filename"
    echo "title: $origTitle" >> "$postdir/$filename"
    echo "type: $typepost" >> "$postdir/$filename"
    echo "tags: [$tags]" >> "$postdir/$filename"
    echo "categories: [$categories]" >> "$postdir/$filename"

    if [ ! -z $banner_image ];
		then 
			echo "banner_image: $banner_image" >> "$postdir/$filename"
    		echo "banner_image_alt: $banner_image_alt" >> "$postdir/$filename"
	fi
    echo "---" >> "$postdir/$filename"; 
}

# Create new_page
function new_page()
{
	imagedir="public/images"
	pagedir="blog"

	echo "Enter title of the page: "; 
	read title;
	origTitle=$title;
	title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^0-9a-z\-]/ /g' | sed -e 's/  */ /g' | sed -e 's/ $//g' |  tr " " -);
	
	echo "Enter banner image: "
	read banner_image;
	if [ ! -z $banner_image ];
		then 
			banner_image=$(echo $imagedir/$banner_image)
			echo "Enter banner image alt: "
			read banner_image_alt;
	fi
	
	# check whether post exists or not 
	filename="$title.md"
	if [ -f "$filename" ];
	then
   		echo "File $filename exists."
		return;
	fi

	echo "Creating new page: $filename"

	echo "---" >> "$pagedir/$filename"
    echo "layout: page" >> "$pagedir/$filename"
    echo "title: $origTitle" >> "$pagedir/$filename"
    
    if [ ! -z $banner_image ];
		then 
			echo "banner_image: $banner_image" >> "$pagedir/$filename"
    		echo "banner_image_alt: $banner_image_alt" >> "$pagedir/$filename"
    	else
    		echo "banner_image: " >> "$pagedir/$filename"
    		echo "banner_image_alt: " >> "$pagedir/$filename"	
	fi
    echo "---" >> "$pagedir/$filename"; 
}

function  preview()
{
	bundle exec jekyll serve --host 0.0.0.0 --watch;
}

function check()
{
	bundle exec jekyll doctor;
}

function init()
{
	bundle install 
}

function downloadResources()
{
	cd $RARCHK_HOME_DIR/public/js
	rm MathJax.js
	curl https://cdn.mathjax.org/mathjax/latest/MathJax.js > MathJax.js
	mkdir -p config 
	curl https://cdn.mathjax.org/mathjax/latest/config/TeX-AMS_SVG.js > config/TeX-AMS_SVG.js
	mkdir -p extensions
	curl https://cdn.mathjax.org/mathjax/latest/extensions/MathMenu.js > extensions/MathMenu.js 
	curl https://cdn.mathjax.org/mathjax/latest/extensions/MathZoom.js > extensions/MathZoom.js
	rm analytics.js
	wget https://google-analytics.com/analytics.js
	rm count.js 
	wget https://rarchkgithubio.disqus.com/count.js

	cd $RARCHK_HOME_DIR/public/css
	rm font-awesome.min.css 
	wget https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css

	cd $RARCHK_HOME_DIR/fonts
	rm *
	wget https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/fonts/fontawesome-webfont.ttf
	wget https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/fonts/fontawesome-webfont.woff
	wget https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/fonts/fontawesome-webfont.woff2

	cd $RARCHK_HOME_DIR 
}
function projects()
{
	curl -i https://api.github.com/repos/$1 > repo.data
	STARS=$(cat repo.data | grep stargazers_count | cut -d " " -f4 | cut -d "," -f1)
	REPONAME=$(echo $1 | cut -d "/" -f2)
	REPOURL=$1
	echo "Enter description for Repository:"; 
	read REPODESC;
	
	echo $STARS 
	echo "${REPONAME^}"
	echo $REPOURL 
	echo $REPODESC
	
	div1='''| <a href="https://github.com/'''; 
	div2='''"> <font size="4"> '''
    div3=''' </font></a>| ''';
    div4=''' | <font size="3"> '''
    div5=''' </font> |'''
   
  
	echo $div1$REPOURL $div2 ${REPONAME^} $div3 $STARS $div4 $REPODESC $div5;	
	#echo $REPODESC $div
	rm repo.data 
}

echo ''' rake: Usage
	init:		Install prerequisties
	new_post:	Create new_post
	new_page:	Create new_page
	preview:	Previewing site with jekyll
	check:		Search site and print specific deprecation warnings
	projects:	Build projects post
	downloadResources: Download prerequisite resources  
'''

export RARCHK_HOME_DIR=$PWD 