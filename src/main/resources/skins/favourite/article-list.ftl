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
<#list articles as article>
<div class="article">
    <h2 class="article-title">
        <a rel="bookmark" class="no-underline" href="${servePath}${article.articlePermalink}">
            ${article.articleTitle}
        </a>
        <#if article.articlePutTop>
            <sup>
                ${topArticleLabel}
            </sup>
        </#if>
        <#if article.hasUpdated>
            <sup>
                <a href="${servePath}${article.articlePermalink}">
                    ${updatedLabel}
                </a>
            </sup>
        </#if>
    </h2>
    <div class="posttime-blue">
        <div class="posttime-MY">
            ${article.articleUpdateDate?string("yyyy-MM")}
        </div>
        <div class="posttime-D">
            ${article.articleUpdateDate?string("dd")}
        </div>
    </div>
    <div class="article-abstract">
        <div class="note">
            <div class="corner"></div>
            <div class="substance vditor-reset">
                ${article.articleAbstract}
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="margin25">
        <a rel="nofollow" href="${servePath}${article.articlePermalink}" class="left">
            <span class="left article-browserIcon" title="${viewLabel}"></span>
            <span class="count"><span data-uvstaturl="${servePath}${article.articlePermalink}">0</span></span>
        </a>
        <div class="left">
            <span class="tagsIcon" title="${tagLabel}"></span>
            <#list article.articleTags?split(",") as articleTag>
            <span class="count">
                <a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                    ${articleTag}</a><#if articleTag_has_next>,</#if>
            </span>
            </#list>
        </div>
        <#if commentable>
        <a rel="nofollow" href="${servePath}${article.articlePermalink}#comments" class="left">
            <span class="left articles-commentIcon" title="${commentLabel}"></span>
            <span class="count">${article.articleCommentCount}</span>
        </a>
        </#if>
        <div class="right more">
            <a href="${servePath}${article.articlePermalink}" class="right">
                ${readmoreLabel}
            </a>
        </div>
        <div class="clear"></div>
    </div>
    <div class="footer">
        <div class="clear"></div>
    </div>
</div>
</#list>
<#if 0 != paginationPageCount>
<div class="pagination">
    <#if 1 != paginationPageNums?first>
    <a href="${servePath}${path}">${firstPageLabel}</a>
    <a id="previousPage" href="${servePath}${path}?p=${paginationPreviousPageNum}">${previousPageLabel}</a>
    </#if>
    <#list paginationPageNums as paginationPageNum>
    <#if paginationPageNum == paginationCurrentPageNum>
    <a href="${servePath}${path}?p=${paginationPageNum}" class="selected">${paginationPageNum}</a>
    <#else>
    <a href="${servePath}${path}?p=${paginationPageNum}">${paginationPageNum}</a>
    </#if>
    </#list>
    <#if paginationPageNums?last != paginationPageCount>
    <a id="nextPage" href="${servePath}${path}?p=${paginationNextPageNum}">${nextPagePabel}</a>
    <a href="${servePath}${path}?p=${paginationPageCount}">${lastPageLabel}</a>
    </#if>
    &nbsp;&nbsp;${sumLabel} ${paginationPageCount} ${pageLabel}
</div>
</#if>
