---
layout: post
title:  "Color Wheel Project"
date:   2014-10-08 23:58:28
categories: project

---
<script type="text/javascript" src="/resources/processing.min.js"> </script>
<canvas type="application/processing" data-processing-sources="/resources/ColorWheel.pde"> </canvas>

This is my color wheel project for Theater Tech. I wrote it in [Processing](http://www.processing.org) and used [Processing.js](http://processingjs.org/) to embed it in the markdown.

To generate all the colors of the color wheel, I found RGB values for each color:

<pre style="overflow-x: auto;"><code data-language="java">
int[][] col = { {255,0,0}, //red
    		{255,69,0},//red orange
		{255,102,0},//orange
    		{255,174,66},//yellow orange
    		{255,255,0},//yellow
    		{173,255,47},//yellow green
		{0,255,0},//green
                {13,152,186},//blue green
                {0,0,255},//blue
                {111,0,255},//blue purple
                {143,0,255},//purple
                {199,21,133}//red purple
              };
</code></pre>

To play, move your mouse around the screen and click when you think the color of the background is the most common ball color.
