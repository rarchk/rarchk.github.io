---
layout: page
title: Reflections
banner_image: 
banner_image_alt: 
---

<article class="post">
{% for post in site.posts %}
    {% capture this_month %}{{ post.date | date: "%Y" }}{% endcapture %}
    {% capture next_month %}{{ post.previous.date | date: "%Y" }}{% endcapture %}

    {% if post.type contains "ref" %}
      <div class="container">
      <div class="left_side"><font size="4"> <span><a href="{{ BASE_PATH }}{{ post.url }}" style="text-decoration: none;">{{ post.title }}</a></span> </font></div><div class="right_side"> <span  style="float: right;"><u style=" border-bottom: 1px dashed #999; text-decoration:none" ><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %d, %y" }}</time></u></span> </div>
      </div>   
      
    {% endif %}
 
{% endfor %}
</article>


{% if paginator.total_pages > 1 %}
<div class="pagination">

  {% if paginator.next_page %}
      <a class="pagination-item older btn" href="{{ paginator.next_page_path | prepend: site.baseurl | append: '/' | replace: '//', '/' }}">Older</a>
  {% else %}
    <span class="pagination-item older btn-disabled">Older</span>
  {% endif %}

  {% if paginator.previous_page %}
    <a class="pagination-item newer btn " href="{{ paginator.previous_page_path | prepend: site.baseurl | append: '/' | replace: '//', '/' }}">Newer</a>
  {% else %}
    <span class="pagination-item newer btn-disabled">Newer</span>
  {% endif %}

</div>
{% endif %}

<script type="application/ld+json">
{
    "@context": "http://schema.org",
    "@type": "WebSite",
    "url": "{{ '' | prepend: site.baseurl | prepend: site.url | append: '/' }}"
    }
}
</script>
