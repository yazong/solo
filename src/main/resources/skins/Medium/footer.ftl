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
<div class="wrapper">
    <footer class="footer">
        <div class="fn-clear">
        ${blogSubtitle}
            <#include "../../common-template/macro-user_site.ftl"/>
            <@userSite dir="n"/>
            <div class="fn-right">
                &copy; ${year}
                <a href="${servePath}">${blogTitle}</a>
                ${footerContent}
            </div>
        </div>
        <div class="fn-clear">
        ${statistic.statisticPublishedBlogArticleCount} ${articleLabel} &nbsp;
        <#if commentable>${statistic.statisticPublishedBlogCommentCount} ${commentLabel} &nbsp;</#if>
        <span data-uvstaturl="${servePath}">0</span> ${viewLabel} &nbsp;
        ${onlineVisitorCnt} ${onlineVisitorLabel}
            <div class="fn-right">
                Powered by <a href="https://solo.b3log.org" target="_blank">Solo</a> •
                Theme ${skinDirName} by <a href="http://vanessa.b3log.org" target="_blank">Vanessa</a>
            </div>
        </div>
    </footer>
</div>

<script type="text/javascript" src="${staticServePath}/js/lib/compress/pjax.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}"
        charset="utf-8"></script>
<script type="text/javascript"
        src="${staticServePath}/skins/${skinDirName}/js/common${miniPostfix}.js?${staticResourceVersion}"
        charset="utf-8"></script>
<#include "../../common-template/label.ftl">
${plugins}
