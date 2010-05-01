# NCP - Novell Core Protocol
#
# This pattern has been tested and is believed to work well.  If it does not
# work for you, or you believe it could be improved, please post to 
# l7-filter-patterns@lists.sf.net .  This list may be subscribed to at
# http://lists.sourceforge.net/lists/listinfo/l7-filter-patterns
#
# dmdt means Request
#  *any length
#
#  *any reply buffer size
# "" means service request
#  |  means create a service connection
#  | uu means destroy service connection
# ncp reply
# tncp means reply
# 33 means service reply

# WARNING: this pattern uses non-printable characters.  Be careful when
# editing it!

ncp
dmdt.*.*(""||uu)|tncp.*33
