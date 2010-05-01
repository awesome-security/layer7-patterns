# dhcp -- Dynamic Host Configuration Protocol 
# 
# This pattern is unconfirmed. 
# Please post to l7-filter-patterns@lists.sf.net as to whether it works 
# for you or not.  If you believe it could be improved please post your 
# suggestions to that list as well. You may subscribe to this list at 
# http://lists.sourceforge.net/lists/listinfo/l7-filter-patterns
# 
# WARNING: this pattern uses non-printable characters.  Be careful when
# editing it!

dhcp
(|)[- ]?.......�?

# In hex, this reads: 
# 28 01 7c 02 29 5b 01 2d 20 5d 3f 06 2e 2e 2e 2e 2e 2e 2e 80 3f
# in psuedo-hex, it reads:
# (01|02)[01-20]?06.......80?

# Let's break that down:
#
# (0x01|0x02) is for BOOTREQUEST or BOOTREPLY
#
# [0x01-0x20]? is for any of the hardware address types listed at
# (http://www.iana.org/assignments/arp-parameters) and hopefully faster 
# ethernets too (100, 1000 and 10000mb) as well (do they share the 10mb 
# number?).  Since l7-filter strips nulls (0x00) out of packets, this byte 
# simply won't appear if it's a null, hence the '?'.
#
# 0x06 for "hardware address length = 6 bytes".  Does anyone use other lengths
# these days?  If so, this pattern won't match it as it stands.
#
# ....... for any number of hops, any random number and any number of seconds.
# Can we make this more specific by restricting the number of hops or seconds?
#
# 0x80? for the broadcast flag either on or off.  If it's off, it's a null and
# will have been striped out by l7-filter.


# other possible patterns: 
# submitted by ankit, but believed to be incorrect
# ((|)+())+.*^_
# Used to be this.
# 
