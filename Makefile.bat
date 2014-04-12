@set PELICAN=pelican
@set PELICANOPTS=

@set BASEDIR=C:\Users\liuynjn\Documents\GitHub\yanjun-liu.github.io
@set INPUTDIR=%BASEDIR%/content
@set OUTPUTDIR=%BASEDIR%
@set CONFFILE=%BASEDIR%/pelicanconf.py
@set PUBLISHCONF=%BASEDIR%/publishconf.py

@set SSH_HOST=bounce
@set SSH_PORT=22
@set SSH_USER=tbunnyman
@set SSH_TARGET_DIR=/srv/vegasfur/www/

%PELICAN% %INPUTDIR% -o %OUTPUTDIR% -s %PUBLISHCONF% %PELICANOPTS%