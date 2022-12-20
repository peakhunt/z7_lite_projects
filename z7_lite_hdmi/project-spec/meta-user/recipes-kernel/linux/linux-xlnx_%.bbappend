FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://bsp.cfg"
KERNEL_FEATURES_append = " bsp.cfg"
SRC_URI += "file://user_2022-12-05-04-35-00.cfg \
            file://user_2022-12-07-07-07-00.cfg \
            file://user_2022-12-07-07-55-00.cfg \
            file://user_2022-12-09-01-52-00.cfg \
            file://user_2022-12-09-02-18-00.cfg \
            file://user_2022-12-14-02-16-00.cfg \
            file://user_2022-12-14-05-24-00.cfg \
            file://user_2022-12-15-00-11-00.cfg \
            file://user_2022-12-19-00-17-00.cfg \
            file://user_2022-12-19-01-22-00.cfg \
            file://user_2022-12-19-02-00-00.cfg \
            file://user_2022-12-19-02-31-00.cfg \
            "

