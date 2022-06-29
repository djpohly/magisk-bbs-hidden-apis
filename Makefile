magisk-bbs-hidden-apis.zip: customize.sh module.prop
	zip -Dr - META-INF/ system/ $^ > $@
