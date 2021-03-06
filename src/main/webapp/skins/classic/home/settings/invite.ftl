<#include "macro-settings.ftl">
<@home "invite">
<div class="module">
    <div class="module-header">
        <h2>${inviteTipLabel}</h2>
    </div>
    <div class="module-panel form">
        <br/>
        <input readonly="readonly" type="text" value="${serverScheme}://${serverHost}/register?r=${currentUser.userName}" onclick="this.select()"/>
        <button class="red btn" id="shareClipboard"
                data-clipboard-text="${serverScheme}://${serverHost}/register?r=${currentUser.userName}">${copyLabel}</button>
    </div>
</div>
<#if "2" == allowRegister>
<div class="module">
    <div class="module-header">
        <h2>${buyInvitecodeLabel}</h2>
    </div>
    <div class="module-panel form">
        <div id="pointBuyInvitecodeTip" class="tip"></div> <br/>
        <div class="fn-clear">
            <button class="red fn-right" onclick="Settings.pointBuyInvitecode('${csrfToken}')">${confirmExchangeLabel}</button>
        </div>
        <div class="list content-reset">
            <ul>
                <#list invitecodes as invitecode>
                <li><code>${invitecode.code}</code> ${invitecode.memo}</li>
                </#list>
            </ul>
        </div>
    </div>
</div>
<div class="module">
    <div class="module-header">
        <h2>${queryInvitecodeStateLabel}</h2> 
    </div>
    <div class="module-panel form fn-clear">
        <br/>
        <input id="invitecode" type="text" placeholder="${inputInvitecodeLabel}"/><br/><br/>
        <div class="tip" id="invitecodeStateTip"></div><br/>
        <button class="green fn-right" onclick="Settings.queryInvitecode('${csrfToken}')">${submitLabel}</button>
    </div>
</div>
</#if>
</@home>
<script type="text/javascript" src="${staticServePath}/js/lib/zeroclipboard/ZeroClipboard.min.js"></script>
<script>
            ZeroClipboard.config({
                hoverClass: "red-hover",
                swfPath: Label.staticServePath + "/js/lib/zeroclipboard/ZeroClipboard.swf"
            });

            var shareClipboard = new ZeroClipboard(document.getElementById("shareClipboard"));
            shareClipboard.on("ready", function (readyEvent) {
                shareClipboard.on("aftercopy", function (event) {
                    $("#shareClipboard").text('${copiedLabel}');
                    setTimeout(function () {
                        $("#shareClipboard").text('${copyLabel}');
                    }, 2000);
                });
            });
</script>`