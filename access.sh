#!/bin/bash

url='http://54.223.222.47'
news[0]='/news/index/3'
news[1]='/news/index/1'
news[2]='placeholder'

function access_news {
    selectedIndex=$[RANDOM % ${#news[@]}]
    echo '=== access news, selected index, '$selectedIndex
    arraySize=${#news[@]}
    if [ $selectedIndex -eq $[$arraySize-1] ]; then
        newsId=$[RANDOM % 11900]
        echo '==== choose single news to view, id: '$newsId        
        curl -sL -w "%{http_code} %{url_effective}\\n" $url'/news/view/'$newsId -o /dev/null
    else
        echo '=== view chinese or japanese news home page'
        selectedItem=${news[$selectedIndex]}
        curl -sL -w "%{http_code} %{url_effective}\\n" $url$selectedItem -o /dev/null
    fi

}

articles[0]='/articles/index'
articles[1]='placeholder'

function access_articles {
    selectedIndex=$[RANDOM % ${#articles[@]}]
    echo '=== access articles, selectedIndex: '$selectedIndex
    arraySize=${#articles[@]}
    if [ $selectedIndex -eq $[$arraySize-1] ]; then
        articleId=$[10000000 + $[RANDOM % 8500]]
        echo '=== choose single article to view, id: '$articleId        
        curl -sL -w "%{http_code} %{url_effective}\\n" $url'/articles/view/'$articleId -o /dev/null
    else
        selectedItem=${articles[$selectedIndex]}
        curl -sL -w "%{http_code} %{url_effective}\\n" $url$selectedItem -o /dev/null
    fi
}

tags[0]='/tags/index'


access_news
access_articles

# while true;
# do
#     access_news;
#     sleep 20;
# done;


