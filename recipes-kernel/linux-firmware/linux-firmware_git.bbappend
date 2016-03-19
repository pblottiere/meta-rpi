FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM_append = "file://${WORKDIR}/LICENSE.broadcom_brcm80211;md5=304e3a0f31c2d8e34bdae23b06b74f39"

SRC_URI_append = " \
    file://brcmfmac43430-sdio.bin \
    file://brcmfmac43430-sdio.txt \
    file://LICENSE.broadcom_brcm80211 \
    "

do_install_append() {
    cp ${WORKDIR}/brcmfmac43430-sdio.* ${D}/lib/firmware/brcm
}

PACKAGES =+ "${PN}-brcm43430"
FILES_${PN}-brcm43430 = " \
    /lib/firmware/brcm/brcmfmac43430-sdio.bin \
    /lib/firmware/brcm/brcmfmac43430-sdio.txt \
    "

LICENSE_append = " & Firmware-broadcom_brcm80211"
NO_GENERIC_LICENSE[Firmware-broadcom_brcm80211] = "LICENCE.broadcom_brcm80211"
LICENSE_${PN}-brcm43430 = "LICENSE.broadcom_brcm80211"

ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
ALTERNATIVE_TARGET_linux-firmware-brcm43430[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43430-sdio.bin"
ALTERNATIVE_linux-firmware-brcm43430 = "brcmfmac-sdio.bin"

RDEPENDPS_${PN}-brcm43430 += "${PN}-broadcom-license"