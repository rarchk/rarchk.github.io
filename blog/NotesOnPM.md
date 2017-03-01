---
layout: page
title: Notes On Product Managemnt
banner_image: 
banner_image_alt: Proudct Managemnt 
---
 <article class="post">
{% for post in site.posts %}
    {% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
    {% capture this_month %}{{ post.date | date: "%B" }}{% endcapture %}
    {% capture next_year %}{{ post.previous.date | date: "%Y" }}{% endcapture %}
    {% capture next_month %}{{ post.previous.date | date: "%B" }}{% endcapture %}

    {% if post.type contains "os" %}
      <div class="container">
      <div class="left_side"><font size="4"> <span><a href="{{ BASE_PATH }}{{ post.url }}" style="text-decoration: none;">{{ post.title }}</a></span> </font></div><div class="right_side"> <span  style="float: right;"><u style=" border-bottom: 1px dashed #999; text-decoration:none" ><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %d, %y" }}</time></u></span> </div>
      </div>   
      
    {% endif %}
 

{% endfor %}
</article>



<script type="application/ld+json">
{
    "@context": "http://schema.org",
    "@type": "WebSite",
    "url": "{{ '' | prepend: site.baseurl | prepend: site.url | append: '/' }}"
    }
}
</script>
