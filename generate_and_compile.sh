crfsuite_dir=`dirname $0`;
crfsuite_dir=`readlink -m $crfsuite_dir`;

set -e

curr_dir=`readlink -f $PWD`

trap "cd $curr_dir" EXIT

${crfsuite_dir}/autogen.sh 
./configure
make -j 2
make install

cd swig/python/
./prepare.sh
python setup.py build_ext
python setup.py install

