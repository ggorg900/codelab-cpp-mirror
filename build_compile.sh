set -x
pushd exercises/sams-teach-urself-cpp/L9 
mkdir out
ret=0
for i in ./*.cpp ; do
    echo '--------- building and running $i ... ---------'
    g++ -w $i -o out/$i.out && ./out/$i.out
    [[ -f ./out/$i.out ]] || ret=1
done
popd
exit $ret
