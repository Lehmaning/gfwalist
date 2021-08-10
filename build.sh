# Require: wget, base64
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -O ./gfwlist.tmp;
cat gfwlist.tmp | base64 -d > gfwalist.tmp
sed -i "1,17d" gfwalist.tmp

desc="! [Auto Proxy 2.93]\n! Expires: 7d\n! Title: GFWList4LL\n! HomePage: https://github.com/Lehmaning/gfwalist\n"
wget https://github.com/Loyalsoldier/cn-blocked-domain/raw/release/domains.txt -O ./cn-blocked-domain.tmp
sed -i "s/^[a-zA-Z0-9]*\.//g" cn-blocked-domain.tmp
sed -i -e  "s/^google.*\..*//g" -e "s/^/||/g" cn-blocked-domain.tmp
cat cn-blocked-domain.tmp >> gfwalist.tmp

wget https://anti-ad.net/adguard.txt -O anti-ad.tmp
sed -i "s/\^$//g" anti-ad.tmp
awk -F '\t' '{if(FNR==NR){if($0!~"^#"){s[$1"_"$2"_"$4"_"$5]++}}else{if($0~"^#"||s[$1"_"$2"_"$4"_"$5]==0){print$0}}}' anti-ad.tmp gfwalist.tmp > gfwalist-1.tmp
awk '!x[$0]++' gfwalist-1.tmp > gfwalist-d.txt
sed -i -e "s/.*analy[sis|tics]\.*//g" -e "1i$desc" gfwalist-d.txt
base64 gfwalist-d.txt > gfwalist.txt
rm *.tmp
