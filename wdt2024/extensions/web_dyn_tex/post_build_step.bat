@echo off
if not "%YYEXTOPT_web_dyn_tex_enable_post_build%"=="True" (
	echo [wdt] We've been asked not to do anything. Bye!
	exit /b
)
%YYEXTOPT_web_dyn_tex_neko% "%~dp0post_build_step.n"