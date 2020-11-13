dd=$(date  +%Y-%m-%d)
echo $dd
aa=$(date -d "$dd -3 day" +%Y-%m-%d)
echo $aa
