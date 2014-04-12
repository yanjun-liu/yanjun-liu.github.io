#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = u"yanjun"
SITENAME = u"Yanjun Liu's Homepage"
SITEURL = ''

TIMEZONE = 'CET'

DEFAULT_LANG = 'en'

THEME = 'theme/notmymod'

# Blogroll
#LINKS = (
#        ('SuperOffice AS', 'http://www.superoffice.no/')
#    )

# Social widget
#SOCIAL = (('LinkedIn','http://no.linkedin.com/pub/yanjun-liu/60/713/507') )

DEFAULT_PAGINATION = 5

# Put pages in root
PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = '{slug}.html'
PAGE_LANG_URL = '{slug}-{lang}.html'
PAGE_LANG_SAVE_AS = '{slug}-{lang}.html'

# And sort my articles
ARTICLE_URL = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
