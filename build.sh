# Require: wget, base64， xargs, split
tsocks wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -O ./gfwlist.tmp;
cat gfwlist.tmp | base64 -d > gfwalist.tmp
sed -i -e  "s/^google.*\..*//g" -e "1,17d" gfwalist.tmp

desc="! [Auto Proxy]\n! Expires: 7d\n! Title: GFWList4LL\n! HomePage: https://github.com/Lehmaning/gfwalist\n"
tsocks wget https://github.com/Loyalsoldier/cn-blocked-domain/raw/release/domains.txt -O ./cn-blocked-domain.tmp
#sed -i "s/^[a-zA-Z0-9]*\.//g" cn-blocked-domain.tmp
sed -i "s/^wwww\.//g" cn-blocked-domain.tmp
sed -i -e "s/^/||/g" -e "1i$desc" cn-blocked-domain.tmp
awk '!x[$0]++' gfwalist.tmp > gfwalist.txt
