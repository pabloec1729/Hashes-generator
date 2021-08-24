#!/usr/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad
#-------------------------------------------

# /usr/lib/qflow/scripts/synthesize.sh /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
# /usr/lib/qflow/scripts/placement.sh -d /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
/usr/lib/qflow/scripts/vesta.sh /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
# /usr/lib/qflow/scripts/router.sh /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
# /usr/lib/qflow/scripts/placement.sh -f -d /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
# /usr/lib/qflow/scripts/router.sh /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1 $status
# /usr/lib/qflow/scripts/cleanup.sh /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
# /usr/lib/qflow/scripts/display.sh /home/pabloec/UCR/2021_I/Microelectrónica/Proyectomicro_B52485/src/proyecto_rtl/hash_rtl/qflow/velocidad hash || exit 1
