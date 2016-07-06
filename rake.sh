#!/bin/bash

# bash application to maintain your jekyll website

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
	
	echo "Enter manual date: "
	read postdate;
	
	postdate=$(date +%Y-%m-%d);
	if [ $postdate == "" ];
		then
			postdate= `date +%Y-%m-%d`;
	fi
	
	echo "Enter banner image: "
	read banner_image;
	if [ $banner_image != "" ];
		then 
			banner_image=$(echo $imagedir/$banner_image)
			echo "Enter banner image alt: "
			read banner_image_alt;
	fi
	
	# check whether post exists or not 
	filename="$postdate-$title.md"
	if [ -f "$postdir/$filename" ];
	then
   		echo "File $filename exists."
		exit;
	fi

	echo "Creating new post: $postdir/$filename"

	echo "---" >> $postdir/$filename
    echo "layout: post" >> $postdir/$filename
    echo "title: \"$origTitle\"" >> $postdir/$filename
    echo "type: $typepost" >> $postdir/$filename
    echo "tags: [$tags]" >> $postdir/$filename
    echo "categories: [$categories]" >> $postdir/$filename

    if [ $banner_image != "" ];
		then 
			echo "banner_image: $banner_image" >> $postdir/$filename
    		echo "banner_image_alt: $banner_image_alt" >> $postdir/$filename
	fi
    echo "---" >> $postdir/$filename




}

function new_page()
{
	echo "Usage: ./rake.sh new_page()"
}    