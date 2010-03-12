cls
call git add .
call git commit -m %*
call git push origin master
call git push heroku master