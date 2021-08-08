# Require: wget, base64
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -O ./gfwlist.tmp
cat gfwlist.tmp | base64 -d > gfwalist.txt

wget https://github.com/Loyalsoldier/cn-blocked-domain/raw/release/domains.txt -O ./cn-blocked-domain.tmp
sed -i "s/……/||/g" cn-blocked-domain.tmp

cat cn-blocked-domain.tmp >> gfwalist.txt
rm -r *.tmp
