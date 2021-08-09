# Require: wget, base64， xargs, split
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -O ./gfwlist.tmp
cat gfwlist.tmp | base64 -d > gfwalist.txt

desc="[Auto Proxy]\n! Expires: 7d\n! Title: GFWList4LL\n! HomePage: https://github.com/Lehmaning/gfwalist\n"
wget https://github.com/Loyalsoldier/cn-blocked-domain/raw/release/domains.txt -O ./cn-blocked-domain.tmp
sed -i "s/^google.*\..*//g" cn-blocked-domain.tmp
sed -i "s/^www\.//g" cn-blocked-domain.tmp
sed -i "s/^/||/g" cn-blocked-domain.tmp
sed -i "1i/$desc/" cn-blocked-domain.tmp

cat cn-blocked-domain.tmp >> gfwalist.txt
awk ' !x[$0]++' gfwalist.txt
rm -r *.tmp
