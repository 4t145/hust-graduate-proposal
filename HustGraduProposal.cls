%	---	定义的新的类
\def\HGProp@name{HustGraduProposal}
\def\HGProp@date{2021/06/15}
\def\HGProp@version{v1.0.0}
\def\HGProp@introduction{Hust Graduate Paper Proposal}
\ProvidesClass{\HGProp@name}[\HGProp@date~\HGProp@version~\HGProp@introduction]
\NeedsTeXFormat{LaTeX2e}


%
%	---	定义类的选项
%
\RequirePackage{xstring}%使用条件语句
%字体组
\def\HGProp@fontset{}
\def\HGProp@noto{}
\DeclareOption{autofont}{}%自动设置字体
\DeclareOption{adobefont} {
	\def\HGProp@fontset{,fontset=adobe}
}%使用Adobe 公司的四款中文字体
\DeclareOption{fandolfont} {
	\def\HGProp@fontset{,fontset=fandol}
}%使用Fandol 中文字体
\DeclareOption{founderfont} {
	\def\HGProp@fontset{,fontset=founder}
}%使用方正公司的中文字体
\DeclareOption{macfont} {
	\def\HGProp@fontset{,fontset=mac}
}%使用Mac OS X 系统下的华文字体
\DeclareOption{ubuntufont} {
	\def\HGProp@fontset{,fontset=ubuntu}
}%使用Ubuntu 系统下的文泉驿和文鼎字体
\DeclareOption{winfont} {
	\def\HGProp@fontset{,fontset=windows}
}%使用简体中文Windows 系统下的中文字体
\DeclareOption{winnewfont} {
	\def\HGProp@fontset{,fontset=windowsnew}
}%使用简体中文Windows Vista或之后系统下的中易字体和微软雅黑字体
\DeclareOption{winoldfont} {
	\def\HGProp@fontset{,fontset=windowsold}
}%使用简体中文Windows XP或之前系统下的中易字体
\DeclareOption{notofont} {
	\def\HGProp@noto{
		\setCJKmainfont{NotoSerifCJKsc-Regular.otf}[
			BoldFont = NotoSerifCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKsansfont{NotoSansCJKsc-Regular.otf}[
			BoldFont = NotoSansCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKmonofont{NotoSansMonoCJKsc-Regular.otf}[
			BoldFont = NotoSansMonoCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKfamilyfont{zhsong}{NotoSerifCJKsc-Regular.otf}[
			BoldFont = NotoSerifCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKfamilyfont{zhhei}{NotoSansCJKsc-Regular.otf}[
			BoldFont = NotoSansCJKsc-Bold.otf,
			AutoFakeBold = false
		]
	}
	\def\HGProp@fontset{}
}%使用思源宋体和思源黑体
\DeclareOption{nofont} {
	\def\HGProp@fontset{,fontset=none}
}%不配置中文字体，需要用户自己配置
%页脚样式
\def\HGProp@footlinelength{6.7cm}
\DeclareOption{footline}{\def\HGProp@footlinelength{6.7cm}}%有页脚线
\DeclareOption{nofootline}{\def\HGProp@footlinelength{0cm}}%无页脚线
%引用样式
\def\HGProp@citestyle{normal}
\DeclareOption{normalcite}{\def\HGProp@citestyle{normal}}%使用正文式引用样式
\DeclareOption{supercite}{\def\HGProp@citestyle{super}}%使用上标型引用样式
\def\HGProp@citebst{gbt7714-2005}
\DeclareOption{gbtcite}{\def\HGProp@citebst{gbt7714-2005}}%使用GBT7714-2005样式
\DeclareOption{gbt15cite}{\def\HGProp@citebst{gbt7714-2015}}%使用GBT7714-2015样式
\DeclareOption{tsinghuacite}{\def\HGProp@citebst{thuthesis}}%使用清华样式
\ProcessOptions
\ExecuteOptions{autofont,normalcites,gbtcite}
\relax


%
%	---	载入Class
%
\LoadClass[a4paper]{article}
%页面基本设置
\RequirePackage[AutoFakeBold=true,AutoFakeSlant=true]{xeCJK}[2017/08/08]
\RequirePackage[zihao=-4,UTF8,heading=true\HGProp@fontset]{ctex}[2016/12/27]

%
%	---	定义页边距
%
\RequirePackage{geometry}
\geometry{left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm}
\geometry{headsep=1em,footskip=2em}
\geometry{headheight=14pt}


%
%	---	定义字体
%
%用于设置非常用字体
\setmainfont{Times New Roman}
\RequirePackage{fontspec}
%论文封面使用华文中宋
\setCJKfamilyfont{hwzs}{STZhongsong}
\newcommand{\huawenzhongsong}{\CJKfamily{hwzs}}
\newfontfamily\hwzsAll{STZhongsong}[
	BoldFont={STZhongsong},
	BoldFeatures={FakeBold=4}
]
%思源字体定义与使用
\HGProp@noto

%
%	---	定义页眉页脚
%
%使用fancyhdr库
\RequirePackage{fancyhdr}
%设置页眉样式
\newcommand{\headstyle}{
	\fancyhead[C]{\huawenzhongsong \zihao{5} 华中科技大学本科生毕业设计（论文）开题报告}
}
%设置页脚样式
\newcommand{\footstyle}{\fancyfoot[C]{\huawenzhongsong \zihao{5} \thepage}
	\fancyfoot[L]{\rule[5pt]{\HGProp@footlinelength}{0.4pt}}
	\fancyfoot[R]{\rule[5pt]{\HGProp@footlinelength}{0.4pt}}
}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

%定义一种新的格式叫做main
\fancypagestyle{main}{%
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}

\fancypagestyle{hustheadings}{%
	\fancyhf{} %清空原有样式
	\headstyle
}
%
%	---	定义标题和段落样式
%
%定义1.5倍行距
\renewcommand{\baselinestretch}{1.62}

%设置各个标题样式
%不需要使用part和chapter层级

\ctexset{section={name={,、},format={\raggedright \songti \bfseries \zihao{4}}}} %节
\ctexset{subsection={format={\raggedright \songti \bfseries \zihao{-4}}}} %小节
\ctexset{subsubsection={format={\raggedright \songti \bfseries \zihao{-4}}}} %小小节
\renewcommand\paragraph{\@startsection{paragraph}{-4}{\z@}%
	{0ex \@plus1ex \@minus.2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{-4}{\parindent}%
	{0ex \@plus1ex \@minus .2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}

\RequirePackage[indentafter]{titlesec}
%设置新的标题层级subsubsubsection
\titleclass{\subsubsubsection}{straight}[\subsubsection]
%设置编号
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
%设置标题样式
\titleformat{\subsubsubsection}{\raggedright \heiti \bfseries \zihao{-4}}{\thesubsubsubsection}{1em}{}[]
\titlespacing*{\subsubsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
%设置目录样式
\RequirePackage{tocloft}
%重新设置目录等级，支持hyperref宏包
\RequirePackage{hyperref}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@subparagraph{6}
%参考tocloft，定义\l@subsubsubsection
\newcommand{\l@subsubsubsection}[2]{%
	\ifnum \c@tocdepth > 3 \relax
	\vskip \cftbeforesubsubsubsecskip
	{\leftskip \cftsubsubsubsecindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubsubsubsecindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubsubsubsecnumwidth\relax
		\let\@cftbsnum \cftsubsubsubsecpresnum
		\let\@cftasnum \cftsubsubsubsecaftersnum
		\let\@cftasnumb \cftsubsubsubsecaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubsubsubsecfont #1}\nobreak
		\cftsubsubsubsecfillnum{#2}}%
	\fi}
\newlength{\cftbeforesubsubsubsecskip}
\setlength{\cftbeforesubsubsubsecskip}{\z@ \@plus.2\p@}
\newlength{\cftsubsubsubsecindent}
\newlength{\cftsubsubsubsecnumwidth}
\setlength{\cftsubsubsubsecindent}{7em}
\setlength{\cftsubsubsubsecnumwidth}{4em}
\newcommand{\cftsubsubsubsecfont}{\normalfont}
\newcommand{\cftsubsubsubsecpresnum}{}
\newcommand{\cftsubsubsubsecaftersnum}{}
\newcommand{\cftsubsubsubsecaftersnumb}{}
\newcommand{\cftsubsubsubsecleader}{\normalfont\cftdotfill{\cftsubsubsubsecdotsep}}
\newcommand{\cftsubsubsubsecdotsep}{\cftdotsep}
\newcommand{\cftsubsubsubsecpagefont}{\normalfont}
\newcommand{\cftsubsubsubsecafterpnum}{}
\newcommand{\cftsubsubsubsecfillnum}[1]{%
	{\cftsubsubsubsecleader}\nobreak
		\makebox[\@pnumwidth][\cftpnumalign]{\cftsubsubsubsecpagefont #1}\cftsubsubsubsecafterpnum\par
	}
%重写tocloft相关定义，解决tocloft中无法修改目录等级的问题
\renewcommand*{\l@paragraph}[2]{%
	\ifnum \c@tocdepth > 4 \relax
	\vskip \cftbeforeparaskip
	{\leftskip \cftparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftparanumwidth\relax
		\let\@cftbsnum \cftparapresnum
		\let\@cftasnum \cftparaaftersnum
		\let\@cftasnumb \cftparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftparafont #1}\nobreak
		\cftparafillnum{#2}}%
	\fi}
\renewcommand*{\l@subparagraph}[2]{%
	\ifnum \c@tocdepth > 5 \relax
	\vskip \cftbeforesubparaskip
	{\leftskip \cftsubparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubparanumwidth\relax
		\let\@cftbsnum \cftsubparapresnum
		\let\@cftasnum \cftsubparaaftersnum
		\let\@cftasnumb \cftsubparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubparafont #1}\nobreak
		\cftsubparafillnum{#2}}%
	\fi}
%重新设置缩进
\setlength{\cftparaindent}{11em}
\setlength{\cftparanumwidth}{5em}
\setlength{\cftsubparaindent}{13em}
\setlength{\cftsubparanumwidth}{6em}
%设置目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

%设置附录
\RequirePackage[title,titletoc]{appendix}
\renewcommand{\appendixname}{附录}

%设置标题的引用
\def\sectionautorefname~#1\null{%
	第~#1~节\null
}
\def\subsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\paragraphautorefname~#1\null{%
	段落~#1~\null
}
\def\subparagraphautorefname~#1\null{%
	段落~#1~\null
}


%
%	---	设置脚注格式
%
%脚注每页重新计数
\@addtoreset{footnote}{page}


%
%	---	设置图表格式
%
%设置图表标题的计数方式
\renewcommand{\thefigure}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@table}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}

%设置标题的样式
\RequirePackage{caption}
\DeclareCaptionFont{hust}{\normalsize \heiti}
\captionsetup{labelsep=quad}
\captionsetup{font={hust,singlespacing}}
\captionsetup[figure]{position=bottom,skip={0pt}}
\captionsetup[table]{position=top,skip={0pt}}
\setlength{\textfloatsep}{6pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%重新设置图表autoref
%\newcommand{\figureautorefname}{图}
\def\figureautorefname~#1\null{%
	图~#1~\null
}
%\newcommand{\tableautorefname}{表}
\def\tableautorefname~#1\null{%
	表~#1~\null
}

%使用tabularx库并定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}

%添加复杂的表格需求库
\RequirePackage{booktabs}
%设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}

%添加图需要的库
\RequirePackage{graphicx}

%重新定义图和表的浮动环境，使其方便使用
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}


%
%	---	设置公式格式
%
%使用ams的数学库
\RequirePackage{amsmath}

%设置公式间距为零
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt} 
}

%公式编号带章节
\numberwithin{equation}{section}

%重新设置公式autoref
%\newcommand{\equationautorefname}{等式}
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}


%
%	---	定义列表项的样式
%
\RequirePackage{enumitem}
\setlist{noitemsep}


%
%	---	定义新的标题页面
%
%用于解析参数
\RequirePackage{kvsetkeys}
%添加几个新的文档属性
\def \@school {}
\def \@classnum {}
\def \@stunum {}
\def \@instructor {}
\newcommand{\school}[1]{\def \@school {#1}}
\newcommand{\classnum}[1]{\def \@classnum {#1}}
\newcommand{\stunum}[1]{\def \@stunum {#1}}
\newcommand{\instructor}[1]{\def \@instructor {#1}}

%设置maketitle的参数解析
\newcommand{\arg@maketitle}[2]{
	\IfStrEqCase{#1}{
		{logo color}{
			\IfStrEqCase{#2}{
				{green}{\def\HGProp@titlecolor{HUSTGreen.eps}}
				{black}{\def\HGProp@titlecolor{HUSTBlack.eps}}
			}[\ClassWarning{\HGProp@name}{There's no such value for #1 (maketitle)}]
		}
		{line length}{\def\HGProp@titlelength{#2}}
		{line font}{
			\IfStrEqCase{#2}{
				{huawenzhongsong}{\def\HGProp@titlelinefont{\huawenzhongsong}}
				{songti}{\def\HGProp@titlelinefont{\songti}}
				{heiti}{\def\HGProp@titlelinefont{\heiti}}
				{fangsong}{\def\HGProp@titlelinefont{\fangsong}}
				{kaishu}{\def\HGProp@titlelinefont{\kaishu}}
				{lishu}{\def\HGProp@titlelinefont{\lishu}}
				{youyuan}{\def\HGProp@titlelinefont{\youyuan}}
			}[\ClassWarning{\HGProp@name}{There's no such value for #1 (maketitle)}]
		}
	}[\ClassWarning{\HGProp@name}{There's no such argument for maketitle}]
}
\newcommand{\maketitlearg}[1]{
	\IfSubStr{#1}{=}{
		\kv@parse{#1}{\arg@maketitle}
	}{
		\def\HGProp@titlelength{#1}
	}
}
%重置命令maketitle
\renewcommand{\maketitle}[1][12em]{
	\def\HGProp@titlecolor{HUSTGreen.eps}
	\def\HGProp@titlelength{12em}
	\def\HGProp@titlelinefont{}
	\maketitlearg{#1}
	\begin{titlepage}
		\begin{center}
			\vspace*{4em}
			\includegraphics[height=1.61cm]{\HGProp@titlecolor}\\
			\vspace*{2em}
			{\zihao{2} \huawenzhongsong \bfseries 本科生毕业设计（论文）开题报告}\\
			\vspace{6em}
			{\zihao{3} \huawenzhongsong \makebox[4em][s]{题 \hfill 目}： \underline{\makebox[20em]{\@title}}}\\
			\vspace{6em}
			{\zihao{3} \huawenzhongsong 
				\renewcommand\arraystretch{1.5}
				\begin{tabular}{lc}
					\makebox[4em][s]{院 \hfill 系} &
					\underline{\makebox[\HGProp@titlelength]{\HGProp@titlelinefont\@school}} \\
					\makebox[4em][s]{专业班级} &
					\underline{\makebox[\HGProp@titlelength]{\HGProp@titlelinefont\@classnum}} \\
					\makebox[4em][s]{姓 \hfill 名} &
					\underline{\makebox[\HGProp@titlelength]{\HGProp@titlelinefont\@author}} \\
					\makebox[4em][s]{学 \hfill 号} &
					\underline{\makebox[\HGProp@titlelength]{\HGProp@titlelinefont\@stunum}} \\
					\makebox[4em][s]{指导教师} &
					\underline{\makebox[\HGProp@titlelength]{\HGProp@titlelinefont\@instructor}} \\
			\end{tabular}}\\
			\vspace{4em}
			{\zihao{3} \huawenzhongsong \@date}\\
		\end{center}
	\end{titlepage}
}


%
%	---	定义新的声明页面
%
%使用特殊符号
\RequirePackage{amssymb}

%
%	评审表
%
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcommand{\evasheet}{
	\clearpage
	\pagestyle{empty}
	\phantomsection
	\begin{centering}
		\zihao{3}\huawenzhongsong\centering{\bfseries{华中科技大学本科生毕业设计（论文）开题报告评审表}}\\
		\vspace{1em}
		\zihao{5}\songti
		\renewcommand{\arraystretch}{1.5}
			\begin{tabular}{|c|c|c|c|c|c|}
				\hline 	\makebox[4em]{\bfseries{姓名}}&\makebox[6em]{\@author}
						&\makebox[4em]{\bfseries{学号}}&\makebox[10em]{\@stunum}
						&\makebox[5em]{\bfseries{指导教师}}&\makebox[5em]{\@instructor}\\
				\hline \multicolumn{2}{|c|}{\bfseries{院(系)专业}}&\multicolumn{4}{c|}{\@school}\\
				\hline \multicolumn{6}{|c|}{\bfseries{指导教师评语}}\\
				\multicolumn{6}{|c|}{
					\makecell[l]{
						1. 学生前期表现情况。\\
						2. 是否具备开始设计（论文）条件？是否同意开始设计（论文）？\\
						3. 不足及建议。\\
					}
				}\\
				\hline \multicolumn{6}{|c|}{		
					\makecell[r]{
						\vspace{14em}\\
						指导教师（签名）：\makebox[8em]{}\\
						年\hspace{2em}月\hspace{2em}日\makebox[2em]{}\\
						\vspace{1em}\\				
					}
				}\\
				\hline \multicolumn{6}{|c|}{
					\centering{\bfseries{教研室（系、所）或开题报告答辩小组审核意见}}
				}\\
				\hline \multicolumn{6}{|c|}{
					
					\makecell[r]{
						\vspace{8em}\\	
						{教研室（系、所）或开题报告答辩小组负责人（签名）：\makebox[8em]{}}\\
						{年\hspace{2em}月\hspace{2em}日\makebox[2em]{}}\\
						\vspace{1em}\\		
					}
								  
				}\\
				\hline
			\end{tabular}
	\end{centering}
}

%
%	---	重新定义参考文献页
%
%设置参考文献
\RequirePackage{natbib}
\setcitestyle{numbers,square,comma}
\ctexset{bibname={参考文献}}

%正常引用和上标引用
\let \normalcite \cite
\newcommand{\supercite}[2][]{
	\unskip
	\def\HGProp@temp{#1}
	\ifx\HGProp@temp\empty{\unskip\textsuperscript{\normalcite{#2}}}
	\else{\unskip\textsuperscript{\normalcite[#1]{#2}}}\fi
}
\IfStrEqCase{\HGProp@citestyle}{
	{normal}{}
	{super}{\let \cite \supercite}
}

%设置参考文献样式
\IfStrEqCase{\HGProp@citebst}{
	{gbt7714-2005}{\bibliographystyle{gbt7714-2005}}
	{gbt7714-2015}{\bibliographystyle{gbt7714-2015}}
	{thuthesis}{
		\bibliographystyle{thuthesis-numeric}
		\def\thudot{\unskip.}
	}
}

%设置新的参考文献
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	\section{主要参考文献}
	\oldbibliography{#1}
}

%
%	---	其他设置
%
%pdf文件信息设置
\AtBeginDocument{
	\hypersetup{
		pdfinfo={
			Title={\@title},
			Author={\@author},
			Subject={华中科技大学本科生毕业论文（设计）开题报告}
		}
	}
}



