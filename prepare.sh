#!/bin/sh

set -e

TARGET_DIR=$PWD/texlive
rm -rf $TARGET_DIR

PROFILE=texlive.profile

cat > $PROFILE <<END_CAT
# texlive.profile written on Mon Mar 31 09:11:02 2014 UTC
# It will NOT be updated and reflects only the
# installation profile at installation time.
selected_scheme scheme-custom
TEXDIR $TARGET_DIR
TEXMFCONFIG $TEXMFSYSCONFIG
TEXMFHOME $TEXMFLOCAL
TEXMFLOCAL $TARGET_DIR/texmf-local
TEXMFSYSCONFIG $TARGET_DIR/texmf-config
TEXMFSYSVAR $TARGET_DIR/texmf-var
TEXMFVAR $TEXMFSYSVAR
binary_x86_64-linux 1
collection-basic 1
collection-latex 1
collection-latexrecommended 1
portable 1
option_adjustrepo 1
option_autobackup 1
option_backupdir tlpkg/backups
option_desktop_integration 
option_doc 1
option_file_assocs 
option_fmt 1
option_letter 0
option_menu_integration 
option_path 0
option_post_code 1
option_src 1
option_sys_bin /usr/local/bin
option_sys_info /usr/local/share/info
option_sys_man /usr/local/share/man
option_w32_multi_user 0
option_write18_restricted 1
END_CAT

rm -f installation.profile
install-tl-*/install-tl -profile $PROFILE

SQUASHFS=texlive.squashfs

rm -r $TARGET_DIR/texmf-dist/doc
mksquashfs $TARGET_DIR $SQUASHFS -all-root -comp xz -Xbcj x86
