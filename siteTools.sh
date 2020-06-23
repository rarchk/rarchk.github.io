
#!/bin/bash

# bash application to maintain your jekyll website

function new_post()
{
	create_post "_posts"
}

function draft_post()
{
	create_post "_drafts"
}

function create_post()
{
	imagedir="public/images"
	postdir=$1

	echo "Enter title of the post: "; 
	read title;
	origTitle=$title;
	title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^0-9a-z\-]/ /g' | sed -e 's/  */ /g' | sed -e 's/ $//g' |  tr " " -);
	

	echo "Enter type of the post(ref|blog): "
	read typepost;
	
	site_meta_info

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

function  site_preview()
{
	bundle exec jekyll serve --host 0.0.0.0 --drafts --incremental --watch;
}

function check()
{
	bundle exec jekyll doctor;
}

function init()
{
	bundle install 
}

function tikzconvert()
{
	FileName=$(echo $1 | cut -d '.' -f1 | rev | cut -d '/' -f1 | rev);
	 
	convert -density 300 $1 -quality 90 $FileName.png 
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

function site_meta_info()
{
	tput setaf 2
	echo "Site Wide Tags"
	echo "=============="
	tput setaf 5 
	cat _posts/* | grep tags | cut -d '[' -f2 | cut -d ']' -f1 | sed -e "s/,/\n/g"\
	| sort | uniq | awk '{print}' ORS=', ' | sed -e "s/$/\n\n/g" | fold -w 70 -s
	tput setaf 2
	echo "Site Wide Categories"
	echo "===================="
	tput setaf 5 
	cat _posts/* | grep categories | cut -d '[' -f2 | cut -d ']' -f1 | sed -e "s/,/\n/g"\
	| sort | uniq | awk '{print}' ORS=', ' | sed -e "s/$/\n\n/g" | fold -w 70 -s
	tput setaf 9
}

echo ''' siteTools: Usage
	init:			Install jekyll prerequisties
	new_post:		Create new_post
	draft_post:		Create draft_post
	new_page:		Create new_page
	site_preview:		Previewing site with jekyll
	check:			Search site and print specific deprecation warnings
	projects:		Build projects post
	tikzconvert:		Convert tikz pdf files to png   
'''

export RARCHK_HOME_DIR=$PWD 
