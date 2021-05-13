\ ==============================================================================
\
\            ffl_test - the test-all source file in the ffl
\
\               Copyright (C) 2005  Dick van Oudheusden
\
\ This library is free software; you can redistribute it and/or
\ modify it under the terms of the GNU General Public
\ License as published by the Free Software Foundation; either
\ version 2 of the License, or (at your option) any later version.
\
\ This library is distributed in the hope that it will be useful,
\ but WITHOUT ANY WARRANTY; without even the implied warranty of
\ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
\ General Public License for more details.
\
\ You should have received a copy of the GNU General Public
\ License along with this library; if not, write to the Free
\ Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
\
\ ==============================================================================
\
\  $Date: 2009-05-23 05:37:24 $ $Revision: 1.47 $
\
\ ==============================================================================


include ffl/tst.fs

tst-reset-tests

\ the test sources

include test/a32_test.fs
include test/b64_test.fs
include test/act_test.fs
include test/arg_test.fs
include test/bar_test.fs
include test/bct_test.fs
include test/bis_test.fs
include test/bnt_test.fs
include test/car_test.fs
include test/cbf_test.fs
include test/chr_test.fs
include test/chs_test.fs
include test/cpx_test.fs
include test/crc_test.fs
include test/dcl_test.fs
include test/dnl_test.fs
include test/dom_test.fs
include test/dtm_test.fs
include test/dos_test.fs
include test/est_test.fs
include test/frc_test.fs
include test/fwt_test.fs
include test/fsm_test.fs
include test/hct_test.fs
include test/lbf_test.fs
include test/log_test.fs
include test/md5_test.fs
include test/msc_test.fs
include test/gmo_test.fs
include test/nct_test.fs
include test/nnt_test.fs
include test/rdg_test.fs
\ include test/rgx_test.fs
include test/rng_test.fs
include test/scl_test.fs
include test/snl_test.fs
include test/sh1_test.fs
include test/sh2_test.fs
include test/spf_test.fs
include test/str_test.fs
include test/stt_test.fs
include test/tis_test.fs
include test/tmr_test.fs
include test/tos_test.fs
include test/xis_test.fs
include test/xos_test.fs
include test/zif_test.fs

.( Forth Foundation Library Test: ) tst-get-result .  .( errors in ) . .( tests took ) . .( ms.) cr

bye

\ ==============================================================================
