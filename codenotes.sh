#!/bin/bash
GREP_ARGS=-Rn
case $1 in
    "docstrings")
	grep "📕" $GREP_ARGS
	;;
    "notes")
    	NOTES_FOUND=$(grep "📝" $GREP_ARGS | wc -l)
    	echo "============================================================================[Notes (found: $NOTES_FOUND)]"
	grep "📝" $GREP_ARGS
	;;
    "bugs")
	BUGS_FOUND=$(grep "😢" $GREP_ARGS | wc -l)
    	echo "============================================================================[Bugs (found: $BUGS_FOUND)]"
	grep "😢" $GREP_ARGS
	;;
    "crashes")
	grep "😭" $GREP_ARGS
	;;
    "stinks")
	grep "🤮" $GREP_ARGS
	;;
    *)
        ~/.scripts/codenotes notes
	~/.scripts/codenotes bugs
	;;
esac