MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

init-tmlgr:
	tlmgr update --self --all
	tlmgr paper a4
	tlmgr install collection-langjapanese
	tlmgr repository add http://contrib.texlive.info/current tlcontrib
	tlmgr pinning add tlcontrib '*'
	tlmgr install japanese-otf-nonfree japanese-otf-uptex-nonfree ptex-fontmaps-macos cjk-gs-integrate-macos
	cjk-gs-integrate --link-texmf --cleanup
	cjk-gs-integrate-macos --link-texmf
	mktexlsr
	kanji-config-updmap-sys --jis2004 hiragino-highsierra-pron

init-jlisting:
	cp $(MAKEFILE_DIR)sty/jlisting.sty /usr/local/texlive/2019basic/texmf-dist/tex/latex/listings/
	chmod +r /usr/local/texlive/2019basic/texmf-dist/tex/latex/listings/jlisting.sty
	mktexlsr

check-kanji:
	kanji-config-updmap-sys status
