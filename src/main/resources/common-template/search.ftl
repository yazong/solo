<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-common_head.ftl"/>
<!DOCTYPE html>
<html>
<head>
    <@head title="${searchLabel} - ${blogTitle}${searchLabel}">
        <link type="text/css" rel="stylesheet"
              href="${staticServePath}/scss/start.css?${staticResourceVersion}" charset="utf-8"/>
    </@head>
</head>
<body class="search__body">
<div class="search__header fn-clear">
    <a href="${servePath}"><img width="32" border="0" alt="Solo" title="Solo" src="${faviconURL}"/></a>
    <div class="search__input">
        <input value="${keyword}" id="keyword" type="text" onkeypress="if(event.keyCode===13){document.getElementById('searchBtn').click()}">
        <button id="searchBtn" onclick="window.location.href='${servePath}/search?keyword=' + document.getElementById('keyword').value">搜索</button>
    </div>
    <span class="fn-right">
    <#if isLoggedIn>
        <a href="${servePath}/admin-index.do#main">${adminLabel}</a> &nbsp;
        <a href="${logoutURL}">${logoutLabel}</a>
    <#else>
        <a href="${servePath}/start">${startToUseLabel}</a>
    </#if>
        </span>
</div>

<div class="search">
    <div class="search__articles">
    <#list articles as article>
        <article>
            <header>
                <h1>
                    <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                    ${article.articleTitle}
                    </a>
                </h1>

                <div class="meta">
                    <time>
                    ${article.articleCreateDate?string("yyyy-MM-dd")}
                    </time>
                    &nbsp;
                ${article.articleCommentCount} ${commentLabel}
                    &nbsp;
                    <span data-uvstaturl="${servePath}${article.articlePermalink}">0</span> ${viewLabel}
                </div>
            </header>
            <div class="vditor-reset">
            ${article.articleAbstract}
            </div>
            <footer>
                <#list article.articleTags?split(",") as articleTag>
                    <a class="tag" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                </#list>
            </footer>
        </article>
    </#list>
    </div>


<#if 0 != articles?size>
    <nav class="search__pagination">
        <#if 1 != pagination.paginationPageNums?first>
            <a href="${servePath}/search?keyword=${keyword}&p=${pagination.paginationCurrentPageNum - 1}">&laquo;</a>
            <a href="${servePath}/search?keyword=${keyword}&p=1">1</a> <span class="page-number">...</span>
        </#if>
        <#list pagination.paginationPageNums as paginationPageNum>
            <#if paginationPageNum == pagination.paginationCurrentPageNum>
                <span>${paginationPageNum}</span>
            <#else>
                <a href="${servePath}/search?keyword=${keyword}&p=${paginationPageNum}">${paginationPageNum}</a>
            </#if>
        </#list>
        <#if pagination.paginationPageNums?last != pagination.paginationPageCount>
            <span>...</span>
            <a href="${servePath}/search?keyword=${keyword}&p=${pagination.paginationPageCount}">${pagination.paginationPageCount}</a>
            <a href="${servePath}/search?keyword=${keyword}&p=${pagination.paginationCurrentPageNum + 1}">&raquo;</a>
        </#if>
    </nav>
<#else>
No Result, Return to <a href="${servePath}">Index</a> or <a href="https://hacpai.com">HacPai</a>.
</#if>
</div>

<div class="footerWrapper">
    <div class="footer">
        Powered by <a href="https://b3log.org" target="_blank">B3log 开源</a> • Solo ${version}
    </div>
</div>
<script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<#include 'label.ftl'/>
</body>
</html>
