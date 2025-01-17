set -e

ODBCPATH=/opt/sm1725-1/ktlee20/odbc_home
PROJECTPATH=../../build

BASEPATH=$PROJECTPATH/inst
DATAPATH=$PROJECTPATH/data
MYCNFPATH=$PROJECTPATH/inst/my.cnf
VARPATH=$PROJECTPATH/var
MY_USER=$USER


cmake .. \
  -DCMAKE_INSTALL_PREFIX=$BASEPATH \
  -DMYSQL_DATADIR=$DATAPATH \
  -DMYSQL_USER=$MY_USER \
  -DMYSQL_UNIX_ADDR=$BASEPATH/mysql.sock \
  -DSYSCONFDIR=$BASEPATH \
  -DENABLE_DOWNLOADS=1 \
  -DMYSQL_TCP_PORT=12345 \
  -DDEFAULT_CHARSET=utf8 \
  -DDEFAULT_COLLATION=utf8_general_ci \
  -DODBC_INCLUDES=$ODBCPATH/include \
  -DODBC_LIB_DIR=$ODBCPATH/lib \
  -DWITH_EXTRA_CHARSETS=all \
  -DENABLED_LOCAL_INFILE=1 \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DSYSTEMD_PID_DIR=$VARPATH/run/mysqld \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/opt/sm1725-1/ktlee20/boost \
  -DCMAKE_CXX_FLAGS=" -DSCSLAB_CVC -DSCSLAB_CVC_VALIDATION " \
  -DCMAKE_C_FLAGS=" -DSCSLAB_CVC -DSCSLAB_CVC_VALIDATION " 

make -j 
make install -j 


#-DCMAKE_BUILD_TYPE=Debug \
