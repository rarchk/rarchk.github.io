
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
	bundle exec jekyll serve --watch;
}

function check()
{
	bundle exec jekyll doctor;
}

function init()
{
	bundle install 
}

function projects()
{
	curl -i https://api.github.com/repos/$1 > repo.data
	STARS=$(cat repo.data | grep stargazers_count | cut -d " " -f4 | cut -d "," -f1)
	REPONAME=$(cat $1 | cut -d "/" -f2)
	REPOURL=$1
	echo "Enter description for Repository:"; 
	read REPODESC;
	
	
	echo '''<div style="width: 600px; margin: 0 auto; padding: 10px; overflow: hidden; border: 5px rgb(158, 93, 94) dotted; border-radius:10px ">
  
  <div style="float: left; width: 70px; height: 80px; padding: 10px "> 
  <a href="https://github.com/'''$REPOURL'''">{% octicon repo height:64 class:"right left" aria-label:hi fill:#ac4142 %}</a> </div>
  
  
  <div style="float:left; width: auto; max-width: 470px; padding: 10px; height: 80px;-webkit-box-sizing: inherit; -moz-box-sizing: inherit; box-sizing: inherit;  color: rgb(205, 90, 90); font-size: 17px; font-weight: inherit; font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif; font-style: oblique; text-decoration: inherit; text-align: left;  line-height: 1.1em;   ">
  <strong>'''$REPONAME'''</strong> 
  <p>'''$REPODESC'''</p></div>

  <div clear:both ></div>
</div>'''
	rm repo.data 
}

echo ''' rake: Usage
	init:		Install prerequisties
	new_post:	Create new_post
	new_page:	Create new_page
	preview:	Previewing site with jekyll
	check:		Search site and print specific deprecation warnings
	projects:	Build projects post 
''' 