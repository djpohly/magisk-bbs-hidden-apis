( # subshell to protect global namespace, since customize.sh is sourced

get_package_file() {
	pm list packages -f | sed -n 's/package:\(.*\)='"$1"'$/\1/p'
}

ui_print "- Locating BetterBatteryStats package:"
found=
for pkg in com.asksven.betterbatterystats com.asksven.betterbatterystats_xdaedition; do
	f=$(get_package_file "$pkg")
	if [ -z "$f" ]; then
		ui_print "    - $pkg not found"
		continue
	fi

	install -d "$MODPATH/system/app/$pkg/"
	install -m644 "$f" "$MODPATH/system/app/$pkg/"
	ui_print "    * $pkg found and systemized"
	found=1
done

[ -z "$found" ] && abort "! Could not find BetterBatteryStats package"

ui_print "- Hidden API policy will be applied on next boot"

)
