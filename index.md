---

# Feel free to add content and custom Front Matter to this file.

# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---
<link rel="stylesheet" href="/assets/css/index.css"/>

<header>
    <section class="wrapper">
        <h1 class="post-title">That American Life</h1>
    </section>
</header>

<section class="flag-bg"></section>

<section id="content" class="wrapper">

<article>
<p>
The greatest podcast of all time? The greatest radio show of all time? This American Life might be both, and this site 
is a love letter to a show I've listened to obsessively since I first encountered it.
</p>
<p>
That American Life scrapes transcripts from <a href="https://www.thisamericanlife.com">thisamericanlife.com</a>, parses them, 
aggregates the data, and presents it here for you to gawk at. 
</p>
<p>
As the site evolves and my data set grows I'm hoping to offer visualizations and analyses of trends in the podcast over 
time. For now, and until then, you are welcome to the questionable fruits of my labor.
</p>
</article>

{%- assign contributorCount = site.data.contributorList | size -%}
{% if contributorCount > 0 %}
<article>
<h2>Contributors</h2>
<p>
<ul class="contributorList">
    {%- assign contributorNames = "" | split: ',' -%}
    {% for contributor in site.data.contributorList %}
        {%- assign contributorNames = contributorNames | push: contributor["name"] -%}
    {% endfor %}
    
    {%- assign sortedContributorNames = contributorNames | sort -%}
    {% for contributorName in sortedContributorNames %}
        <li><a href="contributors/{{ contributorName | slugify }}">{{ contributorName }}</a></li>
    {% endfor %}
</ul>
</p>
</article>
{% endif %}

{%- assign episodeCount = site.data.episodeList | size -%}
{% if episodeCount > 0 %}
<article>
<h2>Episodes</h2>
<p>
<ul class="episodeList">
{% for ep in site.data.episodeList %}
    <li>
        {{ ep.number }}. <a href="episodes/episode{{ ep.number }}">
            {{ ep.title }}
        </a>
    </li>
{% endfor %}
</ul>
</p>
</article>
{% endif %}

<article>
<h2>About</h2>
<p>
That American Life is powered by <a href="https://www.jekyllrb.com">jekyll</a> and built by <a href="https://www.ian4d.com">ian4d.</a>
</p>
</article>

</section>
