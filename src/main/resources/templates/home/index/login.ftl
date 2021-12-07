<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>欢迎登录${siteName!""}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link href="/home/css/login2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/home/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/home/js/login.js"></script>
    <script type="text/javascript" src="/home/js/jquery.cookie.js"></script>
</head>
<body style="padding-top: 100px">
    <div id="box">
        <h1 style="color: rgb(5,39,175)">${siteName!""}<sup>2021</sup></h1>

        <div class="login" style="margin-top:50px;">

            <div class="header">
                <div class="switch" id="switch">
                    <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">登录</a>
                    <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">注册</a>
                    <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;">
                    </div>
                </div>
            </div>


            <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">

                <!--登录-->
                <div class="web_login" id="web_login">
                    <div class="login-box">
                        <div class="login_form">
                            <div id="loginCue" class="cue">欢迎登陆</div>

                            <form action="login" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm ui large form" method="post">
                                <div class="field">
                                    <div class="ui left icon input">
                                        <i class="address card icon"></i>
                                        <input type="text" id="login-sn" name="sn" placeholder="学号" maxlength="13">
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="ui left icon input">
                                        <i class="lock icon"></i>
                                        <input type="password" name="password" placeholder="密码" id="pwd" maxlength="16">
                                    </div>
                                </div>
                                <input type="button" id="login_button" class="ui fluid large teal submit button"  value="登 录" href="javascript::"/>

                            </form>
                        </div>

                    </div>

                </div>
                <!--登录end-->
            </div>

          <!--注册-->
            <div class="qlogin" id="qlogin" style="display: none; ">

            <div class="web_login">
                    <form name="form2" id="regForm" accept-charset="utf-8"  action="register" method="post" class="ui large form">
                        <ul class="reg_form" id="reg-ul">
                            <div id="userCue" class="cue">快速注册请注意格式</div>
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="address card icon"></i>
                                    <input type="text" id="user-sn" name="sn" placeholder="学号" maxlength="13">
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="lock icon"></i>
                                    <input type="password" name="password" placeholder="密码" id="password" maxlength="16">
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="lock icon"></i>
                                    <input type="password" name="password2" placeholder="请重新输入密码" id="password2" maxlength="16">
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui left icon input">
                                    <i class="qq icon"></i>
                                    <input type="text" name="qq" id="qq" placeholder="qq" maxlength="10">
                                </div>
                            </div>
                            <input type="button" id="reg_button"   class="ui fluid large teal submit button"  value="注 册"/>
                            <div class="cl"></div>
                        </ul>
                    </form>
                    <#--<div id="userCue" class="cue">快速注册请注意格式</div>-->
                    <#--<div class="ui segment">-->
                        <#--<div class="field">-->
                            <#--<div class="ui left icon input">-->
                                <#--<i class="user icon"></i>-->
                                <#--<input type="text" id="sn" name="sn" placeholder="学号">-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="field">-->
                            <#--<div class="ui left icon input">-->
                                <#--<i class="user icon"></i>-->
                                <#--<input type="text" id="nikename" name="nikename" placeholder="用户名">-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="field">-->
                            <#--<div class="ui left icon input">-->
                                <#--<i class="lock icon"></i>-->
                                <#--<input type="password" name="password" placeholder="密码" id="password">-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="field">-->
                            <#--<div class="ui left icon input">-->
                                <#--<i class="lock icon"></i>-->
                                <#--<input type="password" name="password2" placeholder="请重新输入密码" id="password2">-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="field">-->
                            <#--<div class="ui left icon input">-->
                                <#--<i class="mail icon"></i>-->
                                <#--<input type="text" name="email" id="email" placeholder="邮箱">-->
                                <#--<input type="button" id="getcode" class="ui grey label" value="获取验证码">-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="code field" style="display:none">-->
                            <#--<div class="ui left icon input">-->
                                <#--<i class="check square outline icon"></i>-->
                                <#--<input type="text" name="identify" id="identify" placeholder="验证码">-->
                            <#--</div>-->
                        <#--</div>-->

                    <#--</div>-->
                    <#--<input type="button" id="reg_button" style="margin-top:10px;margin-left:85px;" class="ui fluid large teal submit button" value="注册"/>-->
                    <#--&lt;#&ndash;<div id="isRepeat"></div>&ndash;&gt;-->
                    <#--&lt;#&ndash;<div class="ui error mini message"></div>&ndash;&gt;-->


            </div>


            </div>
            <!--注册end-->
        </div>
        <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
    </div>

</body>
</html>