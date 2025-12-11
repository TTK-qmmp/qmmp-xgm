
QMAKE_CFLAGS += -std=gnu11
greaterThan(QT_MAJOR_VERSION, 5){
    QMAKE_CXXFLAGS += -std=c++17
}else{
    QMAKE_CXXFLAGS += -std=c++11
}

HEADERS += decoderxgmfactory.h \
           decoder_xgm.h \
           xgmhelper.h \
           settingsdialog.h

SOURCES += decoderxgmfactory.cpp \
           decoder_xgm.cpp \
           xgmhelper.cpp \
           settingsdialog.cpp \
           libxgm/jaytrax/jaytrax.c \
           libxgm/jaytrax/jxs.c \
           libxgm/jaytrax/mixcore.c \
           libxgm/kss/modules/emu2149/emu2149.c \
           libxgm/kss/modules/emu2212/emu2212.c \
           libxgm/kss/modules/emu2413/emu2413.c \
           libxgm/kss/modules/emu2413/sample2413.c \
           libxgm/kss/modules/emu76489/emu76489.c \
           libxgm/kss/modules/emu8950/emu8950.c \
           libxgm/kss/modules/emu8950/emuadpcm.c \
           libxgm/kss/modules/kmz80/kmdmg.c \
           libxgm/kss/modules/kmz80/kmevent.c \
           libxgm/kss/modules/kmz80/kmr800.c \
           libxgm/kss/modules/kmz80/kmz80.c \
           libxgm/kss/modules/kmz80/kmz80c.c \
           libxgm/kss/modules/kmz80/kmz80t.c \
           libxgm/kss/modules/kmz80/kmz80u.c \
           libxgm/kss/src/filters/dc_filter.c \
           libxgm/kss/src/filters/filter.c \
           libxgm/kss/src/filters/rc_filter.c \
           libxgm/kss/src/kss/bgm2kss.c \
           libxgm/kss/src/kss/kss.c \
           libxgm/kss/src/kss/kss2kss.c \
           libxgm/kss/src/kss/kssload.c \
           libxgm/kss/src/kss/mbm2kss.c \
           libxgm/kss/src/kss/mgs2kss.c \
           libxgm/kss/src/kss/mpk2kss.c \
           libxgm/kss/src/kss/opx2kss.c \
           libxgm/kss/src/kss2vgm.c \
           libxgm/kss/src/kssplay.c \
           libxgm/kss/src/rconv/psg_rconv.c \
           libxgm/kss/src/vm/detect.c \
           libxgm/kss/src/vm/mmap.c \
           libxgm/kss/src/vm/vm.c \
           libxgm/nezplug/device/logtable.c \
           libxgm/nezplug/device/nes/s_apu.c \
           libxgm/nezplug/device/nes/s_fds.c \
           libxgm/nezplug/device/nes/s_fds1.c \
           libxgm/nezplug/device/nes/s_fds2.c \
           libxgm/nezplug/device/nes/s_fds3.c \
           libxgm/nezplug/device/nes/s_fme7.c \
           libxgm/nezplug/device/nes/s_mmc5.c \
           libxgm/nezplug/device/nes/s_n106.c \
           libxgm/nezplug/device/nes/s_vrc6.c \
           libxgm/nezplug/device/nes/s_vrc7.c \
           libxgm/nezplug/device/opl/s_deltat.c \
           libxgm/nezplug/device/opl/s_opl.c \
           libxgm/nezplug/device/s_dmg.c \
           libxgm/nezplug/device/s_hes.c \
           libxgm/nezplug/device/s_hesad.c \
           libxgm/nezplug/device/s_psg.c \
           libxgm/nezplug/device/s_scc.c \
           libxgm/nezplug/device/s_sng.c \
           libxgm/nezplug/format/audiosys.c \
           libxgm/nezplug/format/handler.c \
           libxgm/nezplug/format/m_gbr.c \
           libxgm/nezplug/format/m_hes.c \
           libxgm/nezplug/format/m_kss.c \
           libxgm/nezplug/format/m_nsd.c \
           libxgm/nezplug/format/m_nsf.c \
           libxgm/nezplug/format/m_sgc.c \
           libxgm/nezplug/format/m_zxay.c \
           libxgm/nezplug/format/nezplug.c \
           libxgm/nezplug/format/nsf6502.c \
           libxgm/nezplug/format/songinfo.c \
           libxgm/nezplug/format/trackinfo.c \
           libxgm/nezplug/logtable/log_table_12_7_30.c \
           libxgm/nezplug/logtable/log_table_12_8_30.c \
           libxgm/nezplug/opltable/opl_table.c \
           libxgm/pac/effect.c \
           libxgm/pac/error.c \
           libxgm/pac/gus.c \
           libxgm/pac/init.c \
           libxgm/pac/load.c \
           libxgm/pac/mix.c \
           libxgm/pac/read.c \
           libxgm/pac/seek.c

FORMS += settingsdialog.ui

INCLUDEPATH += $$PWD/libxgm \
               $$PWD/libxgm/kss/src \
               $$PWD/libxgm/kss/modules

#CONFIG += BUILD_PLUGIN_INSIDE
contains(CONFIG, BUILD_PLUGIN_INSIDE){
    include($$PWD/../../plugins.pri)
    TARGET = $$PLUGINS_PREFIX/Input/xgm

    unix{
        target.path = $$PLUGIN_DIR/Input
        INSTALLS += target
    }
}else{
    QT += widgets
    CONFIG += warn_off plugin lib thread link_pkgconfig c++11
    TEMPLATE = lib

    unix{
        equals(QT_MAJOR_VERSION, 4){
            QMMP_PKG = qmmp-0
        }else:equals(QT_MAJOR_VERSION, 5){
            QMMP_PKG = qmmp-1
        }else:equals(QT_MAJOR_VERSION, 6){
            QMMP_PKG = qmmp
        }else{
            error("No Qt version found")
        }
        
        PKGCONFIG += $${QMMP_PKG}

        PLUGIN_DIR = $$system(pkg-config $${QMMP_PKG} --variable=plugindir)/Input
        INCLUDEPATH += $$system(pkg-config $${QMMP_PKG} --variable=prefix)/include

        plugin.path = $${PLUGIN_DIR}
        plugin.files = lib$${TARGET}.so
        INSTALLS += plugin
    }
}
