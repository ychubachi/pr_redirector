PR Redirector
-------------

This program has three functions as followed.

- Redirect to our langing page.

- When http://pr.aiit.ac.jp/ is requested,

# read a prospective customer id from its cookie if available.
# Recode its refferer in the log.
# create a new prospective customer id if neccessary.
# Send a new pci in the cookie.

??? redirect to http://aiit.ac.jp/lp/

- http://pr.aiit.ac.jp/1

# Recode logs and media id (1)
# redirect to http://aiit.ac.jp/lp/

http://pr.aiit.ac.jp/1/twitter

from(media id) = 1
to(url) = 

Table
=====

Media
-----

- id
- code
- category
- title
- start_date
- end_date
- cost
- copies

Target
------

- id
- title
- url

Redirect
--------

- id
- medium_id
- target_id
