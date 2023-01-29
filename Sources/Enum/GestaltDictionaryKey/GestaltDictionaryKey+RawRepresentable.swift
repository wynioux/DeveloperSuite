//
//  GestaltDictionaryKey+RawRepresentable.swift
//  DeveloperSuite
//
//  Copyright (c) 2023 Bahadır A. Güder
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

// MARK: RawRepresentable

extension GestaltDictionaryKey: RawRepresentable {
    typealias RawValue = String

    // MARK: - init

    public init?(rawValue: String) {
        let trimmedRawValue = rawValue
            .trimmingCharacters(in: .whitespaces)

        guard !trimmedRawValue.isEmpty,
              trimmedRawValue.count == 22
        else { return nil }

        switch trimmedRawValue {
        // swiftformat:disable all
        // 3 -------------------------------------------------------------------------------------------------
        case "NXJOYK7VhNn" + "7ugbF2kx0zg": self = .key3GProximityCapability
        case "DGBWzPMdVuq" + "PxgH7iSz3SA": self = .key3GVeniceCapability
        // ---------------------------------------------------------------------------------------------------
            
        // 7 -------------------------------------------------------------------------------------------------
        case "Lg1EJX11Jb7" + "EbveB6+YgVQ": self = .key720pPlaybackCapability
        // ---------------------------------------------------------------------------------------------------
            
        // A -------------------------------------------------------------------------------------------------
        case "spGVujDEmyC" + "zDznXozB3oA": self = .keyAPNCapability
        case "kKgJsWN/rBU" + "AkimOtm/wbA": self = .keyARM64ExecutionCapability
        case "g+9NpjmSVwt" + "omd8nyNJimg": self = .keyARMV6ExecutionCapability
        case "DWrhyh1BwYy" + "pYmW5q78Wuw": self = .keyARMV7ExecutionCapability
        case "RYO2N0gqp5h" + "HCik2TEiSVA": self = .keyARMV7SExecutionCapability
        case "MWduuAGptrl" + "7qIzWqBmOqQ": self = .keyAWDID
        case "XI87Zkcr5j1" + "B/p2dom/B6A": self = .keyAWDLCapability
        case "39ZkJVEsL4p" + "mCXbg+89QmQ": self = .keyAccelerometerCapability
        case "16N2bLOzcgJ" + "EsZToEX21Zg": self = .keyAccessibilityCapability
        case "XWAyufZ2Src" + "lH9F9EDmBKw": self = .keyAcousticID
        case "zP3kBA1Biwz" + "2d6PTIIbmUQ": self = .keyActivationProtocol
        case "Eavu9TP+iZ0" + "Lzlk7FU6w6Q": self = .keyActiveWirelessTechnology
        case "hhRNi2d3z2W" + "EFmU+xG/EXw": self = .keyActuatorResonantFrequency
        case "6k70IxahfOQ" + "TZbGwu++QwA": self = .keyAdditionalTextTonesCapability
        case "JLP/Iinyzet" + "EPztvoNUNKg": self = .keyAggregateDevicePhotoZoomFactor
        case "IweaHIDpz+r" + "knAcb3+xg9g": self = .keyAggregateDeviceVideoZoomFactor
        case "IBqcPacFMPI" + "X8HMWob444A": self = .keyAirDropCapability
        case "/bSMNaIuUT5" + "8N/BN1nYUjw": self = .keyAirDropRestriction
        case "l/n0Z7pMB8k" + "0GyTKz3v3Tw": self = .keyAirplaneMode
        case "MWJNrFKpHkB" + "Em8jAdJf1xw": self = .keyAirplayMirroringCapability
        case "ibhfX8FQ6b8" + "09N632Ey98g": self = .keyAllow32BitApps
        case "Ex6ChutQnIx" + "5Zm6c5uwYuw": self = .keyAllowOnlyATVCPSDKApps
        case "7l0BaQsNxJC" + "anoeHMJ2huA": self = .keyAllowYouTube
        case "MTa8c+pEdbK" + "0tHGXP06xOw": self = .keyAllowYouTubePlugin
        case "lo3szoQ4sLy" + "7o3+ZD0GcAQ": self = .keyAmbientLightSensorCapability
        case "UCLOC2TKe3v" + "RkId34ubKWw": self = .keyAmbientLightSensorSerialNumber
        case "hykQtM0zkNe" + "2/IY69+3PPQ": self = .keyApNonce
        case "UcRWpMcvJDf" + "Lzn6utLj3XQ": self = .keyApNonceRetrieve
        case "kkSkHTEei96" + "N1ZehicOgoA": self = .keyAppCapacityTVOS
        case "XEoV4os3FAU" + "L7yHDxWmSMw": self = .keyAppStoreCapability
        case "EqrsVvjcYDd" + "xHBiQmGhAWw": self = .keyAppleInternalInstallCapability
        case "eJGhnVvylF3" + "dMOHBKJzeiw": self = .keyAppleNeuralEngineSubtype
        case "7yzVesPANxq" + "KQ+oqNPhTwg": self = .keyApplicationInstallationCapability
        case "KzUQgIyBRin" + "kweVMNUCOWA": self = .keyArcModuleSerialNumber
        case "nhGhVMyvrWY" + "e9U2ltAUImg": self = .keyArrowChipID
        case "CPiqZJJPocp" + "jc5C5qe1tiw": self = .keyArrowUniqueChipID
        case "oPeik/9e8lQ" + "WMszEjbPzng": self = .keyArtworkTraits
        case "xOJfWykLmQC" + "c8lKlzMlrLA": self = .keyAssistantCapability
        case "paR6NqTecAD" + "44x45kzV87g": self = .keyAudioPlaybackCapability
        case "o0axLo6LGt8" + "HbuEWdLZ92Q": self = .keyAutoFocusCameraCapability
        case "ILaGO+KV5JA" + "Oq7Q5GEwbWQ": self = .keyAvailableDisplayZoomSizes
        // ---------------------------------------------------------------------------------------------------
            
        // B -------------------------------------------------------------------------------------------------
        case "1DQNgySZSIj" + "PqLWroIzfiQ": self = .keyBacklightCapability
        case "HXTqT3UXOKu" + "TEklxz+wMAA": self = .keyBasebandAPTimeSync
        case "ToJGxfcjkIe" + "rYyeL2e8c4A": self = .keyBasebandBoardSnum
        case "Q5QHkCRPRmi" + "X3L/5xxKrRg": self = .keyBasebandCertId
        case "eNgz35a7iZn" + "VeEMwsBQZew": self = .keyBasebandChipId
        case "pB5sZVvnp+Q" + "jZQtt2KfQvA": self = .keyBasebandChipset
        case "XQBHOWjPt2P" + "+uNqlLm1P7A": self = .keyBasebandClass
        case "FkD7K642S08" + "2lnfw/ohHzg": self = .keyBasebandFirmwareManifestData
        case "Djv9tHz6MLd" + "TUDjnkq0obQ": self = .keyBasebandFirmwareUpdateInfo
        case "PQzmRjKVMis" + "tuIVsqs6QXA": self = .keyBasebandFirmwareVersion
        case "H5HW20mJr/d" + "jc40tAehkww": self = .keyBasebandKeyHashInformation
        case "vaiFeAcMTID" + "XMSxTr8JwCw": self = .keyBasebandPostponementStatus
        case "YUobJKXH3+u" + "krUe13TXL3Q": self = .keyBasebandPostponementStatusBlob
        case "91LyMcx4z1w" + "3SGVeqteMnA": self = .keyBasebandRegionSKU
        case "Z3gOHeppbL6" + "+rblIe8H5Ag": self = .keyBasebandRegionSKURadioTechnology
        case "EImfMz+bzJr" + "UkVQKyY6tEg": self = .keyBasebandSecurityInfoBlob
        case "Nmhz54v5ZLq" + "j2I4NPFIFqQ": self = .keyBasebandSerialNumber
        case "CN64p1hw1JV" + "dTHCfBdgPLQ": self = .keyBasebandStatus
        case "vIccod02kDx" + "ScKF5s2h6OA": self = .keyBasebandUniqueId
        case "f2DlVMUVcV+" + "MeWs/g2ku+g": self = .keyBatteryCurrentCapacity
        case "sLe8lqXRlqZ" + "M74MNUoVcyQ": self = .keyBatteryIsCharging
        case "jgE7MmmkZAG" + "0BiWVqD7bMQ": self = .keyBatteryIsFullyCharged
        case "DcQNvnO5Uhp" + "c1jjGIrzyng": self = .keyBatterySerialNumber
        case "F1Xz9g1JORi" + "bBS9DYPUPrg": self = .keyBlueLightReductionSupported
        case "k5lVWbXuiZH" + "LA17KGiVUAA": self = .keyBluetoothAddress
        case "jSDzacs4RYW" + "nWxn142UBLQ": self = .keyBluetoothAddressData
        case "XSLlJd/8sMy" + "XO0qtvvUTBQ": self = .keyBluetoothCapability
        case "q3JBrhzy5fy" + "J1+LAITPW0w": self = .keyBluetoothLE2Capability
        case "8/HMvzDR3J6" + "m0aY3NYeqcg": self = .keyBluetoothLECapability
        case "0uthiXrHZ21" + "2KvcJizKHEw": self = .keyBoardId
        case "VqRhf8vgXr9" + "B+SYvpnX39g": self = .keyBoardRevision
        case "Qq9/Mya05P4" + "ToEr1pMpGGg": self = .keyBootManifestHash
        case "1Rm/mWYEI5t" + "taC0dJ3sHBQ": self = .keyBootNonce
        case "GxXmRWHjsY5" + "yAVhMfCH6Lg": self = .keyBridgeBuild
        case "Glo+aTkt0Uw" + "31BghCxnsyQ": self = .keyBridgeRestoreVersion
        case "z+5gEULGC7a" + "EYopBd4ggpA": self = .keyBuddyLanguagesAnimationRequiresOptimization
        case "qwXfFvH5jPX" + "Pxrny0XuGtQ": self = .keyBuildID
        case "mZfUC7qo4pU" + "RNhyMHZ62RQ": self = .keyBuildVersion
        // ---------------------------------------------------------------------------------------------------
            
        // C -------------------------------------------------------------------------------------------------
        case "tdUWKiiM7Jd" + "ctnzQuvaVVA": self = .keyC2KDeviceCapability
        case "k7QIBwZJJOV" + "w+Sej/8h8VA": self = .keyCPUArchitecture
        case "AWEfP3xWh0q" + "1MjO3JAy/AA": self = .keyCPUSubType
        case "xZm4Ky2/qsw" + "yf7ykvlchYg": self = .keyCPUType
        case "57eLnXynqDl" + "QaGEi+9JAtQ": self = .keyCallForwardingCapability
        case "eXCYx/SHTZI" + "n5LInWvZByw": self = .keyCallWaitingCapability
        case "tad3RCjcWdk" + "yLSVI8kUBtA": self = .keyCallerIDCapability
        case "NszbG6qiAzt" + "Val4mpDQRkg": self = .keyCameraAppUIVersion
        case "": self = .keyCameraCapability
        case "jdLgKT+0BZm" + "Grzd9J0cuPA": self = .keyCameraFlashCapability
        case "fJZs6N8SqTS" + "4RuQVh3szxA": self = .keyCameraFrontFlashCapability
        case "cWWKdUn+rIc" + "lZ60ZGAVhBw": self = .keyCameraHDR2Capability
        case "+97cHA72jHl" + "HqQnIkgGBYg": self = .keyCameraHDRVersion
        case "03hWmMtMs+4" + "nzama4/PzHQ": self = .keyCameraLiveEffectsCapability
        case "gBw7IWiBnLH" + "aA+lBrZBgWw": self = .keyCameraMaxBurstLength
        case "2pxKjejpRGp" + "WvUE+3yp5mQ": self = .keyCameraRestriction
        case "475wW3fne+t" + "yzGr4wleUSQ": self = .keyCarrierBundleInfoArray
        case "9n2qz3uDC5n" + "Se1xZG1/Bkw": self = .keyCarrierInstallCapability
        case "CN/XFuy/9Fd" + "v0yE+28kwRQ": self = .keyCellBroadcastCapability
        case "L5al7b+7JAT" + "D/izSJeH0aQ": self = .keyCellularDataCapability
        case "ebyBs0j3KAq" + "uBsgcfrNZIg": self = .keyCellularTelephonyCapability
        case "uO3aPe7lfB1" + "XxSiz/1xBvA": self = .keyCertificateProductionStatus
        case "eg8KDO//lXa" + "Lwp+URGP6DA": self = .keyCertificateSecurityMode
        case "566JrJVMlDf" + "nslGpwUzNlQ": self = .keyChipID
        case "8OTc3mN30AC" + "aEwecgpKfXA": self = .keyCloudPhotoLibraryCapability
        case "diS7AlmwFZz" + "6NyF7CY97sA": self = .keyCoastlineGlowRenderingCapability
        case "qb//mYg6KeT" + "mjv8w4ZAMIg": self = .keyCompassCalibration
        case "aoAKcHLuTUp" + "/o3squcJkhA": self = .keyCompassCalibrationDictionary
        case "meLhyIpGgxi" + "QoFZD/OGPcQ": self = .keyCompassType
        case "v5YVEwERRin" + "1v+reUNjJ5w": self = .keyComputerName
        case "ol92SaBpqIv" + "Qs+KBljuwGA": self = .keyConferenceCallType
        case "SmUPjD77AHI" + "MCLny9nawdw": self = .keyConfigNumber
        case "yRZv0s7Dpj8" + "ZBk0S+0+nMA": self = .keyContainsCellularRadioCapability
        case "y0jtYciPmcx" + "3ywPM582WZw": self = .keyContinuityCapability
        case "g7vU4YF+9Z+" + "wkSvw/Cm8Dg": self = .keyCoreRoutineCapability
        case "OWi11Urd09r" + "DmPVy1z5dOQ": self = .keyCoverglassSerialNumber
        // ---------------------------------------------------------------------------------------------------
            
        // D -------------------------------------------------------------------------------------------------
        case "ZEF0po63sTg" + "pVrc9Ce7YNQ": self = .keyDMin
        case "KGlZoljMyZQ" + "SxfhROj0IFg": self = .keyDataPlanCapability
        case "DrSqlXYNVfY" + "XCvAsuUrUDA": self = .keyDebugBoardRevision
        case "Mh+drGtyBfL" + "YKN02sROzxg": self = .keyDelaySleepForHeadsetClickCapability
        case "OWLyWlUOIkl" + "+eQB7Iq37xQ": self = .keyDesenseBuild
        case "M+WPVivF4iT" + "nm1CC8c6h+A": self = .keyDeviceAlwaysPrewarmActuator
        case "bUJD9zcOcit" + "JwFA0ieIkxA": self = .keyDeviceBackGlassMaterial
        case "CJcvxERO5v/" + "3IWjDFKZKRw": self = .keyDeviceBackingColor
        case "fuKL2rMywRg" + "QF1wowOA/cg": self = .keyDeviceBrand
        case "+3Uf0Pm5F8X" + "y7Onyvko0vA": self = .keyDeviceClass
        case "mtrAoWJ3gsq" + "+I90ZnQ0vQw": self = .keyDeviceClassNumber
        case "mumHZHMLEfA" + "uTkkd28fHlQ": self = .keyDeviceColor
        case "87sSAh2rboM" + "I2TDvFBimkg": self = .keyDeviceColorMapPolicy
        case "y5dppxx/Lzx" + "oNuW+iIKR3g": self = .keyDeviceCornerRadius
        case "9N7qIucqhr0" + "Cy2/Tk27/hw": self = .keyDeviceCoverGlassColor
        case "gnQwi8RnEeM" + "G9qBe3IUKrg": self = .keyDeviceCoverGlassMaterial
        case "iaegRQa4jNG" + "OuTA6hnZmcQ": self = .keyDeviceCoverMaterial
        case "JhEU414EIaD" + "vAz8ki5DSqw": self = .keyDeviceEnclosureColor
        case "AtmPEO/j+Pd" + "r8+WKxv4Aaw": self = .keyDeviceEnclosureMaterial
        case "TXZxlSojLMQ" + "yLqusm9aa/g": self = .keyDeviceEnclosureRGBColor
        case "0/VAyl58TL5" + "U/mAQEJNRQw": self = .keyDeviceHasAggregateCamera
        case "NJsxTSI2WuD" + "+13rxShXX9w": self = .keyDeviceHousingColor
        case "VGDDUFPWHbX" + "/Ie9RSI0yDQ": self = .keyDeviceIsMuseCapable
        case "DrrXMX9VWX7" + "bMj0MZuhTUA": self = .keyDeviceKeyboardCalibration
        case "emXA9B552rn" + "SoI7xXE91DA": self = .keyDeviceLaunchTimeLimitScale
        case "rkqlwPcRHwi" + "xY4gapPjanw": self = .keyDeviceName
        case "": self = .keyDeviceNameString
        case "xbNo7dj2oAn" + "z92JhEOn9tw": self = .keyDevicePrefers3DBuildingStrokes
        case "QFnvO2shAYI" + "+d4bj3qXuFQ": self = .keyDevicePrefersBuildingStrokes
        case "7D54DikSnFQ" + "nbDEBwlKQTQ": self = .keyDevicePrefersCheapTrafficShaders
        case "bysMryc4yLw" + "QjKvUQGGXXQ": self = .keyDevicePrefersProceduralAntiAliasing
        case "0VkTunHOJrr" + "ZdolQXR5gCg": self = .keyDevicePrefersTrafficAlpha
        case "9RryeqF6OCW" + "lbaXP2Qsoag": self = .keyDeviceProximityCapability
        case "8/tysfSvORo" + "yVg9IE901oQ": self = .keyDeviceRGBColor
        case "82Ono2SP03r" + "NGkhOc5O1Mw": self = .keyDeviceRequiresPetalOptimization
        case "r5QUsvvgcb2" + "Qmuflua13fQ": self = .keyDeviceRequiresProximityAmeliorations
        case "2Qf/8sQyx6v" + "oo3Mw3QKgZQ": self = .keyDeviceRequiresSoftwareBrightnessCalculations
        case "QbQzuIbef01" + "P4JeoL9EmKg": self = .keyDeviceSceneUpdateTimeLimitScale
        case "wtUF1NceYeL" + "T6IHovZvocw": self = .keyDeviceSubBrand
        case "Mk4ZslaChmO" + "+6s3h7L1w6Q": self = .keyDeviceSupports1080p
        case "ohnQBWkVQf2" + "nu9Vr/9uLug": self = .keyDeviceSupports3DImagery
        case "HIaq6xVZ/V8" + "B9pnigcvqCA": self = .keyDeviceSupports3DMaps
        case "": self = .keyDeviceSupports3rdPartyHaptics
        case "eu8pUYR7yo+" + "AlS9aojlgwg": self = .keyDeviceSupports4G
        case "Fh2Ga0/Sj4T" + "3Qn5Z9A9BMw": self = .keyDeviceSupports4k
        case "V2Ykm/0M3CA" + "6nyNhwNInsg": self = .keyDeviceSupports64Bit
        case "lwHRTZNO5Jq" + "87pVlzdNGIA": self = .keyDeviceSupports720p
        case "qWGVjnlN/wW" + "MhlWgfNcSBg": self = .keyDeviceSupports9Pin
        case "HHF6YgqEQ9K" + "d7MBSVnLsgg": self = .keyDeviceSupportsAOP
        case "67A3BpQkCRe" + "1ihx0Me4lgg": self = .keyDeviceSupportsARKit
        case "ji56BO1mUeT" + "7Qg9RO7Er9w": self = .keyDeviceSupportsASTC
        case "whbsdxpLirB" + "FgUbLH3+0JA": self = .keyDeviceSupportsAdaptiveMapsUI
        case "U+73bmG4kBG" + "j6kpreQXUTQ": self = .keyDeviceSupportsAlwaysListening
        case "aCQx2Qq/TCh" + "nNAq1rr6Egw": self = .keyDeviceSupportsAlwaysOnCompass
        case "j8/Omm6s1ls" + "mTDFsXjsBfA": self = .keyDeviceSupportsAlwaysOnTime
        case "yhHcB0iH0d1" + "XzPO/CFd3ow": self = .keyDeviceSupportsApplePencil
        case "AX/UKxSHwm+" + "OuFRIdvNAfg": self = .keyDeviceSupportsAutoLowLightVideo
        case "y4GIxpQP4MO" + "/j3wWUJdiyg": self = .keyDeviceSupportsAvatars
        case "D6/BMDrlb8V" + "3WSiqL8gL+w": self = .keyDeviceSupportsBatteryModuleAuthentication
        case "wNdWl5xfBJm" + "JGNWJr5t0zA": self = .keyDeviceSupportsBerkelium2
        case "L47fh6KehOm" + "R+AseqK2Xsw": self = .keyDeviceSupportsCCK
        case "gQDt76Te0SP" + "w7N8oTLrBFw": self = .keyDeviceSupportsCameraCaptureOnTouchDown
        case "E9a3UzlfYjW" + "EB9viQCHNAA": self = .keyDeviceSupportsCameraDeferredProcessing
        case "XriAxQ+JY1z" + "5nt5f3ftXVw": self = .keyDeviceSupportsCameraHaptics
        case "XFtUsQP3Ayq" + "T4CazSb5VCw": self = .keyDeviceSupportsCarIntegration
        case "j1pdCAYnpIE" + "YMqIAitm3JA": self = .keyDeviceSupportsCinnamon
        case "gqDnklGQnpv" + "5ilgh5uHckw": self = .keyDeviceSupportsClosedLoopHaptics
        case "a/mex6YNO6g" + "J8N8SxAA71A": self = .keyDeviceSupportsCrudeProx
        case "XkfGVYlrkBQ" + "JgaGabHESJQ": self = .keyDeviceSupportsDClr
        case "Kq9K9xqDoUi" + "UP7JEfg+pNw": self = .keyDeviceSupportsDoNotDisturbWhileDriving
        case "awim/yUQvLy" + "TrKsoKhg2bA": self = .keyDeviceSupportsELabel
        case "kyszW/uUGJF" + "TVNQwFaf6og": self = .keyDeviceSupportsEnhancedAC3
        case "SaW+DA+cbiq" + "DHrex8MTABA": self = .keyDeviceSupportsEnvironmentalDosimetry
        case "feC7TgoAAKL" + "jn/KU8JAKFA": self = .keyDeviceSupportsExternalHDR
        case "nK4D+jDUuTG" + "FFwRFPC2lWg": self = .keyDeviceSupportsFloorCounting
        case "JkZlE8z9YwH" + "jE1hnbMhcgA": self = .keyDeviceSupportsHDRDeferredProcessing
        case "": self = .keyDeviceSupportsHMEInARKit
        case "cBy4BcYs5YW" + "tFHbBpt4C6A": self = .keyDeviceSupportsHaptics
        case "V9pLLbPQhyb" + "75bbdTioZVw": self = .keyDeviceSupportsHardwareDetents
        case "H+r3Nk8ByXI" + "Y9ub/M8broA": self = .keyDeviceSupportsHeartHealthAlerts
        case "/Oajtq8qODr" + "C4XBBOULF3A": self = .keyDeviceSupportsHeartRateVariability
        case "MjqwTHDneTC" + "NeqhZ7vCvUw": self = .keyDeviceSupportsHiResBuildings
        case "Mgwtle8wzQE" + "z/0vzBk47FQ": self = .keyDeviceSupportsLineIn
        case "XxnEk9uiIk5" + "vCdbWEGt7lA": self = .keyDeviceSupportsLiquidDetectionCorrosionMitigation
        case "pQzfsK0Ado+" + "nkNFgPRIA8Q": self = .keyDeviceSupportsLivePhotoAuto
        case "tBrEf4ccS4Q" + "6wtUiNB0WKw": self = .keyDeviceSupportsLongFormAudio
        case "5y8gwXr/HXk" + "hryza4xQeFg": self = .keyDeviceSupportsMapsBlurredUI
        case "nJU6/TSuJTV" + "JlJ7t5/Z/ug": self = .keyDeviceSupportsMapsOpticalHeading
        case "DtSpvgyOyNV" + "wNa5W0zigqg": self = .keyDeviceSupportsMomentCapture
        case "SBe5o/DMF5Z" + "94MS+ZzmBCA": self = .keyDeviceSupportsNFC
        case "ee9YfVjjsbV" + "te45bYSt4Wg": self = .keyDeviceSupportsNavigation
        case "nAl8QWlApaJ" + "QkipRf38fdg": self = .keyDeviceSupportsNewton
        case "ik8OQ5JoYhy" + "K8AoTx29MuA": self = .keyDeviceSupportsOnDemandPhotoAnalysis
        case "1eBwtCIwbID" + "dC80wiyzfow": self = .keyDeviceSupportsP3ColorspaceVideoRecording
        case "Leuy56dCZmA" + "MYoVCQGTfPA": self = .keyDeviceSupportsPeriodicALSUpdates
        case "m9ORTKMgu9A" + "+zF+A61Zz5A": self = .keyDeviceSupportsPhotosLocalLight
        case "L8CqbJeM+rf" + "7l7NSOjnAHg": self = .keyDeviceSupportsPortraitIntensityAdjustments
        case "hewg+QX1h57" + "eGJGphdCong": self = .keyDeviceSupportsPortraitLightEffectFilters
        case "hOkus/A6lBE" + "F6Ar3jV7LrQ": self = .keyDeviceSupportsRGB10
        case "4D8XW4YwJI7" + "QvyPhv1TEdw": self = .keyDeviceSupportsRaiseToSpeak
        case "q69vauqK9dj" + "nPlEZBFBV4A": self = .keyDeviceSupportsSiDP
        case "Bg8VW4HdQj+" + "GVY+191T3nQ": self = .keyDeviceSupportsSideButtonClickSpeed
        case "ChBMzkxYdT9" + "Xmw3QN5kMWA": self = .keyDeviceSupportsSimplisticRoadMesh
        case "FymLPtOEy6F" + "dE7TmKeoTdg": self = .keyDeviceSupportsSingleCameraPortrait
        case "WXi7NQbOKnE" + "X4vPQFeZAdQ": self = .keyDeviceSupportsSiriBargeIn
        case "PTQ+ABwag03" + "BwO/CKvIK/A": self = .keyDeviceSupportsSiriSpeaks
        case "0AJUv/uYPsR" + "iZNGpWJ7zfg": self = .keyDeviceSupportsSiriSpokenMessages
        case "SjQQ07G8Uac" + "M7E69G7dPbg": self = .keyDeviceSupportsSpatialOverCapture
        case "YlK+0xmxNWh" + "Nn/+r8SM8kA": self = .keyDeviceSupportsStereoAudioRecording
        case "oLjiDs+BWEd" + "MVbjE0x6cnw": self = .keyDeviceSupportsStudioLightPortraitPreview
        case "cRjPy4Ef+KZ" + "wJ+nfPeBV5Q": self = .keyDeviceSupportsSwimmingWorkouts
        case "yZf3GTRMGTu" + "wSV/lD7Cagw": self = .keyDeviceSupportsTapToWake
        case "YiUtBQygkHR" + "hLcdO3LFB4A": self = .keyDeviceSupportsTelephonyOverUSB
        case "xSh3mf5+Zuo" + "z6xhxEah0zQ": self = .keyDeviceSupportsTethering
        case "Lcu6Zck+C/+" + "AMO8qULacDw": self = .keyDeviceSupportsToneMapping
        case "BWoQXWXYITr" + "PRpFyc9xTLw": self = .keyDeviceSupportsUSBTypeC
        case "QuSuh/r6w4M" + "730U5XhKzrg": self = .keyDeviceSupportsVSHCompensation
        case "tbBVomzeDyP" + "q15QV5VGQGg": self = .keyDeviceSupportsVoiceOverCanUseSiriVoice
        case "sJmYs82RucA" + "1MWX5jHFSjA": self = .keyDeviceSupportsWebkit
        case "2zyzecwSf2Z" + "YRpB3tuQhOQ": self = .keyDeviceSupportsWirelessSplitting
        case "v2Q3tLoD4+o" + "/XazHC/0FyA": self = .keyDeviceSupportsYCbCr10
        case "SvI9oDkzw4X" + "JFd+dKen/2Q": self = .keyDeviceVariant
        case "IMLaTlxS7IT" + "twfbRfPYWuA": self = .keyDeviceVariantGuess
        case "67x5O+zO+Jw" + "nGgmKlq+qdA": self = .keyDiagData
        case "1uZbhSbBhsN" + "CsVSsopZ4qg": self = .keyDictationCapability
        case "Z/TJS0IaLyq" + "10dcSvUTGPg": self = .keyDieId
        case "uyejyEdaxNW" + "SRQQwHmXz1A": self = .keyDiskUsage
        case "yPqGUljqvtI" + "tkM6XMCZaQw": self = .keyDisplayDriverICChipID
        case "ueuuYQk48HG" + "Wm/cJlHq/Dw": self = .keyDisplayFCCLogosViaSoftwareCapability
        case "iFOX66Vmcij" + "ipO3YRc+AXg": self = .keyDisplayMirroringCapability
        case "vl45ziHlkqz" + "h1Yt6+M9vBA": self = .keyDisplayPortCapability
        case "jkr5aFPOh/d" + "6zTzNKYthBw": self = .keyDualSIMActivationPolicyCapable
        // ---------------------------------------------------------------------------------------------------
            
        // E -------------------------------------------------------------------------------------------------
        case "qWG594bTi87" + "edQCSYxlLeA": self = .keyEUICCChipID
        case "AQiIpW0UeYQ" + "Knhy2da7AXg": self = .keyEffectiveProductionStatusAp
        case "PNexcW/LBlP" + "gAm+Skp2EAg": self = .keyEffectiveProductionStatusSEP
        case "vENa/R1xAXL" + "obl8r3PBL6w": self = .keyEffectiveSecurityModeAp
        case "QJSuJ2zhdxY" + "X/7DUA2JtUw": self = .keyEffectiveSecurityModeSEP
        case "fqNtLlgbYfa" + "9gSNrhg7VGQ": self = .keyEncodeAACCapability
        case "i8+iwUtLtB5" + "jT+WNvqwrEA": self = .keyEncryptedDataPartitionCapability
        case "xJUG7IKySth" + "RrPcxII184g": self = .keyEnforceCameraShutterClick
        case "Js8HVdVGRs8" + "m5v94pMjkRw": self = .keyEnforceGoogleMail
        case "VG9TCKNqNLC" + "Hk0J6zTkuVQ": self = .keyEthernetMacAddress
        case "aOq/O8u9f/b" + "pWUnKco+xgA": self = .keyEthernetMacAddressData
        case "AthxlkPBk46" + "HtzM9AxK9vg": self = .keyExplicitContentRestriction
        case "NPzjaX07XnS" + "4KcMZ+l8ymA": self = .keyExternalChargeCapability
        case "na6PSBfq05l" + "kAfWkwAwaGg": self = .keyExternalPowerSourceConnected
        // ---------------------------------------------------------------------------------------------------
            
        // F -------------------------------------------------------------------------------------------------
        case "VHTcx7WQq0V" + "7YgGKZisRWA": self = .keyFDRSealingStatus
        case "Y2Y67z0Nq/X" + "dDXgW2EeaVg": self = .keyFMFAllowed
        case "JXmZWYUbLou" + "mvz7hu/GL0A": self = .keyFaceTimeBackCameraTemporalNoiseReductionMode
        case "Nhm02nvVOaQ" + "PimpOshlO1g": self = .keyFaceTimeBitRate2G
        case "1rf3rZXIZFg" + "znqrHlPehuQ": self = .keyFaceTimeBitRate3G
        case "xunfK8NYNCS" + "75N2z2buKWQ": self = .keyFaceTimeBitRateLTE
        case "h8xonkkn/Nz" + "DMvvCXLw8cQ": self = .keyFaceTimeBitRateWiFi
        case "J912s3mVzhR" + "eVtPv4HwqNQ": self = .keyFaceTimeCameraRequiresFastSwitchOptions
        case "Po0s2Vf6g2Z" + "qymKGNLFxeQ": self = .keyFaceTimeCameraSupportsHardwareFaceDetection
        case "yl8qmYPdAhF" + "LeDBho10sdQ": self = .keyFaceTimeDecodings
        case "BoNz1QXiAEU" + "gic9RdMVLIg": self = .keyFaceTimeEncodings
        case "CK3I7fFGkge" + "qzKEhGew9rQ": self = .keyFaceTimeFrontCameraTemporalNoiseReductionMode
        case "4RgFi8v1sfu" + "hCZhRdQkxxQ": self = .keyFaceTimePhotosOptIn
        case "APeknA55ZAc" + "u0FcufqVN4Q": self = .keyFaceTimePreferredDecoding
        case "ct5Dh6u0D6W" + "DJKg2PrMFVQ": self = .keyFaceTimePreferredEncoding
        case "VLfT+eziZYK" + "NjRASM6ntnQ": self = .keyFirmwareNonce
        case "qOwiNS0eFEq" + "9oi3MNsgxWg": self = .keyFirmwarePreflightInfo
        case "LeSRsiLoJCM" + "hjn6nd6GWbQ": self = .keyFirmwareVersion
        case "NUYAz1eq3Fl" + "zt7ZQxXC/ng": self = .keyFirstPartyLaunchTimeLimitScale
        case "H97G3GzDYb4" + "wY5kwJ0AKfQ": self = .keyForwardCameraCapability
        case "uksZ8eaKeV5" + "sUpLNBPafww": self = .keyFrontCameraOffsetFromDisplayCenter
        case "g5LBi+DCiP5" + "+jUnWVL7Y9w": self = .keyFrontCameraRotationFromDisplayNormal
        case "fv8ZXM/NhUH" + "QBQqCSk19cA": self = .keyFrontFacingCameraAutoHDRCapability
        case "Ty5/C8UDfdj" + "cdR853kulmA": self = .keyFrontFacingCameraBurstCapability
        case "7W2eNk/f6ue" + "wC8N58mlRrQ": self = .keyFrontFacingCameraCapability
        case "HnHX0gXt8Rv" + "hMQzIVMM7hw": self = .keyFrontFacingCameraHDRCapability
        case "1gsBzuZsXu2" + "rXZJBE01M0w": self = .keyFrontFacingCameraHDROnCapability
        case "mL1lk3ZVGDF" + "UQhxU9YLW6Q": self = .keyFrontFacingCameraHFRCapability
        case "TqAfAH10AND" + "giG7V2u8BkQ": self = .keyFrontFacingCameraHFRVideoCapture1080pMaxFPS
        case "ZeGw3VKUymU" + "Abp4noKsxoQ": self = .keyFrontFacingCameraHFRVideoCapture720pMaxFPS
        case "qlcdNkarcGL" + "cbW3HvBhwaA": self = .keyFrontFacingCameraMaxVideoZoomFactor
        case "VHTcx7WQq0V" + "7YgGKZisRWA": self = .keyFrontFacingCameraModuleSerialNumber
        case "TDM8SEI14n2" + "KE9PGHO0a4A": self = .keyFrontFacingCameraStillDurationForBurst
        case "3yzXj0lJhQi" + "+r3kgQlwiOg": self = .keyFrontFacingCameraVideoCapture1080pMaxFPS
        case "cux58RcuSiB" + "hpxWnT3pE4A": self = .keyFrontFacingCameraVideoCapture4kMaxFPS
        case "0AFeHRmliNJ" + "4pSlVb8ltZA": self = .keyFrontFacingCameraVideoCapture720pMaxFPS
        case "2kuITg6XPwX" + "l8zbpx+hoCw": self = .keyFrontFacingIRCameraModuleSerialNumber
        case "wH7fRq4TDdY" + "G2pN1KDQW/A": self = .keyFrontFacingIRStructuredLightProjectorModuleSerialNumber
        case "fW9C1U4C1FR" + "8bwe1VqEWug": self = .keyFull6FeaturesCapability
        // ---------------------------------------------------------------------------------------------------
            
        // G -------------------------------------------------------------------------------------------------
        case "jyEyRLza0L3" + "StNXgFUCoTw": self = .keyGPSCapability
        case "9s45ldrCC1W" + "F+7b6C4H2BA": self = .keyGSDeviceName
        case "guykxGaRwHd" + "enUK8fJRl8w": self = .keyGameKitCapability
        case "FOs+LbLUs+T" + "ajsEE4xkbrw": self = .keyGasGaugeBatteryCapability
        case "iyfxmLogGVI" + "aH7aEgqwcIA": self = .keyGreenTeaDeviceCapability
        case "4+qmMh9JBDh" + "72Nq6fD64RQ": self = .keyGyroscopeCapability
        // ---------------------------------------------------------------------------------------------------
            
        // H -------------------------------------------------------------------------------------------------
        case "SCNOHu+KqRX" + "0xhIlj5KXaA": self = .keyH264EncoderCapability
        case "fh6DnnDGDVZ" + "5kZ9nYn/GrQ": self = .keyHDRImageCaptureCapability
        case "6pjDdEw65TF" + "yL1FmIdszXw": self = .keyHDVideoCaptureCapability
        case "ZEU7pCEskBh" + "jQ4AOMuALDw": self = .keyHEVCDecoder10bitSupported
        case "sigsyX/a/Cp" + "MjoZnrgwIgg": self = .keyHEVCDecoder12bitSupported
        case "N8lZxRgC7lf" + "dRS3dRLn+Ag": self = .keyHEVCDecoder8bitSupported
        case "g/MkWm2Ac6+" + "TLNBgtBGxsg": self = .keyHEVCEncodingCapability
        case "": self = .keyHMERefreshRateInARKit
        case "/YYygAofPDb" + "hrwToVsXdeA": self = .keyHWModelStr
        case "/Pop5T2XQdD" + "A60MRyxQJdQ": self = .keyHallEffectSensorCapability
        case "m+FD6mX8VZz" + "P95hOhM+jow": self = .keyHardwareEncodeSnapshotsCapability
        case "/GK+yfRFY/b" + "5ZDIDpdVImg": self = .keyHardwareKeyboardCapability
        case "5pYKlGnYYBz" + "GvAlIU8RjEQ": self = .keyHardwarePlatform
        case "FDsm68UVR7l" + "3wErusGLgKg": self = .keyHardwareSnapshotsRequirePurpleGfxCapability
        case "QGmb9t2ZMFV" + "wOImO6fewgQ": self = .keyHasAllFeaturesCapability
        case "+N9mZUAHooN" + "vMiQnjeTJ8g": self = .keyHasAppleNeuralEngine
        case "AJFQheZDyUb" + "vI6RmBMT9Cg": self = .keyHasBaseband
        case "pX2TxZTxWKS" + "7QSXZDC/Z6A": self = .keyHasBattery
        case "3m1Q0AXlqeA" + "2C/LmqdTndQ": self = .keyHasDaliMode
        case "Aixt/MEN2O2" + "B7f+8m4TxUA": self = .keyHasExtendedColorDisplay
        case "v9YZN998zL0" + "OLA3q6SpPQA": self = .keyHasIcefall
        case "Oji6HRoPi7r" + "H7HPdWVakuw": self = .keyHasInternalSettingsBundle
        case "HV7WDiidgMf" + "7lwAu++Lk5w": self = .keyHasMesa
        case "fkWvcjYnYzG" + "RhVKiBoYzgA": self = .keyHasPKA
        case "7DfjbzhvH/G" + "Dkhio1dv8fA": self = .keyHasSEP
        case "OBqqs000I0S" + "R+EbJ7VO8UQ": self = .keyHasSpringBoard
        case "RA3I5nhSK65" + "i1ZxkRxQKfg": self = .keyHasThinBezel
        case "xDg5n/9rR2c" + "Mhp7MK0irBA": self = .keyHealthKitCapability
        case "SMgTCc2v9AU" + "2ziIHRX8qww": self = .keyHearingAidAudioEqualizationCapability
        case "RyXm3yMC4ej" + "lFvwlEI509w": self = .keyHearingAidLowEnergyAudioCapability
        case "u3c0R+31Df4" + "SUTHrICQkTg": self = .keyHearingAidPowerReductionCapability
        case "lSpe1QHIya0" + "aeNrjLTtaJA": self = .keyHiDPICapability
        case "f8peylp799C" + "Jta4Ev/vz8A": self = .keyHiccoughInterval
        case "cHla4KIe1wv" + "0OvpRVrzy/w": self = .keyHideNonDefaultApplicationsCapability
        case "ND6ZSbBBgMg" + "wtMfh+OL5Wg": self = .keyHighestSupportedVideoMode
        case "JwLB44/jEB8" + "aFDpXQ16Tuw": self = .keyHomeButtonType
        case "mVenV0u+B3S" + "hrqRddinaFQ": self = .keyHomeScreenWallpaperCapability
        // ---------------------------------------------------------------------------------------------------
            
        // I -------------------------------------------------------------------------------------------------
        case "": self = .keyIAP2Capability
        case "": self = .keyIDAMCapability
        case "": self = .keyIOSurfaceBackedImagesCapability
        case "": self = .keyIOSurfaceFormatDictionary
        case "": self = .keyIceFallID
        case "": self = .keyIcefallInRestrictedMode
        case "": self = .keyIcefallInfo
        case "": self = .keyImage4CryptoHashMethod
        case "": self = .keyImage4Supported
        case "": self = .keyInDiagnosticsMode
        case "": self = .keyIntegratedCircuitCardIdentifier
        case "": self = .keyIntegratedCircuitCardIdentifier2
        case "": self = .keyInternalBuild
        case "": self = .keyInternationalMobileEquipmentIdentity
        case "": self = .keyInternationalMobileEquipmentIdentity2
        case "": self = .keyInternationalSettingsCapability
        case "": self = .keyInverseDeviceID
        case "": self = .keyIsEmulatedDevice
        case "": self = .keyIsLargeFormatPhone
        case "": self = .keyIPadCapability
        case "": self = .keyIsPwrOpposedVol
        case "": self = .keyIsServicePart
        case "": self = .keyIsSimulator
        case "": self = .keyIsThereEnoughBatteryLevelForSoftwareUpdate
        case "": self = .keyIsUIBuild
        case "": self = .keyITunesFamilyID
        // ---------------------------------------------------------------------------------------------------
            
        // J -------------------------------------------------------------------------------------------------
        case "dJvRNnysMou" + "bdy0ZCK2aRQ": self = .keyJasperSerialNumber
        // ---------------------------------------------------------------------------------------------------
            
        // L -------------------------------------------------------------------------------------------------
        case "": self = .keyLTEDeviceCapability
        case "": self = .keyLaunchTimeLimitScaleSupported
        case "": self = .keyLisaCapability
        case "": self = .keyLoadThumbnailsWhileScrollingCapability
        case "": self = .keyLocalizedDeviceNameString
        case "": self = .keyLocationRemindersCapability
        case "": self = .keyLocationServicesCapability
        case "": self = .keyLowPowerWalletMode
        case "": self = .keyLunaFlexSerialNumber
        case "": self = .keyLynxPublicKey
        case "": self = .keyLynxSerialNumber
        // ---------------------------------------------------------------------------------------------------
            
        // M -------------------------------------------------------------------------------------------------
        case "": self = .keyMLBSerialNumber
        case "": self = .keyMMSCapability
        case "": self = .keyMacBridgingKeys
        case "": self = .keyMagnetometerCapability
        case "": self = .keyMainDisplayRotation
        case "": self = .keyMainScreenCanvasSizes
        case "": self = .keyMainScreenClass
        case "": self = .keyMainScreenHeight
        case "": self = .keyMainScreenOrientation
        case "": self = .keyMainScreenPitch
        case "": self = .keyMainScreenScale
        case "": self = .keyMainScreenStaticInfo
        case "": self = .keyMainScreenWidth
        case "": self = .keyMarketingNameString
        case "": self = .keyMarketingProductName
        case "": self = .keyMarketingVersion
        case "": self = .keyMaxH264PlaybackLevel
        case "": self = .keyMaximumScreenScale
        case "": self = .keyMedusaFloatingLiveAppCapability
        case "": self = .keyMedusaOverlayAppCapability
        case "": self = .keyMedusaPIPCapability
        case "": self = .keyMedusaPinnedAppCapability
        case "": self = .keyMesaSerialNumber
        case "": self = .keyMetalCapability
        case "": self = .keyMicrophoneCapability
        case "": self = .keyMicrophoneCount
        case "": self = .keyMinimumSupportediTunesVersion
        case "": self = .keyMixAndMatchPrevention
        case "": self = .keyMobileDeviceMinimumVersion
        case "": self = .keyMobileEquipmentIdentifier
        case "": self = .keyMobileEquipmentInfoBaseId
        case "": self = .keyMobileEquipmentInfoBaseProfile
        case "": self = .keyMobileEquipmentInfoBaseVersion
        case "": self = .keyMobileEquipmentInfoCSN
        case "": self = .keyMobileEquipmentInfoDisplayCSN
        case "": self = .keyMobileSubscriberCountryCode
        case "": self = .keyMobileSubscriberNetworkCode
        case "": self = .keyMobileWifi
        case "": self = .keyModelNumber
        case "": self = .keyMonarchLowEndHardware
        case "": self = .keyMultiLynxPublicKeyArray
        case "": self = .keyMultiLynxSerialNumberArray
        case "": self = .keyMultitaskingCapability
        case "": self = .keyMultitaskingGesturesCapability
        case "": self = .keyMusicStoreCapability
        // ---------------------------------------------------------------------------------------------------
            
        // N -------------------------------------------------------------------------------------------------
        case "": self = .keyN78aHack
        case "": self = .keyNFCRadio
        case "": self = .keyNFCRadioCalibrationDataPresent
        case "": self = .keyNFCUniqueChipID
        case "": self = .keyNVRAMDictionary
        case "": self = .keyNandControllerUID
        case "": self = .keyNavajoFusingState
        case "": self = .keyNikeIpodCapability
        case "": self = .keyNotGreenTeaDeviceCapability
        // ---------------------------------------------------------------------------------------------------
            
        // O -------------------------------------------------------------------------------------------------
        case "": self = .keyOLEDDisplay
        case "": self = .keyOTAActivationCapability
        case "": self = .keyOfflineDictationCapability
        case "": self = .keyOpenGLES1Capability
        case "": self = .keyOpenGLES2Capability
        case "": self = .keyOpenGLES3Capability
        case "": self = .keyOpenGLESVersion
        // ---------------------------------------------------------------------------------------------------
            
        // P -------------------------------------------------------------------------------------------------
        case "": self = .keyPTPLargeFilesCapability
        case "": self = .keyPanelSerialNumber
        case "": self = .keyPanoramaCameraCapability
        case "": self = .keyPartitionType
        case "": self = .keyPasswordConfigured
        case "": self = .keyPasswordProtected
        case "": self = .keyPearlCameraCapability
        case "": self = .keyPearlIDCapability
        case "": self = .keyPeekUICapability
        case "": self = .keyPeekUIWidth
        case "": self = .keyPeer2PeerCapability
        case "": self = .keyPersonalHotspotCapability
        case "": self = .keyPhoneNumber
        case "": self = .keyPhoneNumber2
        case "": self = .keyPhosphorusCapability
        case "": self = .keyPhotoAdjustmentsCapability
        case "": self = .keyPhotoCapability
        case "": self = .keyPhotoSharingCapability
        case "": self = .keyPhotoStreamCapability
        case "": self = .keyPhotosPostEffectsCapability
        case "": self = .keyPiezoClickerCapability
        case "": self = .keyPintoMacAddress
        case "": self = .keyPintoMacAddressData
        case "": self = .keyPipelinedStillImageProcessingCapability
        case "": self = .keyPlatformStandAloneContactsCapability
        case "": self = .keyPlatinumCapability
        case "": self = .keyProductHash
        case "": self = .keyProductName
        case "": self = .keyProductType
        case "": self = .keyProductVersion
        case "": self = .keyProximitySensorCalibration
        case "": self = .keyProximitySensorCalibrationDictionary
        case "": self = .keyProximitySensorCapability
        // ---------------------------------------------------------------------------------------------------
            
        // R -------------------------------------------------------------------------------------------------
        case "": self = .keyRFExposureSeparationDistance
        case "": self = .keyRawPanelSerialNumber
        case "": self = .keyRearCameraCapability
        case "": self = .keyRearCameraOffsetFromDisplayCenter
        case "": self = .keyRearFacingCamera60fpsVideoCaptureCapability
        case "": self = .keyRearFacingCameraAutoHDRCapability
        case "": self = .keyRearFacingCameraBurstCapability
        case "": self = .keyRearFacingCameraCapability
        case "": self = .keyRearFacingCameraHDRCapability
        case "": self = .keyRearFacingCameraHDROnCapability
        case "": self = .keyRearFacingCameraHFRCapability
        case "": self = .keyRearFacingCameraHFRVideoCapture1080pMaxFPS
        case "": self = .keyRearFacingCameraHFRVideoCapture720pMaxFPS
        case "": self = .keyRearFacingCameraMaxVideoZoomFactor
        case "": self = .keyRearFacingCameraModuleSerialNumber
        case "": self = .keyRearFacingCameraStillDurationForBurst
        case "": self = .keyRearFacingCameraSuperWideCameraCapability
        case "": self = .keyRearFacingCameraTimeOfFlightCameraCapability
        case "": self = .keyRearFacingCameraVideoCapture1080pMaxFPS
        case "": self = .keyRearFacingCameraVideoCapture4kMaxFPS
        case "": self = .keyRearFacingCameraVideoCapture720pMaxFPS
        case "": self = .keyRearFacingCameraVideoCaptureFPS
        case "": self = .keyRearFacingLowLightCameraCapability
        case "": self = .keyRearFacingSuperWideCameraModuleSerialNumber
        case "": self = .keyRearFacingTelephotoCameraCapability
        case "": self = .keyRearFacingTelephotoCameraModuleSerialNumber
        case "": self = .keyRecoveryOSVersion
        case "": self = .keyRegionCode
        case "": self = .keyRegionInfo
        case "": self = .keyRegionSupportsCinnamon
        case "": self = .keyRegionalBehaviorAll
        case "": self = .keyRegionalBehaviorChinaBrick
        case "": self = .keyRegionalBehaviorEUVolumeLimit
        case "": self = .keyRegionalBehaviorGB18030
        case "": self = .keyRegionalBehaviorGoogleMail
        case "": self = .keyRegionalBehaviorNTSC
        case "": self = .keyRegionalBehaviorNoPasscodeLocationTiles
        case "": self = .keyRegionalBehaviorNoVOIP
        case "": self = .keyRegionalBehaviorNoWiFi
        case "": self = .keyRegionalBehaviorShutterClick
        case "": self = .keyRegionalBehaviorValid
        case "": self = .keyRegionalBehaviorVolumeLimit
        case "": self = .keyRegulatoryModelNumber
        case "": self = .keyReleaseType
        case "": self = .keyRemoteBluetoothAddress
        case "": self = .keyRemoteBluetoothAddressData
        case "": self = .keyRenderWideGamutImagesAtDisplayTime
        case "": self = .keyRendersLetterPressSlowly
        case "": self = .keyRequiredBatteryLevelForSoftwareUpdate
        case "": self = .keyRestoreOSBuild
        case "": self = .keyRestrictedCountryCodes
        case "": self = .keyRingerSwitchCapability
        case "": self = .keyRosalineSerialNumber
        case "": self = .keyRoswellChipID
        case "": self = .keyRotateToWakeStatus
        // ---------------------------------------------------------------------------------------------------
            
        // S -------------------------------------------------------------------------------------------------
        case "": self = .keySBAllowSensitiveUI
        case "": self = .keySBCanForceDebuggingInfo
        case "": self = .keySDIOManufacturerTuple
        case "": self = .keySDIOProductInfo
        case "": self = .keySEInfo
        case "": self = .keySEPNonce
        case "": self = .keySIMCapability
        case "": self = .keySIMPhonebookCapability
        case "": self = .keySIMStatus
        case "": self = .keySIMStatus2
        case "": self = .keySIMTrayStatus
        case "": self = .keySIMTrayStatus2
        case "": self = .keySMSCapability
        case "": self = .keySavageChipID
        case "": self = .keySavageInfo
        case "": self = .keySavageSerialNumber
        case "": self = .keySavageUID
        case "": self = .keyScreenDimensionsCapability
        case "": self = .keyScreenRecorderCapability
        case "": self = .keyScreenSerialNumber
        case "": self = .keySecondaryBluetoothMacAddress
        case "": self = .keySecondaryBluetoothMacAddressData
        case "": self = .keySecondaryEthernetMacAddress
        case "": self = .keySecondaryEthernetMacAddressData
        case "": self = .keySecondaryWifiMacAddress
        case "": self = .keySecondaryWifiMacAddressData
        case "": self = .keySecureElement
        case "": self = .keySecureElementID
        case "": self = .keySecurityDomain
        case "": self = .keySensitiveUICapability
        case "": self = .keySerialNumber
        case "": self = .keyShoeboxCapability
        case "": self = .keyShouldHactivate
        case "": self = .keySiKACapability
        case "": self = .keySigningFuse
        case "": self = .keySiliconBringupBoard
        case "": self = .keySimultaneousCallAndDataCurrentlySupported
        case "": self = .keySimultaneousCallAndDataSupported
        case "": self = .keySiriGestureCapability
        case "": self = .keySiriOfflineCapability
        case "": self = .keySkey
        case "": self = .keySoftwareBehavior
        case "": self = .keySoftwareBundleVersion
        case "": self = .keySoftwareDimmingAlpha
        case "": self = .keySpeakerCalibrationMiGa
        case "": self = .keySpeakerCalibrationSpGa
        case "": self = .keySpeakerCalibrationSpTS
        case "": self = .keySphereCapability
        case "": self = .keyStarkCapability
        case "": self = .keyStockholmJcopInfo
        case "": self = .keyStrictWakeKeyboardCases
        case "": self = .keySupportedDeviceFamilies
        case "": self = .keySupportedKeyboards
        case "": self = .keySupportsBurninMitigation
        case "": self = .keySupportsEDUMU
        case "": self = .keySupportsForceTouch
        case "": self = .keySupportsIrisCapture
        case "": self = .keySupportsLowPowerMode
        case "": self = .keySupportsPerseus
        case "": self = .keySupportsRotateToWake
        case "": self = .keySupportsSOS
        case "": self = .keySupportsSSHBButtonType
        case "": self = .keySupportsTouchRemote
        case "": self = .keySysCfg
        case "": self = .keySysCfgDict
        case "": self = .keySystemImageID
        case "": self = .keySystemTelephonyOfAnyKindCapability
        // ---------------------------------------------------------------------------------------------------
            
        // T -------------------------------------------------------------------------------------------------
        case "": self = .keyTVOutCrossfadeCapability
        case "": self = .keyTVOutSettingsCapability
        case "": self = .keyTelephonyCapability
        case "": self = .keyTelephonyMaximumGeneration
        case "": self = .keyTimeSyncCapability
        case "": self = .keyTopModuleAuthChipID
        case "": self = .keyTouchDelivery120Hz
        case "": self = .keyTouchIDCapability
        case "": self = .keyTristarID
        // ---------------------------------------------------------------------------------------------------
            
        // U -------------------------------------------------------------------------------------------------
        case "": self = .keyUIBackgroundQuality
        case "": self = .keyUIParallaxCapability
        case "": self = .keyUIProceduralWallpaperCapability
        case "": self = .keyUIReachability
        case "": self = .keyUMTSDeviceCapability
        case "": self = .keyUnifiedIPodCapability
        case "": self = .keyUniqueChipID
        case "": self = .keyUniqueDeviceID
        case "": self = .keyUniqueDeviceIDData
        case "": self = .keyUserAssignedDeviceName
        case "": self = .keyUserIntentPhysicalButtonCGRect
        case "": self = .keyUserIntentPhysicalButtonCGRectString
        case "": self = .keyUserIntentPhysicalButtonNormalizedCGRect
        // ---------------------------------------------------------------------------------------------------
            
        // V -------------------------------------------------------------------------------------------------
        case "": self = .keyVOIPCapability
        case "": self = .keyVeniceCapability
        case "": self = .keyVibratorCapability
        case "": self = .keyVideoCameraCapability
        case "": self = .keyVideoStillsCapability
        case "": self = .keyVoiceControlCapability
        case "": self = .keyVolumeButtonCapability
        // ---------------------------------------------------------------------------------------------------
            
        // W -------------------------------------------------------------------------------------------------
        case "": self = .keyWAGraphicQuality
        case "": self = .keyWAPICapability
        case "": self = .keyWLANBkgScanCache
        case "": self = .keyWSKU
        case "": self = .keyWatchCompanionCapability
        case "": self = .keyWatchSupportsAutoPlaylistPlayback
        case "": self = .keyWatchSupportsHighQualityClockFaceGraphics
        case "": self = .keyWatchSupportsListeningOnGesture
        case "": self = .keyWatchSupportsMusicStreaming
        case "": self = .keyWatchSupportsSiriCommute
        case "": self = .keyWiFiCallingCapability
        case "": self = .keyWiFiCapability
        case "": self = .keyWifiAddress
        case "": self = .keyWifiAddressData
        case "": self = .keyWifiAntennaSKUVersion
        case "": self = .keyWifiCallingSecondaryDeviceCapability
        case "": self = .keyWifiChipset
        case "": self = .keyWifiFirmwareVersion
        case "": self = .keyWifiVendor
        case "": self = .keyWirelessBoardSnum
        case "": self = .keyWirelessChargingCapability
        // ---------------------------------------------------------------------------------------------------
            
        // Y -------------------------------------------------------------------------------------------------
        case "": self = .keyYonkersChipID
        case "": self = .keyYonkersSerialNumber
        case "": self = .keyYonkersUID
        case "": self = .keyYouTubeCapability
        case "": self = .keyYouTubePluginCapability
        // ---------------------------------------------------------------------------------------------------
            
        // Unknown -------------------------------------------------------------------------------------------
        default:                            self = .unknown(trimmedRawValue)
        // ---------------------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }

    // MARK: - rawValue

    var rawValue: String {
        switch self {
        // swiftformat:disable all
        // 3 -------------------------------------------------------------------------------------------------
        case .key3GProximityCapability:                                   return "NXJOYK7VhNn" + "7ugbF2kx0zg"
        case .key3GVeniceCapability:                                      return "DGBWzPMdVuq" + "PxgH7iSz3SA"
        // ---------------------------------------------------------------------------------------------------
            
        // 7 -------------------------------------------------------------------------------------------------
        case .key720pPlaybackCapability:                                  return "Lg1EJX11Jb7" + "EbveB6+YgVQ"
        // ---------------------------------------------------------------------------------------------------
            
        // A -------------------------------------------------------------------------------------------------
        case .keyAPNCapability:                                           return "spGVujDEmyC" + "zDznXozB3oA"
        case .keyARM64ExecutionCapability:                                return "kKgJsWN/rBU" + "AkimOtm/wbA"
        case .keyARMV6ExecutionCapability:                                return "g+9NpjmSVwt" + "omd8nyNJimg"
        case .keyARMV7ExecutionCapability:                                return "DWrhyh1BwYy" + "pYmW5q78Wuw"
        case .keyARMV7SExecutionCapability:                               return "RYO2N0gqp5h" + "HCik2TEiSVA"
        case .keyAWDID:                                                   return "MWduuAGptrl" + "7qIzWqBmOqQ"
        case .keyAWDLCapability:                                          return "XI87Zkcr5j1" + "B/p2dom/B6A"
        case .keyAccelerometerCapability:                                 return "39ZkJVEsL4p" + "mCXbg+89QmQ"
        case .keyAccessibilityCapability:                                 return "16N2bLOzcgJ" + "EsZToEX21Zg"
        case .keyAcousticID:                                              return "XWAyufZ2Src" + "lH9F9EDmBKw"
        case .keyActivationProtocol:                                      return "zP3kBA1Biwz" + "2d6PTIIbmUQ"
        case .keyActiveWirelessTechnology:                                return "Eavu9TP+iZ0" + "Lzlk7FU6w6Q"
        case .keyActuatorResonantFrequency:                               return "hhRNi2d3z2W" + "EFmU+xG/EXw"
        case .keyAdditionalTextTonesCapability:                           return "6k70IxahfOQ" + "TZbGwu++QwA"
        case .keyAggregateDevicePhotoZoomFactor:                          return "JLP/Iinyzet" + "EPztvoNUNKg"
        case .keyAggregateDeviceVideoZoomFactor:                          return "IweaHIDpz+r" + "knAcb3+xg9g"
        case .keyAirDropCapability:                                       return "IBqcPacFMPI" + "X8HMWob444A"
        case .keyAirDropRestriction:                                      return "/bSMNaIuUT5" + "8N/BN1nYUjw"
        case .keyAirplaneMode:                                            return "l/n0Z7pMB8k" + "0GyTKz3v3Tw"
        case .keyAirplayMirroringCapability:                              return "MWJNrFKpHkB" + "Em8jAdJf1xw"
        case .keyAllow32BitApps:                                          return "ibhfX8FQ6b8" + "09N632Ey98g"
        case .keyAllowOnlyATVCPSDKApps:                                   return "Ex6ChutQnIx" + "5Zm6c5uwYuw"
        case .keyAllowYouTube:                                            return "7l0BaQsNxJC" + "anoeHMJ2huA"
        case .keyAllowYouTubePlugin:                                      return "MTa8c+pEdbK" + "0tHGXP06xOw"
        case .keyAmbientLightSensorCapability:                            return "lo3szoQ4sLy" + "7o3+ZD0GcAQ"
        case .keyAmbientLightSensorSerialNumber:                          return "UCLOC2TKe3v" + "RkId34ubKWw"
        case .keyApNonce:                                                 return "hykQtM0zkNe" + "2/IY69+3PPQ"
        case .keyApNonceRetrieve:                                         return "UcRWpMcvJDf" + "Lzn6utLj3XQ"
        case .keyAppCapacityTVOS:                                         return "kkSkHTEei96" + "N1ZehicOgoA"
        case .keyAppStoreCapability:                                      return "XEoV4os3FAU" + "L7yHDxWmSMw"
        case .keyAppleInternalInstallCapability:                          return "EqrsVvjcYDd" + "xHBiQmGhAWw"
        case .keyAppleNeuralEngineSubtype:                                return "eJGhnVvylF3" + "dMOHBKJzeiw"
        case .keyApplicationInstallationCapability:                       return "7yzVesPANxq" + "KQ+oqNPhTwg"
        case .keyArcModuleSerialNumber:                                   return "KzUQgIyBRin" + "kweVMNUCOWA"
        case .keyArrowChipID:                                             return "nhGhVMyvrWY" + "e9U2ltAUImg"
        case .keyArrowUniqueChipID:                                       return "CPiqZJJPocp" + "jc5C5qe1tiw"
        case .keyArtworkTraits:                                           return "oPeik/9e8lQ" + "WMszEjbPzng"
        case .keyAssistantCapability:                                     return "xOJfWykLmQC" + "c8lKlzMlrLA"
        case .keyAudioPlaybackCapability:                                 return "paR6NqTecAD" + "44x45kzV87g"
        case .keyAutoFocusCameraCapability:                               return "o0axLo6LGt8" + "HbuEWdLZ92Q"
        case .keyAvailableDisplayZoomSizes:                               return "ILaGO+KV5JA" + "Oq7Q5GEwbWQ"
        // ---------------------------------------------------------------------------------------------------
            
        // B -------------------------------------------------------------------------------------------------
        case .keyBacklightCapability:                                     return "1DQNgySZSIj" + "PqLWroIzfiQ"
        case .keyBasebandAPTimeSync:                                      return "HXTqT3UXOKu" + "TEklxz+wMAA"
        case .keyBasebandBoardSnum:                                       return "ToJGxfcjkIe" + "rYyeL2e8c4A"
        case .keyBasebandCertId:                                          return "Q5QHkCRPRmi" + "X3L/5xxKrRg"
        case .keyBasebandChipId:                                          return "eNgz35a7iZn" + "VeEMwsBQZew"
        case .keyBasebandChipset:                                         return "pB5sZVvnp+Q" + "jZQtt2KfQvA"
        case .keyBasebandClass:                                           return "XQBHOWjPt2P" + "+uNqlLm1P7A"
        case .keyBasebandFirmwareManifestData:                            return "FkD7K642S08" + "2lnfw/ohHzg"
        case .keyBasebandFirmwareUpdateInfo:                              return "Djv9tHz6MLd" + "TUDjnkq0obQ"
        case .keyBasebandFirmwareVersion:                                 return "PQzmRjKVMis" + "tuIVsqs6QXA"
        case .keyBasebandKeyHashInformation:                              return "H5HW20mJr/d" + "jc40tAehkww"
        case .keyBasebandPostponementStatus:                              return "vaiFeAcMTID" + "XMSxTr8JwCw"
        case .keyBasebandPostponementStatusBlob:                          return "YUobJKXH3+u" + "krUe13TXL3Q"
        case .keyBasebandRegionSKU:                                       return "91LyMcx4z1w" + "3SGVeqteMnA"
        case .keyBasebandRegionSKURadioTechnology:                        return "Z3gOHeppbL6" + "+rblIe8H5Ag"
        case .keyBasebandSecurityInfoBlob:                                return "EImfMz+bzJr" + "UkVQKyY6tEg"
        case .keyBasebandSerialNumber:                                    return "Nmhz54v5ZLq" + "j2I4NPFIFqQ"
        case .keyBasebandStatus:                                          return "CN64p1hw1JV" + "dTHCfBdgPLQ"
        case .keyBasebandUniqueId:                                        return "vIccod02kDx" + "ScKF5s2h6OA"
        case .keyBatteryCurrentCapacity:                                  return "f2DlVMUVcV+" + "MeWs/g2ku+g"
        case .keyBatteryIsCharging:                                       return "sLe8lqXRlqZ" + "M74MNUoVcyQ"
        case .keyBatteryIsFullyCharged:                                   return "jgE7MmmkZAG" + "0BiWVqD7bMQ"
        case .keyBatterySerialNumber:                                     return "DcQNvnO5Uhp" + "c1jjGIrzyng"
        case .keyBlueLightReductionSupported:                             return "F1Xz9g1JORi" + "bBS9DYPUPrg"
        case .keyBluetoothAddress:                                        return "k5lVWbXuiZH" + "LA17KGiVUAA"
        case .keyBluetoothAddressData:                                    return "jSDzacs4RYW" + "nWxn142UBLQ"
        case .keyBluetoothCapability:                                     return "XSLlJd/8sMy" + "XO0qtvvUTBQ"
        case .keyBluetoothLE2Capability:                                  return "q3JBrhzy5fy" + "J1+LAITPW0w"
        case .keyBluetoothLECapability:                                   return "8/HMvzDR3J6" + "m0aY3NYeqcg"
        case .keyBoardId:                                                 return "0uthiXrHZ21" + "2KvcJizKHEw"
        case .keyBoardRevision:                                           return "VqRhf8vgXr9" + "B+SYvpnX39g"
        case .keyBootManifestHash:                                        return "Qq9/Mya05P4" + "ToEr1pMpGGg"
        case .keyBootNonce:                                               return "1Rm/mWYEI5t" + "taC0dJ3sHBQ"
        case .keyBridgeBuild:                                             return "GxXmRWHjsY5" + "yAVhMfCH6Lg"
        case .keyBridgeRestoreVersion:                                    return "Glo+aTkt0Uw" + "31BghCxnsyQ"
        case .keyBuddyLanguagesAnimationRequiresOptimization:             return "z+5gEULGC7a" + "EYopBd4ggpA"
        case .keyBuildID:                                                 return "qwXfFvH5jPX" + "Pxrny0XuGtQ"
        case .keyBuildVersion:                                            return "mZfUC7qo4pU" + "RNhyMHZ62RQ"
        // ---------------------------------------------------------------------------------------------------
            
        // C -------------------------------------------------------------------------------------------------
        case .keyC2KDeviceCapability:                                     return "tdUWKiiM7Jd" + "ctnzQuvaVVA"
        case .keyCPUArchitecture:                                         return "k7QIBwZJJOV" + "w+Sej/8h8VA"
        case .keyCPUSubType:                                              return "AWEfP3xWh0q" + "1MjO3JAy/AA"
        case .keyCPUType:                                                 return "xZm4Ky2/qsw" + "yf7ykvlchYg"
        case .keyCallForwardingCapability:                                return "57eLnXynqDl" + "QaGEi+9JAtQ"
        case .keyCallWaitingCapability:                                   return "eXCYx/SHTZI" + "n5LInWvZByw"
        case .keyCallerIDCapability:                                      return "tad3RCjcWdk" + "yLSVI8kUBtA"
        case .keyCameraAppUIVersion:                                      return "NszbG6qiAzt" + "Val4mpDQRkg"
        case .keyCameraCapability:                                        return ""
        case .keyCameraFlashCapability:                                   return "jdLgKT+0BZm" + "Grzd9J0cuPA"
        case .keyCameraFrontFlashCapability:                              return "fJZs6N8SqTS" + "4RuQVh3szxA"
        case .keyCameraHDR2Capability:                                    return "cWWKdUn+rIc" + "lZ60ZGAVhBw"
        case .keyCameraHDRVersion:                                        return "+97cHA72jHl" + "HqQnIkgGBYg"
        case .keyCameraLiveEffectsCapability:                             return "03hWmMtMs+4" + "nzama4/PzHQ"
        case .keyCameraMaxBurstLength:                                    return "gBw7IWiBnLH" + "aA+lBrZBgWw"
        case .keyCameraRestriction:                                       return "2pxKjejpRGp" + "WvUE+3yp5mQ"
        case .keyCarrierBundleInfoArray:                                  return "475wW3fne+t" + "yzGr4wleUSQ"
        case .keyCarrierInstallCapability:                                return "9n2qz3uDC5n" + "Se1xZG1/Bkw"
        case .keyCellBroadcastCapability:                                 return "CN/XFuy/9Fd" + "v0yE+28kwRQ"
        case .keyCellularDataCapability:                                  return "L5al7b+7JAT" + "D/izSJeH0aQ"
        case .keyCellularTelephonyCapability:                             return "ebyBs0j3KAq" + "uBsgcfrNZIg"
        case .keyCertificateProductionStatus:                             return "uO3aPe7lfB1" + "XxSiz/1xBvA"
        case .keyCertificateSecurityMode:                                 return "eg8KDO//lXa" + "Lwp+URGP6DA"
        case .keyChipID:                                                  return "566JrJVMlDf" + "nslGpwUzNlQ"
        case .keyCloudPhotoLibraryCapability:                             return "8OTc3mN30AC" + "aEwecgpKfXA"
        case .keyCoastlineGlowRenderingCapability:                        return "diS7AlmwFZz" + "6NyF7CY97sA"
        case .keyCompassCalibration:                                      return "qb//mYg6KeT" + "mjv8w4ZAMIg"
        case .keyCompassCalibrationDictionary:                            return "aoAKcHLuTUp" + "/o3squcJkhA"
        case .keyCompassType:                                             return "meLhyIpGgxi" + "QoFZD/OGPcQ"
        case .keyComputerName:                                            return "v5YVEwERRin" + "1v+reUNjJ5w"
        case .keyConferenceCallType:                                      return "ol92SaBpqIv" + "Qs+KBljuwGA"
        case .keyConfigNumber:                                            return "SmUPjD77AHI" + "MCLny9nawdw"
        case .keyContainsCellularRadioCapability:                         return "yRZv0s7Dpj8" + "ZBk0S+0+nMA"
        case .keyContinuityCapability:                                    return "y0jtYciPmcx" + "3ywPM582WZw"
        case .keyCoreRoutineCapability:                                   return "g7vU4YF+9Z+" + "wkSvw/Cm8Dg"
        case .keyCoverglassSerialNumber:                                  return "OWi11Urd09r" + "DmPVy1z5dOQ"
        // ---------------------------------------------------------------------------------------------------
            
        // D -------------------------------------------------------------------------------------------------
        case .keyDMin:                                                    return "ZEF0po63sTg" + "pVrc9Ce7YNQ"
        case .keyDataPlanCapability:                                      return "KGlZoljMyZQ" + "SxfhROj0IFg"
        case .keyDebugBoardRevision:                                      return "DrSqlXYNVfY" + "XCvAsuUrUDA"
        case .keyDelaySleepForHeadsetClickCapability:                     return "Mh+drGtyBfL" + "YKN02sROzxg"
        case .keyDesenseBuild:                                            return "OWLyWlUOIkl" + "+eQB7Iq37xQ"
        case .keyDeviceAlwaysPrewarmActuator:                             return "M+WPVivF4iT" + "nm1CC8c6h+A"
        case .keyDeviceBackGlassMaterial:                                 return "bUJD9zcOcit" + "JwFA0ieIkxA"
        case .keyDeviceBackingColor:                                      return "CJcvxERO5v/" + "3IWjDFKZKRw"
        case .keyDeviceBrand:                                             return "fuKL2rMywRg" + "QF1wowOA/cg"
        case .keyDeviceClass:                                             return "+3Uf0Pm5F8X" + "y7Onyvko0vA"
        case .keyDeviceClassNumber:                                       return "mtrAoWJ3gsq" + "+I90ZnQ0vQw"
        case .keyDeviceColor:                                             return "mumHZHMLEfA" + "uTkkd28fHlQ"
        case .keyDeviceColorMapPolicy:                                    return "87sSAh2rboM" + "I2TDvFBimkg"
        case .keyDeviceCornerRadius:                                      return "y5dppxx/Lzx" + "oNuW+iIKR3g"
        case .keyDeviceCoverGlassColor:                                   return "9N7qIucqhr0" + "Cy2/Tk27/hw"
        case .keyDeviceCoverGlassMaterial:                                return "gnQwi8RnEeM" + "G9qBe3IUKrg"
        case .keyDeviceCoverMaterial:                                     return "iaegRQa4jNG" + "OuTA6hnZmcQ"
        case .keyDeviceEnclosureColor:                                    return "JhEU414EIaD" + "vAz8ki5DSqw"
        case .keyDeviceEnclosureMaterial:                                 return "AtmPEO/j+Pd" + "r8+WKxv4Aaw"
        case .keyDeviceEnclosureRGBColor:                                 return "TXZxlSojLMQ" + "yLqusm9aa/g"
        case .keyDeviceHasAggregateCamera:                                return "0/VAyl58TL5" + "U/mAQEJNRQw"
        case .keyDeviceHousingColor:                                      return "NJsxTSI2WuD" + "+13rxShXX9w"
        case .keyDeviceIsMuseCapable:                                     return "VGDDUFPWHbX" + "/Ie9RSI0yDQ"
        case .keyDeviceKeyboardCalibration:                               return "DrrXMX9VWX7" + "bMj0MZuhTUA"
        case .keyDeviceLaunchTimeLimitScale:                              return "emXA9B552rn" + "SoI7xXE91DA"
        case .keyDeviceName:                                              return "rkqlwPcRHwi" + "xY4gapPjanw"
        case .keyDeviceNameString:                                        return ""
        case .keyDevicePrefers3DBuildingStrokes:                          return "xbNo7dj2oAn" + "z92JhEOn9tw"
        case .keyDevicePrefersBuildingStrokes:                            return "QFnvO2shAYI" + "+d4bj3qXuFQ"
        case .keyDevicePrefersCheapTrafficShaders:                        return "7D54DikSnFQ" + "nbDEBwlKQTQ"
        case .keyDevicePrefersProceduralAntiAliasing:                     return "bysMryc4yLw" + "QjKvUQGGXXQ"
        case .keyDevicePrefersTrafficAlpha:                               return "0VkTunHOJrr" + "ZdolQXR5gCg"
        case .keyDeviceProximityCapability:                               return "9RryeqF6OCW" + "lbaXP2Qsoag"
        case .keyDeviceRGBColor:                                          return "8/tysfSvORo" + "yVg9IE901oQ"
        case .keyDeviceRequiresPetalOptimization:                         return "82Ono2SP03r" + "NGkhOc5O1Mw"
        case .keyDeviceRequiresProximityAmeliorations:                    return "r5QUsvvgcb2" + "Qmuflua13fQ"
        case .keyDeviceRequiresSoftwareBrightnessCalculations:            return "2Qf/8sQyx6v" + "oo3Mw3QKgZQ"
        case .keyDeviceSceneUpdateTimeLimitScale:                         return "QbQzuIbef01" + "P4JeoL9EmKg"
        case .keyDeviceSubBrand:                                          return "wtUF1NceYeL" + "T6IHovZvocw"
        case .keyDeviceSupports1080p:                                     return "Mk4ZslaChmO" + "+6s3h7L1w6Q"
        case .keyDeviceSupports3DImagery:                                 return "ohnQBWkVQf2" + "nu9Vr/9uLug"
        case .keyDeviceSupports3DMaps:                                    return "HIaq6xVZ/V8" + "B9pnigcvqCA"
        case .keyDeviceSupports3rdPartyHaptics:                           return ""
        case .keyDeviceSupports4G:                                        return "eu8pUYR7yo+" + "AlS9aojlgwg"
        case .keyDeviceSupports4k:                                        return "Fh2Ga0/Sj4T" + "3Qn5Z9A9BMw"
        case .keyDeviceSupports64Bit:                                     return "V2Ykm/0M3CA" + "6nyNhwNInsg"
        case .keyDeviceSupports720p:                                      return "lwHRTZNO5Jq" + "87pVlzdNGIA"
        case .keyDeviceSupports9Pin:                                      return "qWGVjnlN/wW" + "MhlWgfNcSBg"
        case .keyDeviceSupportsAOP:                                       return "HHF6YgqEQ9K" + "d7MBSVnLsgg"
        case .keyDeviceSupportsARKit:                                     return "67A3BpQkCRe" + "1ihx0Me4lgg"
        case .keyDeviceSupportsASTC:                                      return "ji56BO1mUeT" + "7Qg9RO7Er9w"
        case .keyDeviceSupportsAdaptiveMapsUI:                            return "whbsdxpLirB" + "FgUbLH3+0JA"
        case .keyDeviceSupportsAlwaysListening:                           return "U+73bmG4kBG" + "j6kpreQXUTQ"
        case .keyDeviceSupportsAlwaysOnCompass:                           return "aCQx2Qq/TCh" + "nNAq1rr6Egw"
        case .keyDeviceSupportsAlwaysOnTime:                              return "j8/Omm6s1ls" + "mTDFsXjsBfA"
        case .keyDeviceSupportsApplePencil:                               return "yhHcB0iH0d1" + "XzPO/CFd3ow"
        case .keyDeviceSupportsAutoLowLightVideo:                         return "AX/UKxSHwm+" + "OuFRIdvNAfg"
        case .keyDeviceSupportsAvatars:                                   return "y4GIxpQP4MO" + "/j3wWUJdiyg"
        case .keyDeviceSupportsBatteryModuleAuthentication:               return "D6/BMDrlb8V" + "3WSiqL8gL+w"
        case .keyDeviceSupportsBerkelium2:                                return "wNdWl5xfBJm" + "JGNWJr5t0zA"
        case .keyDeviceSupportsCCK:                                       return "L47fh6KehOm" + "R+AseqK2Xsw"
        case .keyDeviceSupportsCameraCaptureOnTouchDown:                  return "gQDt76Te0SP" + "w7N8oTLrBFw"
        case .keyDeviceSupportsCameraDeferredProcessing:                  return "E9a3UzlfYjW" + "EB9viQCHNAA"
        case .keyDeviceSupportsCameraHaptics:                             return "XriAxQ+JY1z" + "5nt5f3ftXVw"
        case .keyDeviceSupportsCarIntegration:                            return "XFtUsQP3Ayq" + "T4CazSb5VCw"
        case .keyDeviceSupportsCinnamon:                                  return "j1pdCAYnpIE" + "YMqIAitm3JA"
        case .keyDeviceSupportsClosedLoopHaptics:                         return "gqDnklGQnpv" + "5ilgh5uHckw"
        case .keyDeviceSupportsCrudeProx:                                 return "a/mex6YNO6g" + "J8N8SxAA71A"
        case .keyDeviceSupportsDClr:                                      return "XkfGVYlrkBQ" + "JgaGabHESJQ"
        case .keyDeviceSupportsDoNotDisturbWhileDriving:                  return "Kq9K9xqDoUi" + "UP7JEfg+pNw"
        case .keyDeviceSupportsELabel:                                    return "awim/yUQvLy" + "TrKsoKhg2bA"
        case .keyDeviceSupportsEnhancedAC3:                               return "kyszW/uUGJF" + "TVNQwFaf6og"
        case .keyDeviceSupportsEnvironmentalDosimetry:                    return "SaW+DA+cbiq" + "DHrex8MTABA"
        case .keyDeviceSupportsExternalHDR:                               return "feC7TgoAAKL" + "jn/KU8JAKFA"
        case .keyDeviceSupportsFloorCounting:                             return "nK4D+jDUuTG" + "FFwRFPC2lWg"
        case .keyDeviceSupportsHDRDeferredProcessing:                     return "JkZlE8z9YwH" + "jE1hnbMhcgA"
        case .keyDeviceSupportsHMEInARKit:                                return ""
        case .keyDeviceSupportsHaptics:                                   return "cBy4BcYs5YW" + "tFHbBpt4C6A"
        case .keyDeviceSupportsHardwareDetents:                           return "V9pLLbPQhyb" + "75bbdTioZVw"
        case .keyDeviceSupportsHeartHealthAlerts:                         return "H+r3Nk8ByXI" + "Y9ub/M8broA"
        case .keyDeviceSupportsHeartRateVariability:                      return "/Oajtq8qODr" + "C4XBBOULF3A"
        case .keyDeviceSupportsHiResBuildings:                            return "MjqwTHDneTC" + "NeqhZ7vCvUw"
        case .keyDeviceSupportsLineIn:                                    return "Mgwtle8wzQE" + "z/0vzBk47FQ"
        case .keyDeviceSupportsLiquidDetectionCorrosionMitigation:        return "XxnEk9uiIk5" + "vCdbWEGt7lA"
        case .keyDeviceSupportsLivePhotoAuto:                             return "pQzfsK0Ado+" + "nkNFgPRIA8Q"
        case .keyDeviceSupportsLongFormAudio:                             return "tBrEf4ccS4Q" + "6wtUiNB0WKw"
        case .keyDeviceSupportsMapsBlurredUI:                             return "5y8gwXr/HXk" + "hryza4xQeFg"
        case .keyDeviceSupportsMapsOpticalHeading:                        return "nJU6/TSuJTV" + "JlJ7t5/Z/ug"
        case .keyDeviceSupportsMomentCapture:                             return "DtSpvgyOyNV" + "wNa5W0zigqg"
        case .keyDeviceSupportsNFC:                                       return "SBe5o/DMF5Z" + "94MS+ZzmBCA"
        case .keyDeviceSupportsNavigation:                                return "ee9YfVjjsbV" + "te45bYSt4Wg"
        case .keyDeviceSupportsNewton:                                    return "nAl8QWlApaJ" + "QkipRf38fdg"
        case .keyDeviceSupportsOnDemandPhotoAnalysis:                     return "ik8OQ5JoYhy" + "K8AoTx29MuA"
        case .keyDeviceSupportsP3ColorspaceVideoRecording:                return "1eBwtCIwbID" + "dC80wiyzfow"
        case .keyDeviceSupportsPeriodicALSUpdates:                        return "Leuy56dCZmA" + "MYoVCQGTfPA"
        case .keyDeviceSupportsPhotosLocalLight:                          return "m9ORTKMgu9A" + "+zF+A61Zz5A"
        case .keyDeviceSupportsPortraitIntensityAdjustments:              return "L8CqbJeM+rf" + "7l7NSOjnAHg"
        case .keyDeviceSupportsPortraitLightEffectFilters:                return "hewg+QX1h57" + "eGJGphdCong"
        case .keyDeviceSupportsRGB10:                                     return "hOkus/A6lBE" + "F6Ar3jV7LrQ"
        case .keyDeviceSupportsRaiseToSpeak:                              return "4D8XW4YwJI7" + "QvyPhv1TEdw"
        case .keyDeviceSupportsSiDP:                                      return "q69vauqK9dj" + "nPlEZBFBV4A"
        case .keyDeviceSupportsSideButtonClickSpeed:                      return "Bg8VW4HdQj+" + "GVY+191T3nQ"
        case .keyDeviceSupportsSimplisticRoadMesh:                        return "ChBMzkxYdT9" + "Xmw3QN5kMWA"
        case .keyDeviceSupportsSingleCameraPortrait:                      return "FymLPtOEy6F" + "dE7TmKeoTdg"
        case .keyDeviceSupportsSiriBargeIn:                               return "WXi7NQbOKnE" + "X4vPQFeZAdQ"
        case .keyDeviceSupportsSiriSpeaks:                                return "PTQ+ABwag03" + "BwO/CKvIK/A"
        case .keyDeviceSupportsSiriSpokenMessages:                        return "0AJUv/uYPsR" + "iZNGpWJ7zfg"
        case .keyDeviceSupportsSpatialOverCapture:                        return "SjQQ07G8Uac" + "M7E69G7dPbg"
        case .keyDeviceSupportsStereoAudioRecording:                      return "YlK+0xmxNWh" + "Nn/+r8SM8kA"
        case .keyDeviceSupportsStudioLightPortraitPreview:                return "oLjiDs+BWEd" + "MVbjE0x6cnw"
        case .keyDeviceSupportsSwimmingWorkouts:                          return "cRjPy4Ef+KZ" + "wJ+nfPeBV5Q"
        case .keyDeviceSupportsTapToWake:                                 return "yZf3GTRMGTu" + "wSV/lD7Cagw"
        case .keyDeviceSupportsTelephonyOverUSB:                          return "YiUtBQygkHR" + "hLcdO3LFB4A"
        case .keyDeviceSupportsTethering:                                 return "xSh3mf5+Zuo" + "z6xhxEah0zQ"
        case .keyDeviceSupportsToneMapping:                               return "Lcu6Zck+C/+" + "AMO8qULacDw"
        case .keyDeviceSupportsUSBTypeC:                                  return "BWoQXWXYITr" + "PRpFyc9xTLw"
        case .keyDeviceSupportsVSHCompensation:                           return "QuSuh/r6w4M" + "730U5XhKzrg"
        case .keyDeviceSupportsVoiceOverCanUseSiriVoice:                  return "tbBVomzeDyP" + "q15QV5VGQGg"
        case .keyDeviceSupportsWebkit:                                    return "sJmYs82RucA" + "1MWX5jHFSjA"
        case .keyDeviceSupportsWirelessSplitting:                         return "2zyzecwSf2Z" + "YRpB3tuQhOQ"
        case .keyDeviceSupportsYCbCr10:                                   return "v2Q3tLoD4+o" + "/XazHC/0FyA"
        case .keyDeviceVariant:                                           return "SvI9oDkzw4X" + "JFd+dKen/2Q"
        case .keyDeviceVariantGuess:                                      return "IMLaTlxS7IT" + "twfbRfPYWuA"
        case .keyDiagData:                                                return "67x5O+zO+Jw" + "nGgmKlq+qdA"
        case .keyDictationCapability:                                     return "1uZbhSbBhsN" + "CsVSsopZ4qg"
        case .keyDieId:                                                   return "Z/TJS0IaLyq" + "10dcSvUTGPg"
        case .keyDiskUsage:                                               return "uyejyEdaxNW" + "SRQQwHmXz1A"
        case .keyDisplayDriverICChipID:                                   return "yPqGUljqvtI" + "tkM6XMCZaQw"
        case .keyDisplayFCCLogosViaSoftwareCapability:                    return "ueuuYQk48HG" + "Wm/cJlHq/Dw"
        case .keyDisplayMirroringCapability:                              return "iFOX66Vmcij" + "ipO3YRc+AXg"
        case .keyDisplayPortCapability:                                   return "vl45ziHlkqz" + "h1Yt6+M9vBA"
        case .keyDualSIMActivationPolicyCapable:                          return "jkr5aFPOh/d" + "6zTzNKYthBw"
        // ---------------------------------------------------------------------------------------------------
            
        // E -------------------------------------------------------------------------------------------------
        case .keyEUICCChipID:                                             return "qWG594bTi87" + "edQCSYxlLeA"
        case .keyEffectiveProductionStatusAp:                             return "AQiIpW0UeYQ" + "Knhy2da7AXg"
        case .keyEffectiveProductionStatusSEP:                            return "PNexcW/LBlP" + "gAm+Skp2EAg"
        case .keyEffectiveSecurityModeAp:                                 return "vENa/R1xAXL" + "obl8r3PBL6w"
        case .keyEffectiveSecurityModeSEP:                                return "QJSuJ2zhdxY" + "X/7DUA2JtUw"
        case .keyEncodeAACCapability:                                     return "fqNtLlgbYfa" + "9gSNrhg7VGQ"
        case .keyEncryptedDataPartitionCapability:                        return "i8+iwUtLtB5" + "jT+WNvqwrEA"
        case .keyEnforceCameraShutterClick:                               return "xJUG7IKySth" + "RrPcxII184g"
        case .keyEnforceGoogleMail:                                       return "Js8HVdVGRs8" + "m5v94pMjkRw"
        case .keyEthernetMacAddress:                                      return "VG9TCKNqNLC" + "Hk0J6zTkuVQ"
        case .keyEthernetMacAddressData:                                  return "aOq/O8u9f/b" + "pWUnKco+xgA"
        case .keyExplicitContentRestriction:                              return "AthxlkPBk46" + "HtzM9AxK9vg"
        case .keyExternalChargeCapability:                                return "NPzjaX07XnS" + "4KcMZ+l8ymA"
        case .keyExternalPowerSourceConnected:                            return "na6PSBfq05l" + "kAfWkwAwaGg"
        // ---------------------------------------------------------------------------------------------------
            
        // F -------------------------------------------------------------------------------------------------
        case .keyFDRSealingStatus:                                        return "VHTcx7WQq0V" + "7YgGKZisRWA"
        case .keyFMFAllowed:                                              return "Y2Y67z0Nq/X" + "dDXgW2EeaVg"
        case .keyFaceTimeBackCameraTemporalNoiseReductionMode:            return "JXmZWYUbLou" + "mvz7hu/GL0A"
        case .keyFaceTimeBitRate2G:                                       return "Nhm02nvVOaQ" + "PimpOshlO1g"
        case .keyFaceTimeBitRate3G:                                       return "1rf3rZXIZFg" + "znqrHlPehuQ"
        case .keyFaceTimeBitRateLTE:                                      return "xunfK8NYNCS" + "75N2z2buKWQ"
        case .keyFaceTimeBitRateWiFi:                                     return "h8xonkkn/Nz" + "DMvvCXLw8cQ"
        case .keyFaceTimeCameraRequiresFastSwitchOptions:                 return "J912s3mVzhR" + "eVtPv4HwqNQ"
        case .keyFaceTimeCameraSupportsHardwareFaceDetection:             return "Po0s2Vf6g2Z" + "qymKGNLFxeQ"
        case .keyFaceTimeDecodings:                                       return "yl8qmYPdAhF" + "LeDBho10sdQ"
        case .keyFaceTimeEncodings:                                       return "BoNz1QXiAEU" + "gic9RdMVLIg"
        case .keyFaceTimeFrontCameraTemporalNoiseReductionMode:           return "CK3I7fFGkge" + "qzKEhGew9rQ"
        case .keyFaceTimePhotosOptIn:                                     return "4RgFi8v1sfu" + "hCZhRdQkxxQ"
        case .keyFaceTimePreferredDecoding:                               return "APeknA55ZAc" + "u0FcufqVN4Q"
        case .keyFaceTimePreferredEncoding:                               return "ct5Dh6u0D6W" + "DJKg2PrMFVQ"
        case .keyFirmwareNonce:                                           return "VLfT+eziZYK" + "NjRASM6ntnQ"
        case .keyFirmwarePreflightInfo:                                   return "qOwiNS0eFEq" + "9oi3MNsgxWg"
        case .keyFirmwareVersion:                                         return "LeSRsiLoJCM" + "hjn6nd6GWbQ"
        case .keyFirstPartyLaunchTimeLimitScale:                          return "NUYAz1eq3Fl" + "zt7ZQxXC/ng"
        case .keyForwardCameraCapability:                                 return "H97G3GzDYb4" + "wY5kwJ0AKfQ"
        case .keyFrontCameraOffsetFromDisplayCenter:                      return "uksZ8eaKeV5" + "sUpLNBPafww"
        case .keyFrontCameraRotationFromDisplayNormal:                    return "g5LBi+DCiP5" + "+jUnWVL7Y9w"
        case .keyFrontFacingCameraAutoHDRCapability:                      return "fv8ZXM/NhUH" + "QBQqCSk19cA"
        case .keyFrontFacingCameraBurstCapability:                        return "Ty5/C8UDfdj" + "cdR853kulmA"
        case .keyFrontFacingCameraCapability:                             return "7W2eNk/f6ue" + "wC8N58mlRrQ"
        case .keyFrontFacingCameraHDRCapability:                          return "HnHX0gXt8Rv" + "hMQzIVMM7hw"
        case .keyFrontFacingCameraHDROnCapability:                        return "1gsBzuZsXu2" + "rXZJBE01M0w"
        case .keyFrontFacingCameraHFRCapability:                          return "mL1lk3ZVGDF" + "UQhxU9YLW6Q"
        case .keyFrontFacingCameraHFRVideoCapture1080pMaxFPS:             return "TqAfAH10AND" + "giG7V2u8BkQ"
        case .keyFrontFacingCameraHFRVideoCapture720pMaxFPS:              return "ZeGw3VKUymU" + "Abp4noKsxoQ"
        case .keyFrontFacingCameraMaxVideoZoomFactor:                     return "qlcdNkarcGL" + "cbW3HvBhwaA"
        case .keyFrontFacingCameraModuleSerialNumber:                     return "VHTcx7WQq0V" + "7YgGKZisRWA"
        case .keyFrontFacingCameraStillDurationForBurst:                  return "TDM8SEI14n2" + "KE9PGHO0a4A"
        case .keyFrontFacingCameraVideoCapture1080pMaxFPS:                return "3yzXj0lJhQi" + "+r3kgQlwiOg"
        case .keyFrontFacingCameraVideoCapture4kMaxFPS:                   return "cux58RcuSiB" + "hpxWnT3pE4A"
        case .keyFrontFacingCameraVideoCapture720pMaxFPS:                 return "0AFeHRmliNJ" + "4pSlVb8ltZA"
        case .keyFrontFacingIRCameraModuleSerialNumber:                   return "2kuITg6XPwX" + "l8zbpx+hoCw"
        case .keyFrontFacingIRStructuredLightProjectorModuleSerialNumber: return "wH7fRq4TDdY" + "G2pN1KDQW/A"
        case .keyFull6FeaturesCapability:                                 return "fW9C1U4C1FR" + "8bwe1VqEWug"
        // ---------------------------------------------------------------------------------------------------
            
        // G -------------------------------------------------------------------------------------------------
        case .keyGPSCapability:                                           return "jyEyRLza0L3" + "StNXgFUCoTw"
        case .keyGSDeviceName:                                            return "9s45ldrCC1W" + "F+7b6C4H2BA"
        case .keyGameKitCapability:                                       return "guykxGaRwHd" + "enUK8fJRl8w"
        case .keyGasGaugeBatteryCapability:                               return "FOs+LbLUs+T" + "ajsEE4xkbrw"
        case .keyGreenTeaDeviceCapability:                                return "iyfxmLogGVI" + "aH7aEgqwcIA"
        case .keyGyroscopeCapability:                                     return "4+qmMh9JBDh" + "72Nq6fD64RQ"
        // ---------------------------------------------------------------------------------------------------
            
        // H -------------------------------------------------------------------------------------------------
        case .keyH264EncoderCapability:                                   return "SCNOHu+KqRX" + "0xhIlj5KXaA"
        case .keyHDRImageCaptureCapability:                               return "fh6DnnDGDVZ" + "5kZ9nYn/GrQ"
        case .keyHDVideoCaptureCapability:                                return "6pjDdEw65TF" + "yL1FmIdszXw"
        case .keyHEVCDecoder10bitSupported:                               return "ZEU7pCEskBh" + "jQ4AOMuALDw"
        case .keyHEVCDecoder12bitSupported:                               return "sigsyX/a/Cp" + "MjoZnrgwIgg"
        case .keyHEVCDecoder8bitSupported:                                return "N8lZxRgC7lf" + "dRS3dRLn+Ag"
        case .keyHEVCEncodingCapability:                                  return "g/MkWm2Ac6+" + "TLNBgtBGxsg"
        case .keyHMERefreshRateInARKit:                                   return ""
        case .keyHWModelStr:                                              return "/YYygAofPDb" + "hrwToVsXdeA"
        case .keyHallEffectSensorCapability:                              return "/Pop5T2XQdD" + "A60MRyxQJdQ"
        case .keyHardwareEncodeSnapshotsCapability:                       return "m+FD6mX8VZz" + "P95hOhM+jow"
        case .keyHardwareKeyboardCapability:                              return "/GK+yfRFY/b" + "5ZDIDpdVImg"
        case .keyHardwarePlatform:                                        return "5pYKlGnYYBz" + "GvAlIU8RjEQ"
        case .keyHardwareSnapshotsRequirePurpleGfxCapability:             return "FDsm68UVR7l" + "3wErusGLgKg"
        case .keyHasAllFeaturesCapability:                                return "QGmb9t2ZMFV" + "wOImO6fewgQ"
        case .keyHasAppleNeuralEngine:                                    return "+N9mZUAHooN" + "vMiQnjeTJ8g"
        case .keyHasBaseband:                                             return "AJFQheZDyUb" + "vI6RmBMT9Cg"
        case .keyHasBattery:                                              return "pX2TxZTxWKS" + "7QSXZDC/Z6A"
        case .keyHasDaliMode:                                             return "3m1Q0AXlqeA" + "2C/LmqdTndQ"
        case .keyHasExtendedColorDisplay:                                 return "Aixt/MEN2O2" + "B7f+8m4TxUA"
        case .keyHasIcefall:                                              return "v9YZN998zL0" + "OLA3q6SpPQA"
        case .keyHasInternalSettingsBundle:                               return "Oji6HRoPi7r" + "H7HPdWVakuw"
        case .keyHasMesa:                                                 return "HV7WDiidgMf" + "7lwAu++Lk5w"
        case .keyHasPKA:                                                  return "fkWvcjYnYzG" + "RhVKiBoYzgA"
        case .keyHasSEP:                                                  return "7DfjbzhvH/G" + "Dkhio1dv8fA"
        case .keyHasSpringBoard:                                          return "OBqqs000I0S" + "R+EbJ7VO8UQ"
        case .keyHasThinBezel:                                            return "RA3I5nhSK65" + "i1ZxkRxQKfg"
        case .keyHealthKitCapability:                                     return "xDg5n/9rR2c" + "Mhp7MK0irBA"
        case .keyHearingAidAudioEqualizationCapability:                   return "SMgTCc2v9AU" + "2ziIHRX8qww"
        case .keyHearingAidLowEnergyAudioCapability:                      return "RyXm3yMC4ej" + "lFvwlEI509w"
        case .keyHearingAidPowerReductionCapability:                      return "u3c0R+31Df4" + "SUTHrICQkTg"
        case .keyHiDPICapability:                                         return "lSpe1QHIya0" + "aeNrjLTtaJA"
        case .keyHiccoughInterval:                                        return "f8peylp799C" + "Jta4Ev/vz8A"
        case .keyHideNonDefaultApplicationsCapability:                    return "cHla4KIe1wv" + "0OvpRVrzy/w"
        case .keyHighestSupportedVideoMode:                               return "ND6ZSbBBgMg" + "wtMfh+OL5Wg"
        case .keyHomeButtonType:                                          return "JwLB44/jEB8" + "aFDpXQ16Tuw"
        case .keyHomeScreenWallpaperCapability:                           return "mVenV0u+B3S" + "hrqRddinaFQ"
        // ---------------------------------------------------------------------------------------------------
            
        // I -------------------------------------------------------------------------------------------------
        case .keyIAP2Capability:                                          return ""
        case .keyIDAMCapability:                                          return ""
        case .keyIOSurfaceBackedImagesCapability:                         return ""
        case .keyIOSurfaceFormatDictionary:                               return ""
        case .keyIceFallID:                                               return ""
        case .keyIcefallInRestrictedMode:                                 return ""
        case .keyIcefallInfo:                                             return ""
        case .keyImage4CryptoHashMethod:                                  return ""
        case .keyImage4Supported:                                         return ""
        case .keyInDiagnosticsMode:                                       return ""
        case .keyIntegratedCircuitCardIdentifier:                         return ""
        case .keyIntegratedCircuitCardIdentifier2:                        return ""
        case .keyInternalBuild:                                           return ""
        case .keyInternationalMobileEquipmentIdentity:                    return ""
        case .keyInternationalMobileEquipmentIdentity2:                   return ""
        case .keyInternationalSettingsCapability:                         return ""
        case .keyInverseDeviceID:                                         return ""
        case .keyIsEmulatedDevice:                                        return ""
        case .keyIsLargeFormatPhone:                                      return ""
        case .keyIPadCapability:                                          return ""
        case .keyIsPwrOpposedVol:                                         return ""
        case .keyIsServicePart:                                           return ""
        case .keyIsSimulator:                                             return ""
        case .keyIsThereEnoughBatteryLevelForSoftwareUpdate:              return ""
        case .keyIsUIBuild:                                               return ""
        case .keyITunesFamilyID:                                          return ""
        // ---------------------------------------------------------------------------------------------------
            
        // J -------------------------------------------------------------------------------------------------
        case .keyJasperSerialNumber:                                      return "dJvRNnysMou" + "bdy0ZCK2aRQ"
        // ---------------------------------------------------------------------------------------------------
            
        // L -------------------------------------------------------------------------------------------------
        case .keyLTEDeviceCapability:                                     return ""
        case .keyLaunchTimeLimitScaleSupported:                           return ""
        case .keyLisaCapability:                                          return ""
        case .keyLoadThumbnailsWhileScrollingCapability:                  return ""
        case .keyLocalizedDeviceNameString:                               return ""
        case .keyLocationRemindersCapability:                             return ""
        case .keyLocationServicesCapability:                              return ""
        case .keyLowPowerWalletMode:                                      return ""
        case .keyLunaFlexSerialNumber:                                    return ""
        case .keyLynxPublicKey:                                           return ""
        case .keyLynxSerialNumber:                                        return ""
        // ---------------------------------------------------------------------------------------------------
            
        // M -------------------------------------------------------------------------------------------------
        case .keyMLBSerialNumber:                                         return ""
        case .keyMMSCapability:                                           return ""
        case .keyMacBridgingKeys:                                         return ""
        case .keyMagnetometerCapability:                                  return ""
        case .keyMainDisplayRotation:                                     return ""
        case .keyMainScreenCanvasSizes:                                   return ""
        case .keyMainScreenClass:                                         return ""
        case .keyMainScreenHeight:                                        return ""
        case .keyMainScreenOrientation:                                   return ""
        case .keyMainScreenPitch:                                         return ""
        case .keyMainScreenScale:                                         return ""
        case .keyMainScreenStaticInfo:                                    return ""
        case .keyMainScreenWidth:                                         return ""
        case .keyMarketingNameString:                                     return ""
        case .keyMarketingProductName:                                    return ""
        case .keyMarketingVersion:                                        return ""
        case .keyMaxH264PlaybackLevel:                                    return ""
        case .keyMaximumScreenScale:                                      return ""
        case .keyMedusaFloatingLiveAppCapability:                         return ""
        case .keyMedusaOverlayAppCapability:                              return ""
        case .keyMedusaPIPCapability:                                     return ""
        case .keyMedusaPinnedAppCapability:                               return ""
        case .keyMesaSerialNumber:                                        return ""
        case .keyMetalCapability:                                         return ""
        case .keyMicrophoneCapability:                                    return ""
        case .keyMicrophoneCount:                                         return ""
        case .keyMinimumSupportediTunesVersion:                           return ""
        case .keyMixAndMatchPrevention:                                   return ""
        case .keyMobileDeviceMinimumVersion:                              return ""
        case .keyMobileEquipmentIdentifier:                               return ""
        case .keyMobileEquipmentInfoBaseId:                               return ""
        case .keyMobileEquipmentInfoBaseProfile:                          return ""
        case .keyMobileEquipmentInfoBaseVersion:                          return ""
        case .keyMobileEquipmentInfoCSN:                                  return ""
        case .keyMobileEquipmentInfoDisplayCSN:                           return ""
        case .keyMobileSubscriberCountryCode:                             return ""
        case .keyMobileSubscriberNetworkCode:                             return ""
        case .keyMobileWifi:                                              return ""
        case .keyModelNumber:                                             return ""
        case .keyMonarchLowEndHardware:                                   return ""
        case .keyMultiLynxPublicKeyArray:                                 return ""
        case .keyMultiLynxSerialNumberArray:                              return ""
        case .keyMultitaskingCapability:                                  return ""
        case .keyMultitaskingGesturesCapability:                          return ""
        case .keyMusicStoreCapability:                                    return ""
        // ---------------------------------------------------------------------------------------------------
            
        // N -------------------------------------------------------------------------------------------------
        case .keyN78aHack:                                                return ""
        case .keyNFCRadio:                                                return ""
        case .keyNFCRadioCalibrationDataPresent:                          return ""
        case .keyNFCUniqueChipID:                                         return ""
        case .keyNVRAMDictionary:                                         return ""
        case .keyNandControllerUID:                                       return ""
        case .keyNavajoFusingState:                                       return ""
        case .keyNikeIpodCapability:                                      return ""
        case .keyNotGreenTeaDeviceCapability:                             return ""
        // ---------------------------------------------------------------------------------------------------
            
        // O -------------------------------------------------------------------------------------------------
        case .keyOLEDDisplay:                                             return ""
        case .keyOTAActivationCapability:                                 return ""
        case .keyOfflineDictationCapability:                              return "c5uqoV7Z9ly+f4c5mYXILg"
        case .keyOpenGLES1Capability:                                     return ""
        case .keyOpenGLES2Capability:                                     return ""
        case .keyOpenGLES3Capability:                                     return ""
        case .keyOpenGLESVersion:                                         return ""
        // ---------------------------------------------------------------------------------------------------
            
        // P -------------------------------------------------------------------------------------------------
        case .keyPTPLargeFilesCapability:                                 return ""
        case .keyPanelSerialNumber:                                       return ""
        case .keyPanoramaCameraCapability:                                return ""
        case .keyPartitionType:                                           return ""
        case .keyPasswordConfigured:                                      return ""
        case .keyPasswordProtected:                                       return ""
        case .keyPearlCameraCapability:                                   return ""
        case .keyPearlIDCapability:                                       return ""
        case .keyPeekUICapability:                                        return ""
        case .keyPeekUIWidth:                                             return ""
        case .keyPeer2PeerCapability:                                     return ""
        case .keyPersonalHotspotCapability:                               return ""
        case .keyPhoneNumber:                                             return ""
        case .keyPhoneNumber2:                                            return ""
        case .keyPhosphorusCapability:                                    return ""
        case .keyPhotoAdjustmentsCapability:                              return ""
        case .keyPhotoCapability:                                         return ""
        case .keyPhotoSharingCapability:                                  return ""
        case .keyPhotoStreamCapability:                                   return ""
        case .keyPhotosPostEffectsCapability:                             return ""
        case .keyPiezoClickerCapability:                                  return ""
        case .keyPintoMacAddress:                                         return ""
        case .keyPintoMacAddressData:                                     return ""
        case .keyPipelinedStillImageProcessingCapability:                 return ""
        case .keyPlatformStandAloneContactsCapability:                    return ""
        case .keyPlatinumCapability:                                      return ""
        case .keyProductHash:                                             return ""
        case .keyProductName:                                             return ""
        case .keyProductType:                                             return ""
        case .keyProductVersion:                                          return ""
        case .keyProximitySensorCalibration:                              return ""
        case .keyProximitySensorCalibrationDictionary:                    return ""
        case .keyProximitySensorCapability:                               return ""
        // ---------------------------------------------------------------------------------------------------
            
        // R -------------------------------------------------------------------------------------------------
        case .keyRFExposureSeparationDistance:                            return ""
        case .keyRawPanelSerialNumber:                                    return ""
        case .keyRearCameraCapability:                                    return ""
        case .keyRearCameraOffsetFromDisplayCenter:                       return ""
        case .keyRearFacingCamera60fpsVideoCaptureCapability:             return ""
        case .keyRearFacingCameraAutoHDRCapability:                       return ""
        case .keyRearFacingCameraBurstCapability:                         return ""
        case .keyRearFacingCameraCapability:                              return ""
        case .keyRearFacingCameraHDRCapability:                           return ""
        case .keyRearFacingCameraHDROnCapability:                         return ""
        case .keyRearFacingCameraHFRCapability:                           return ""
        case .keyRearFacingCameraHFRVideoCapture1080pMaxFPS:              return ""
        case .keyRearFacingCameraHFRVideoCapture720pMaxFPS:               return ""
        case .keyRearFacingCameraMaxVideoZoomFactor:                      return ""
        case .keyRearFacingCameraModuleSerialNumber:                      return ""
        case .keyRearFacingCameraStillDurationForBurst:                   return ""
        case .keyRearFacingCameraSuperWideCameraCapability:               return ""
        case .keyRearFacingCameraTimeOfFlightCameraCapability:            return ""
        case .keyRearFacingCameraVideoCapture1080pMaxFPS:                 return ""
        case .keyRearFacingCameraVideoCapture4kMaxFPS:                    return ""
        case .keyRearFacingCameraVideoCapture720pMaxFPS:                  return ""
        case .keyRearFacingCameraVideoCaptureFPS:                         return ""
        case .keyRearFacingLowLightCameraCapability:                      return ""
        case .keyRearFacingSuperWideCameraModuleSerialNumber:             return ""
        case .keyRearFacingTelephotoCameraCapability:                     return ""
        case .keyRearFacingTelephotoCameraModuleSerialNumber:             return ""
        case .keyRecoveryOSVersion:                                       return ""
        case .keyRegionCode:                                              return ""
        case .keyRegionInfo:                                              return ""
        case .keyRegionSupportsCinnamon:                                  return ""
        case .keyRegionalBehaviorAll:                                     return ""
        case .keyRegionalBehaviorChinaBrick:                              return ""
        case .keyRegionalBehaviorEUVolumeLimit:                           return ""
        case .keyRegionalBehaviorGB18030:                                 return ""
        case .keyRegionalBehaviorGoogleMail:                              return ""
        case .keyRegionalBehaviorNTSC:                                    return ""
        case .keyRegionalBehaviorNoPasscodeLocationTiles:                 return ""
        case .keyRegionalBehaviorNoVOIP:                                  return ""
        case .keyRegionalBehaviorNoWiFi:                                  return ""
        case .keyRegionalBehaviorShutterClick:                            return ""
        case .keyRegionalBehaviorValid:                                   return ""
        case .keyRegionalBehaviorVolumeLimit:                             return ""
        case .keyRegulatoryModelNumber:                                   return ""
        case .keyReleaseType:                                             return ""
        case .keyRemoteBluetoothAddress:                                  return ""
        case .keyRemoteBluetoothAddressData:                              return ""
        case .keyRenderWideGamutImagesAtDisplayTime:                      return ""
        case .keyRendersLetterPressSlowly:                                return ""
        case .keyRequiredBatteryLevelForSoftwareUpdate:                   return ""
        case .keyRestoreOSBuild:                                          return ""
        case .keyRestrictedCountryCodes:                                  return ""
        case .keyRingerSwitchCapability:                                  return ""
        case .keyRosalineSerialNumber:                                    return ""
        case .keyRoswellChipID:                                           return ""
        case .keyRotateToWakeStatus:                                      return ""
        // ---------------------------------------------------------------------------------------------------
            
        // S -------------------------------------------------------------------------------------------------
        case .keySBAllowSensitiveUI:                                      return ""
        case .keySBCanForceDebuggingInfo:                                 return ""
        case .keySDIOManufacturerTuple:                                   return ""
        case .keySDIOProductInfo:                                         return ""
        case .keySEInfo:                                                  return ""
        case .keySEPNonce:                                                return ""
        case .keySIMCapability:                                           return ""
        case .keySIMPhonebookCapability:                                  return ""
        case .keySIMStatus:                                               return ""
        case .keySIMStatus2:                                              return ""
        case .keySIMTrayStatus:                                           return ""
        case .keySIMTrayStatus2:                                          return ""
        case .keySMSCapability:                                           return ""
        case .keySavageChipID:                                            return ""
        case .keySavageInfo:                                              return ""
        case .keySavageSerialNumber:                                      return ""
        case .keySavageUID:                                               return ""
        case .keyScreenDimensionsCapability:                              return ""
        case .keyScreenRecorderCapability:                                return ""
        case .keyScreenSerialNumber:                                      return ""
        case .keySecondaryBluetoothMacAddress:                            return ""
        case .keySecondaryBluetoothMacAddressData:                        return ""
        case .keySecondaryEthernetMacAddress:                             return ""
        case .keySecondaryEthernetMacAddressData:                         return ""
        case .keySecondaryWifiMacAddress:                                 return ""
        case .keySecondaryWifiMacAddressData:                             return ""
        case .keySecureElement:                                           return ""
        case .keySecureElementID:                                         return ""
        case .keySecurityDomain:                                          return ""
        case .keySensitiveUICapability:                                   return ""
        case .keySerialNumber:                                            return ""
        case .keyShoeboxCapability:                                       return ""
        case .keyShouldHactivate:                                         return ""
        case .keySiKACapability:                                          return ""
        case .keySigningFuse:                                             return ""
        case .keySiliconBringupBoard:                                     return ""
        case .keySimultaneousCallAndDataCurrentlySupported:               return ""
        case .keySimultaneousCallAndDataSupported:                        return ""
        case .keySiriGestureCapability:                                   return ""
        case .keySiriOfflineCapability:                                   return ""
        case .keySkey:                                                    return ""
        case .keySoftwareBehavior:                                        return ""
        case .keySoftwareBundleVersion:                                   return ""
        case .keySoftwareDimmingAlpha:                                    return ""
        case .keySpeakerCalibrationMiGa:                                  return ""
        case .keySpeakerCalibrationSpGa:                                  return ""
        case .keySpeakerCalibrationSpTS:                                  return ""
        case .keySphereCapability:                                        return ""
        case .keyStarkCapability:                                         return ""
        case .keyStockholmJcopInfo:                                       return ""
        case .keyStrictWakeKeyboardCases:                                 return ""
        case .keySupportedDeviceFamilies:                                 return ""
        case .keySupportedKeyboards:                                      return ""
        case .keySupportsBurninMitigation:                                return ""
        case .keySupportsEDUMU:                                           return ""
        case .keySupportsForceTouch:                                      return ""
        case .keySupportsIrisCapture:                                     return ""
        case .keySupportsLowPowerMode:                                    return ""
        case .keySupportsPerseus:                                         return ""
        case .keySupportsRotateToWake:                                    return ""
        case .keySupportsSOS:                                             return ""
        case .keySupportsSSHBButtonType:                                  return ""
        case .keySupportsTouchRemote:                                     return ""
        case .keySysCfg:                                                  return ""
        case .keySysCfgDict:                                              return ""
        case .keySystemImageID:                                           return ""
        case .keySystemTelephonyOfAnyKindCapability:                      return ""
        // ---------------------------------------------------------------------------------------------------
            
        // T -------------------------------------------------------------------------------------------------
        case .keyTVOutCrossfadeCapability:                                return ""
        case .keyTVOutSettingsCapability:                                 return ""
        case .keyTelephonyCapability:                                     return ""
        case .keyTelephonyMaximumGeneration:                              return ""
        case .keyTimeSyncCapability:                                      return ""
        case .keyTopModuleAuthChipID:                                     return ""
        case .keyTouchDelivery120Hz:                                      return ""
        case .keyTouchIDCapability:                                       return ""
        case .keyTristarID:                                               return ""
        // ---------------------------------------------------------------------------------------------------
            
        // U -------------------------------------------------------------------------------------------------
        case .keyUIBackgroundQuality:                                     return ""
        case .keyUIParallaxCapability:                                    return ""
        case .keyUIProceduralWallpaperCapability:                         return ""
        case .keyUIReachability:                                          return ""
        case .keyUMTSDeviceCapability:                                    return ""
        case .keyUnifiedIPodCapability:                                   return ""
        case .keyUniqueChipID:                                            return ""
        case .keyUniqueDeviceID:                                          return ""
        case .keyUniqueDeviceIDData:                                      return ""
        case .keyUserAssignedDeviceName:                                  return ""
        case .keyUserIntentPhysicalButtonCGRect:                          return ""
        case .keyUserIntentPhysicalButtonCGRectString:                    return ""
        case .keyUserIntentPhysicalButtonNormalizedCGRect:                return ""
        // ---------------------------------------------------------------------------------------------------
            
        // V -------------------------------------------------------------------------------------------------
        case .keyVOIPCapability:                                          return ""
        case .keyVeniceCapability:                                        return ""
        case .keyVibratorCapability:                                      return ""
        case .keyVideoCameraCapability:                                   return ""
        case .keyVideoStillsCapability:                                   return ""
        case .keyVoiceControlCapability:                                  return ""
        case .keyVolumeButtonCapability:                                  return ""
        // ---------------------------------------------------------------------------------------------------
            
        // W -------------------------------------------------------------------------------------------------
        case .keyWAGraphicQuality:                                        return ""
        case .keyWAPICapability:                                          return ""
        case .keyWLANBkgScanCache:                                        return ""
        case .keyWSKU:                                                    return ""
        case .keyWatchCompanionCapability:                                return ""
        case .keyWatchSupportsAutoPlaylistPlayback:                       return ""
        case .keyWatchSupportsHighQualityClockFaceGraphics:               return ""
        case .keyWatchSupportsListeningOnGesture:                         return ""
        case .keyWatchSupportsMusicStreaming:                             return ""
        case .keyWatchSupportsSiriCommute:                                return ""
        case .keyWiFiCallingCapability:                                   return ""
        case .keyWiFiCapability:                                          return ""
        case .keyWifiAddress:                                             return ""
        case .keyWifiAddressData:                                         return ""
        case .keyWifiAntennaSKUVersion:                                   return ""
        case .keyWifiCallingSecondaryDeviceCapability:                    return ""
        case .keyWifiChipset:                                             return ""
        case .keyWifiFirmwareVersion:                                     return ""
        case .keyWifiVendor:                                              return ""
        case .keyWirelessBoardSnum:                                       return ""
        case .keyWirelessChargingCapability:                              return ""
        // ---------------------------------------------------------------------------------------------------
            
        // Y -------------------------------------------------------------------------------------------------
        case .keyYonkersChipID:                                           return ""
        case .keyYonkersSerialNumber:                                     return ""
        case .keyYonkersUID:                                              return ""
        case .keyYouTubeCapability:                                       return ""
        case .keyYouTubePluginCapability:                                 return ""
        // ---------------------------------------------------------------------------------------------------
            
        // Unknown -------------------------------------------------------------------------------------------
        case .unknown(let rawValue):                                      return rawValue
        // ---------------------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }
}
