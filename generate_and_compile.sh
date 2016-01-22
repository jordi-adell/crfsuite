crfsuite_dir=`dirname $0`;
crfsuite_dir=`readlink -m $crfsuite_dir`;

${crfsuite_dir}/autogen.sh 
#${crfsuite_dir}/configure --prefix=${crfsuite_dir}/build --bindir=${VERBIO_TTS_BIN} --libexecdir=${VERBIO_TTS_BIN} \
#    --libdir=${VERBIO_TTS_ROOT}/source/output/Linux/release --includedir=${VERBIO_TTS_ROOT}/source/inc/crfsuite  
./configure
make -j 2
make install

#export CPATH=$CPATH:${VERBIO_TTS_ROOT}/source/inc/crfsuite 
#export LIBRARY_PATH=$LIBRARY_PATH:${VERBIO_TTS_ROOT}/source/output/Linux/release 

cd swig/python/
./prepare.sh
python setup.py build_ext
python setup.py install #  --prefix=${VERBIO_TTS_ROOT}/source/output/Linux/python/local/
cd ../../
