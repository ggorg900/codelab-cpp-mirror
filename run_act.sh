set -x
p1=$1

T1=$SECONDS
LOGFILE=codelab-cpp-mirror
OGFILE_PATH=log/$LOGFILE.log

for i in {1..100};
do
    if [[ $p1 ]] ; then
        LOGFILE=codelab-cpp-mirror_${i}_${p1}
    else
        LOGFILE=codelab-cpp-mirror_${i}
    fi
    LOGFILE_PATH=log/$LOGFILE.log

    if [[ ! -f $LOGFILE_PATH  ]] ; then
        sleep 1
        act workflow_dispatch --workflows ./.github/workflows/codelab-cpp-actions.yml 2>&1 | tee $LOGFILE_PATH
        break
    else
        continue
    fi
done

T2=$SECONDS
echo "Total run time: $((T2-T1)) seconds or $(((T2-T1)/60)) mins." | tee -a log/${LOGFILE}_summary.log

