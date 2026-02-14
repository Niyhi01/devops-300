## Day 12 Morning
- Watched theory: Data Center Networks (Spine-Leaf) and WAN.
- Built: datacenter-design-quiz.sh


## Day 12 Evening – DNS Resolver & Cache Simulator v1

Project Summary: Built a script that checks local cache first, queries DNS on miss, and saves results for future hits. Tested multiple domains with hit/miss behavior.

Pseudocode (screenshot attached or pasted here):
[Paste your 10+ lines of initial pseudocode/comments]

Reflection:
1. Hardest part: Getting the cache save to work without overwriting and handling empty dig output.
2. Caching speeds up lookups by avoiding repeated network queries to DNS servers.
3. If DNS server down: Script would show error, no IP returned, cache not updated.

Ownership Statement:
I wrote 100% of dns-cache-lookup.sh myself without AI generating full blocks. I used AI only to explain one dig error.
