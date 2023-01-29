//
//  GestaltDictionaryKey.swift
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

// MARK: GestaltDictionaryKey

enum GestaltDictionaryKey {
    // MARK: - 3

    /**
     Whether the device has a 3G proximity sensor
     */
    case key3GProximityCapability

    /**
     Whether the device supports FaceTime over cellular
     */
    case key3GVeniceCapability

    // MARK: - 7

    /**
     Whether the device supports 720p video (identical to kMGQDeviceSupports720p)
     */
    case key720pPlaybackCapability

    // MARK: - A

    /**

     */
    case keyAPNCapability

    /**
     Whether the device supports executing arm64 binaries
     */
    case keyARM64ExecutionCapability

    /**
     Whether the device supports executing armv6 binaries
     */
    case keyARMV6ExecutionCapability

    /**
     Whether the device supports executing armv7 binaries
     */
    case keyARMV7ExecutionCapability

    /**
     Whether the device supports executing armv7s binaries
     */
    case keyARMV7SExecutionCapability

    /**
     AWD ID key
     */
    case keyAWDID

    /**
     Apple Wireless Direct Link (AWDL) capability
     */
    case keyAWDLCapability

    /**
     Whether the device is capable of using an accelerometer
     */
    case keyAccelerometerCapability

    /**
     Whether the device has the accessibility capability
     */
    case keyAccessibilityCapability

    /**
     Determines a unique acoustic tuning for a platform.
     */
    case keyAcousticID

    /**
     Device activation protocol version
     */
    case keyActivationProtocol

    /**
     The wireless networking technology that is currently being used
     */
    case keyActiveWirelessTechnology

    /**
     Resonant frequency of actuator
     */
    case keyActuatorResonantFrequency

    /**

     */
    case keyAdditionalTextTonesCapability

    /**
     Max Photo Zoom for Aggregate Device
     */
    case keyAggregateDevicePhotoZoomFactor

    /**
     Max Video Zoom for Aggregate Device
     */
    case keyAggregateDeviceVideoZoomFactor

    /**
     Whether the device supports AirDrop
     */
    case keyAirDropCapability

    /**
     Whether use of AirDrop is currently restricted
     */
    case keyAirDropRestriction

    /**
     Whether the device is currently in Airplane Mode
     */
    case keyAirplaneMode

    /**
     Whether the device supports Airplay mirroring
     */
    case keyAirplayMirroringCapability

    /**
     Whether the device supports 32 bit apps
     */
    case keyAllow32BitApps

    /**
     Does the device only allow ATVCPSDKApps
     */
    case keyAllowOnlyATVCPSDKApps

    /**
     Whether YouTube is allowed on this device
     */
    case keyAllowYouTube

    /**
     Whether the YouTube plugin is allowed on this device
     */
    case keyAllowYouTubePlugin

    /**
     Whether the device has an ambient light sensor
     */
    case keyAmbientLightSensorCapability

    /**
     Serial Number of Ambient Light Sensor (directly from the Hardware - CFString)
     */
    case keyAmbientLightSensorSerialNumber

    /**
     Nonce for ticket-based AP personalization
     */
    case keyApNonce

    /**
     Retrieve full Nonce for ticket-based AP personalization
     */
    case keyApNonceRetrieve

    /**
     App capacity reserved on TVOS
     */
    case keyAppCapacityTVOS

    /**
     Whether the device supports the App Store
     */
    case keyAppStoreCapability

    /**
     Whether the installed OS is an internal build (identical to kMGQInternalBuild)
     */
    case keyAppleInternalInstallCapability

    /**
     Fetches the ANE subtype from the registry
     */
    case keyAppleNeuralEngineSubtype

    /**
     Whether the device can install applications
     */
    case keyApplicationInstallationCapability

    /**
     Arc haptic module serial number
     */
    case keyArcModuleSerialNumber

    /**
     Device's Arrow Chip ID
     */
    case keyArrowChipID

    /**
     Device's Arrow ECID
     */
    case keyArrowUniqueChipID

    /**
     Returns Artwork traits table. Keys are defined in MobileGestalt.h as kMGArtworkDevice*
     */
    case keyArtworkTraits

    /**
     Whether the device supports Siri
     */
    case keyAssistantCapability

    /**
     Whether the device supports audio playback
     */
    case keyAudioPlaybackCapability

    /**
     Whether the device's camera is capable of auto focus
     */
    case keyAutoFocusCameraCapability

    /**
     Available Display Zoom Sizes
     */
    case keyAvailableDisplayZoomSizes

    // MARK: B

    /**
     Whether the device has backlight
     */
    case keyBacklightCapability

    /**
     GPIO support for BB-AP time sync
     */
    case keyBasebandAPTimeSync

    /**
     Serial number of the device's baseband board. Not to be confused with the device serial number (kMGQSerialNumber) or the baseband's serial number (kMGQBasebandSerialNumber)
     */
    case keyBasebandBoardSnum

    /**
     Baseband's cert ID
     */
    case keyBasebandCertId

    /**
     Chip ID number for the baseband
     */
    case keyBasebandChipId

    /**
     Baseband's chipset
     */
    case keyBasebandChipset

    /**
     Baseband's class
     */
    case keyBasebandClass

    /**
     Provisioning manifest
     */
    case keyBasebandFirmwareManifestData

    /**
     Baseband Firmware Update Info from Vinyl
     */
    case keyBasebandFirmwareUpdateInfo

    /**
     Version number of the firmware installed on the baseband
     */
    case keyBasebandFirmwareVersion

    /**
     Baseband's key hash information
     */
    case keyBasebandKeyHashInformation

    /**
     Baseband's postponement status
     */
    case keyBasebandPostponementStatus

    /**
     Baseband's postponement status Blob
     */
    case keyBasebandPostponementStatusBlob

    /**
     Baseband's region SKU
     */
    case keyBasebandRegionSKU

    /**
     The radio technology word (the second word) of the baseband's region SKU
     */
    case keyBasebandRegionSKURadioTechnology

    /**
     Baseband's security Blob
     */
    case keyBasebandSecurityInfoBlob

    /**
     Serial number of the baseband
     */
    case keyBasebandSerialNumber

    /**
     Baseband's postponement status for activation purposes
     */
    case keyBasebandStatus

    /**
     Baseband unique ID in form of <baseband chipid>-<baseband snum>
     */
    case keyBasebandUniqueId

    /**
     Battery charge capacity
     */
    case keyBatteryCurrentCapacity

    /**
     Whether the battery is currently charging
     */
    case keyBatteryIsCharging

    /**
     Whether the battery is fully charged
     */
    case keyBatteryIsFullyCharged

    /**
     Serial # of battery
     */
    case keyBatterySerialNumber

    /**
     Whether the device supports Blue Light Reduction
     */
    case keyBlueLightReductionSupported

    /**
     MAC address for the device's bluetooth interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keyBluetoothAddress

    /**
     MAC address for the device's bluetooth interface, as a CFData (6 bytes)
     */
    case keyBluetoothAddressData

    /**
     Whether the device has bluetooth
     */
    case keyBluetoothCapability

    /**
     Whether the device supports low energy bluetooth 2
     */
    case keyBluetoothLE2Capability

    /**
     Whether the device supports low energy bluetooth
     */
    case keyBluetoothLECapability

    /**
     Device's board ID
     */
    case keyBoardId

    /**
     Device's board revision tracking hardware phases
     */
    case keyBoardRevision

    /**
     Hash of the boot manifest
     */
    case keyBootManifestHash

    /**
     Boot nonce used for personalization
     */
    case keyBootNonce

    /**
     What build is bridge running
     */
    case keyBridgeBuild

    /**
     The restore bundle version currently running on the Bridge. This should be used for restore purposes only
     */
    case keyBridgeRestoreVersion

    /**
     Whether the device requires Buddy to perform optimizations when displaying its language animation
     */
    case keyBuddyLanguagesAnimationRequiresOptimization

    /**
     UUID of the installed build from the SystemVersion.plist
     */
    case keyBuildID

    /**
     Build version of the installed OS, e.g., "8F110"
     */
    case keyBuildVersion

    // MARK: C

    /**

     */
    case keyC2KDeviceCapability

    /**
     Architecture of the device's CPU, e.g., "armv7" for H3
     */
    case keyCPUArchitecture

    /**
     Preferred userspace cpu_subtype of the device
     */
    case keyCPUSubType

    /**
     Preferred userspace cpu_type of the device
     */
    case keyCPUType

    /**
     Whether the device supports call forwarding
     */
    case keyCallForwardingCapability

    /**
     Whether the device supports call waiting
     */
    case keyCallWaitingCapability

    /**
     Whether the device supports Caller ID
     */
    case keyCallerIDCapability

    /**
     Indicates which UI style should be used by the Camera App.
     */
    case keyCameraAppUIVersion

    /**
     Whether the device is capable of taking still photos
     */
    case keyCameraCapability

    /**
     Whether the device has a flash
     */
    case keyCameraFlashCapability

    /**
     Whether the device has a front flash
     */
    case keyCameraFrontFlashCapability

    /**
     Whether the device supports HDR 2.0
     */
    case keyCameraHDR2Capability

    /**
     Returns the HDR version supported by the device
     */
    case keyCameraHDRVersion

    /**
     Whether the device supports live effects (including B&W)
     */
    case keyCameraLiveEffectsCapability

    /**
     Determine what is the maximum camera burst allowed on the device
     */
    case keyCameraMaxBurstLength

    /**
     Whether use of the camera is currently restricted
     */
    case keyCameraRestriction

    /**
     The array of carrier bundles returned by CT. Requres com.apple.private.MobileGestalt.AllowedProtectedKeys entitlement
     */
    case keyCarrierBundleInfoArray

    /**
     Whether the installed OS is a carrier build
     */
    case keyCarrierInstallCapability

    /**

     */
    case keyCellBroadcastCapability

    /**
     Whether the device is capable of cellular data (identical to kMGQHasBaseband)
     */
    case keyCellularDataCapability

    /**
     Whether the device is capable of cellular telephony (identical to kMGQTelephonyCapability)
     */
    case keyCellularTelephonyCapability

    /**
     Raw production status
     */
    case keyCertificateProductionStatus

    /**
     Raw security mode status
     */
    case keyCertificateSecurityMode

    /**
     Chip ID component of the hardware platform, e.g. 0x8930 for H3
     */
    case keyChipID

    /**
     Whether the device supports Cloud Photo Library
     */
    case keyCloudPhotoLibraryCapability

    /**
     Whether the device can render the coastline glow
     */
    case keyCoastlineGlowRenderingCapability

    /**
     The calibration data of the first compass returned from IOKit
     */
    case keyCompassCalibration

    /**
     The calibration data of the all compasses returned from IOKit
     */
    case keyCompassCalibrationDictionary

    /**
     Returns the type of compass present in the device, where 0 is no compass.
     */
    case keyCompassType

    /**
     The computer's name
     */
    case keyComputerName

    /**

     */
    case keyConferenceCallType

    /**
     config-number from devicetree as int32
     */
    case keyConfigNumber

    /**
     Whether the device is capable of cellular radio (identical to kMGQHasBaseband)
     */
    case keyContainsCellularRadioCapability

    /**
     Whether the device supports continuity
     */
    case keyContinuityCapability

    /**
     Whether the device has CoreRoutine capabilty
     */
    case keyCoreRoutineCapability

    /**
     Serial Number of Coverglass (directly from the Hardware - CFString)
     */
    case keyCoverglassSerialNumber

    // MARK: D

    /**
     Device's DMin content
     */
    case keyDMin

    /**
     Whether the device is an iPad that can support a data plan
     */
    case keyDataPlanCapability

    /**
     debug-board-revision key from IODeviceTree:/chosen
     */
    case keyDebugBoardRevision

    /**

     */
    case keyDelaySleepForHeadsetClickCapability

    /**
     Whether the installed OS is a desense build
     */
    case keyDesenseBuild

    /**
     Is haptic actuator in prewarm mode when screen is on
     */
    case keyDeviceAlwaysPrewarmActuator

    /**
     Returns Back Glass Material (via BGMt)
     */
    case keyDeviceBackGlassMaterial

    /**
     Returns Back of Enclosure Color (via ClBG)
     */
    case keyDeviceBackingColor

    /**
     What Brand is the Device
     */
    case keyDeviceBrand

    /**
     Device class for this device. One of the kMGDeviceClass* constants defined below
     */
    case keyDeviceClass

    /**
     Device class (one of the MGDeviceClass enum values)
     */
    case keyDeviceClassNumber

    /**
     Color of the device's case/cover glass. One of the kMGColor* constants defined below
     */
    case keyDeviceColor

    /**
     Color remapping policy for kMGQDeviceRGBColor and kMGQDeviceEnclosureRGBColor (one of the MGDeviceColorMapPolicy enum values)
     */
    case keyDeviceColorMapPolicy

    /**
     Corner Radius in points
     */
    case keyDeviceCornerRadius

    /**
     Returns Cover Glass Color (via ClCG)
     */
    case keyDeviceCoverGlassColor

    /**
     Returns Cover Glass Material (via CGMt)
     */
    case keyDeviceCoverGlassMaterial

    /**
     Returns cover glass type (one of the MGDeviceCoverMaterial)
     */
    case keyDeviceCoverMaterial

    /**
     Color of the device's enclosure. One of the kMGColor* constants defined below
     */
    case keyDeviceEnclosureColor

    /**
     Returns Back of Enclosure Material (via EnMt)
     */
    case keyDeviceEnclosureMaterial

    /**
     Color of the device's enclosure as an RGB value (0xrrggbb)
     */
    case keyDeviceEnclosureRGBColor

    /**
     This device supports (has) an Aggregate (dual lens) Camera
     */
    case keyDeviceHasAggregateCamera

    /**
     Returns Housing Color (via ClHS) - (think - enclosure color)
     */
    case keyDeviceHousingColor

    /**
     Specifies device's Muse capability.
     */
    case keyDeviceIsMuseCapable

    /**
     [Factory only] Returns the keyboard language information on bridgeOS for the keyboard AppleCare workflow
     */
    case keyDeviceKeyboardCalibration

    /**
     Launch watchdog timeouts.
     */
    case keyDeviceLaunchTimeLimitScale

    /**
     Device name for the device. One of the kMGDeviceName* constants defined below
     */
    case keyDeviceName

    /**
     Device name for the device (as historically returned by GS; differs from kMGQDeviceName) (identical to kMGQGSDeviceName)
     */
    case keyDeviceNameString

    /**
     Whether the device prefers 3D building strokes for performance reasons
     */
    case keyDevicePrefers3DBuildingStrokes

    /**
     Whether the device prefers building strokes for performance reasons
     */
    case keyDevicePrefersBuildingStrokes

    /**
     Whether the device prefers cheap traffic shaders for performance reasons
     */
    case keyDevicePrefersCheapTrafficShaders

    /**
     Whether the device prefers procedural antialiasing over texture-based antialiasing for road rendering
     */
    case keyDevicePrefersProceduralAntiAliasing

    /**
     Whether the device prefers using alpha for traffic for performance reasons
     */
    case keyDevicePrefersTrafficAlpha

    /**
     Whether the device supports Rose / R1 chip
     */
    case keyDeviceProximityCapability

    /**
     Color of the device's case/cover glass as an RGB value (0xrrggbb)
     */
    case keyDeviceRGBColor

    /**
     Does the Device Require Petal Optimization
     */
    case keyDeviceRequiresPetalOptimization

    /**
     Whether the device requires proximity ameliorations
     */
    case keyDeviceRequiresProximityAmeliorations

    /**
     Does device require software brightness calculations
     */
    case keyDeviceRequiresSoftwareBrightnessCalculations

    /**
     App resume watchdog timeouts.
     */
    case keyDeviceSceneUpdateTimeLimitScale

    /**
     What Sub Brand is the Device
     */
    case keyDeviceSubBrand

    /**
     Whether the device supports 1080p video
     */
    case keyDeviceSupports1080p

    /**
     Whether the device supports maps with three-dimensional imagery
     */
    case keyDeviceSupports3DImagery

    /**
     Whether the device supports three-dimensional maps
     */
    case keyDeviceSupports3DMaps

    /**
     Whether the device can support CoreHaptics
     */
    case keyDeviceSupports3rdPartyHaptics

    /**
     Whether the device supports 4G cellular data
     */
    case keyDeviceSupports4G

    /**
     Whether the device supports 4K video
     */
    case keyDeviceSupports4k

    /**
     Whether the device supports executing 64-bit binaries
     */
    case keyDeviceSupports64Bit

    /**
     Whether the device supports 720p video
     */
    case keyDeviceSupports720p

    /**
     Whether the device has a 9 pin (E75) connector
     */
    case keyDeviceSupports9Pin

    /**
     Whether the device supports AOP
     */
    case keyDeviceSupportsAOP

    /**
     Whether the device supports ARKit
     */
    case keyDeviceSupportsARKit

    /**
     Whether device supports ASTC (Adaptive Scalable Texture Compression)
     */
    case keyDeviceSupportsASTC

    /**
     Whether the device should use high quality graphics in maps
     */
    case keyDeviceSupportsAdaptiveMapsUI

    /**
     Does the device support Always Listening Functionality
     */
    case keyDeviceSupportsAlwaysListening

    /**
     Whether the device supports Always On Compass
     */
    case keyDeviceSupportsAlwaysOnCompass

    /**
     Does the device support Always On Time Functionality
     */
    case keyDeviceSupportsAlwaysOnTime

    /**
     Does device support Apple Pencil
     */
    case keyDeviceSupportsApplePencil

    /**
     Whether the device supports automatic low-light video.
     */
    case keyDeviceSupportsAutoLowLightVideo

    /**
     Whether the device supports avatars and stickers.
     */
    case keyDeviceSupportsAvatars

    /**
     Does the device support BatteryModule authentication.
     */
    case keyDeviceSupportsBatteryModuleAuthentication

    /**
     Does the Device support Berkelium2
     */
    case keyDeviceSupportsBerkelium2

    /**
     Does device support the Camera Connection Kit
     */
    case keyDeviceSupportsCCK

    /**
     Whether the device supports camera capture on touchdown.
     */
    case keyDeviceSupportsCameraCaptureOnTouchDown

    /**
     Whether the device supports Deferred Processing
     */
    case keyDeviceSupportsCameraDeferredProcessing

    /**
     Does the device support campera haptics
     */
    case keyDeviceSupportsCameraHaptics

    /**
     Whether the device supports car integration (non-overrideable; see also kMGQStarkCapability)
     */
    case keyDeviceSupportsCarIntegration

    /**
     Does the device support Cinnamon
     */
    case keyDeviceSupportsCinnamon

    /**
     Whether the device supports Closed Loop Haptics - check DeviceSupportsHaptics first
     */
    case keyDeviceSupportsClosedLoopHaptics

    /**
     Whether the device supports Crude Prox
     */
    case keyDeviceSupportsCrudeProx

    /**
     Whether the device uses DClr instead of ClrC
     */
    case keyDeviceSupportsDClr

    /**
     Whether the device supports Do Not Disturb while driving
     */
    case keyDeviceSupportsDoNotDisturbWhileDriving

    /**
     Whether the device supports year of manufacturing e-Label
     */
    case keyDeviceSupportsELabel

    /**
     Whether the device supports EnhancedAC3 decode (identical to kMGQDeviceSupports64Bit)
     */
    case keyDeviceSupportsEnhancedAC3

    /**
     Whether the device supports envrionmental audio exposure.
     */
    case keyDeviceSupportsEnvironmentalDosimetry

    /**
     Whether the device can support external HDR
     */
    case keyDeviceSupportsExternalHDR

    /**
     Whether the device supports floor counting
     */
    case keyDeviceSupportsFloorCounting

    /**
     Whether the device supports Deferred Processing (identical to kMGQDeviceSupportsCameraDeferredProcessing)
     */
    case keyDeviceSupportsHDRDeferredProcessing

    /**
     Whether the device supports HMO for ARKit 3.0
     */
    case keyDeviceSupportsHMEInARKit

    /**
     Whether the device supports Haptics
     */
    case keyDeviceSupportsHaptics

    /**
     Does the device support hardware detents
     */
    case keyDeviceSupportsHardwareDetents

    /**
     Whether the device supports heart health alerts
     */
    case keyDeviceSupportsHeartHealthAlerts

    /**
     Whether the device supports HRV/SDNN
     */
    case keyDeviceSupportsHeartRateVariability

    /**
     Whether the device supports maps with high resolution building images
     */
    case keyDeviceSupportsHiResBuildings

    /**
     Whether the device supports audio through line-in
     */
    case keyDeviceSupportsLineIn

    /**
     Whether the device supports Liquid Detection/Corrosion Mitigation
     */
    case keyDeviceSupportsLiquidDetectionCorrosionMitigation

    /**
     Does the device support Live Photo Auto
     */
    case keyDeviceSupportsLivePhotoAuto

    /**
     Does the device support long form audio
     */
    case keyDeviceSupportsLongFormAudio

    /**
     Whether the device supports Maps Blurred UI
     */
    case keyDeviceSupportsMapsBlurredUI

    /**
     Whether the device supports AR navigation in maps.
     */
    case keyDeviceSupportsMapsOpticalHeading

    /**
     Indicates whether or not a device supports the long-press video recording from photo mode.
     */
    case keyDeviceSupportsMomentCapture

    /**
     Whether the device supports NFC
     */
    case keyDeviceSupportsNFC

    /**
     Whether the device supports navigation
     */
    case keyDeviceSupportsNavigation

    /**
     Does the device support Newton.
     */
    case keyDeviceSupportsNewton

    /**
     Whether the device supports on-demand photo analysis.
     */
    case keyDeviceSupportsOnDemandPhotoAnalysis

    /**
     Whether the device supports recording video in P3 colorspace
     */
    case keyDeviceSupportsP3ColorspaceVideoRecording

    /**
     Whether the device's ambient light sensor provides periodic light level updates
     */
    case keyDeviceSupportsPeriodicALSUpdates

    /**
     Does the device support Local Light in Photos
     */
    case keyDeviceSupportsPhotosLocalLight

    /**
     This device supports allows adjusting the light intenstiy of portrait mode
     */
    case keyDeviceSupportsPortraitIntensityAdjustments

    /**
     Whether the device supports portrait light effects filters
     */
    case keyDeviceSupportsPortraitLightEffectFilters

    /**
     Does device suppoort RGB-10/w30r
     */
    case keyDeviceSupportsRGB10

    /**
     Does the device support raise to speak.
     */
    case keyDeviceSupportsRaiseToSpeak

    /**
     Does the device support SiDataProtection
     */
    case keyDeviceSupportsSiDP

    /**
     Whether the device supports customizing the side button click speed
     */
    case keyDeviceSupportsSideButtonClickSpeed

    /**
     Whether the device supports simplified road meshes
     */
    case keyDeviceSupportsSimplisticRoadMesh

    /**
     Whether the device supports portrait mode on single-camera devices
     */
    case keyDeviceSupportsSingleCameraPortrait

    /**
     Whether the device supports having Siri barge-in / echo-cancellation.
     */
    case keyDeviceSupportsSiriBargeIn

    /**
     Does watch suppoort Siri Speaks
     */
    case keyDeviceSupportsSiriSpeaks

    /**
     Whether the device supports having Siri read incoming messages.
     */
    case keyDeviceSupportsSiriSpokenMessages

    /**
     Indicates if spatial overcapture is supported.
     */
    case keyDeviceSupportsSpatialOverCapture

    /**
     Whether the device supports stereo audio recording
     */
    case keyDeviceSupportsStereoAudioRecording

    /**
     Whether the device supports previews for studio light portraits
     */
    case keyDeviceSupportsStudioLightPortraitPreview

    /**
     Whether the device supports swimming workouts
     */
    case keyDeviceSupportsSwimmingWorkouts

    /**
     Device Supports Tap To Wake
     */
    case keyDeviceSupportsTapToWake

    /**
     Whether the device supports telephony over USB
     */
    case keyDeviceSupportsTelephonyOverUSB

    /**
     Whether the device supports tethering
     */
    case keyDeviceSupportsTethering

    /**
     Whether the device supports Tone Mapping
     */
    case keyDeviceSupportsToneMapping

    /**
     Whether the device has a USB-C (E85) connector
     */
    case keyDeviceSupportsUSBTypeC

    /**
     Whether the device supports VSH compensation
     */
    case keyDeviceSupportsVSHCompensation

    /**
     Whether voiceover is enabled to use the default Siri voice.
     */
    case keyDeviceSupportsVoiceOverCanUseSiriVoice

    /**
     Does the device support webkit
     */
    case keyDeviceSupportsWebkit

    /**
     Does the device support audio splitting on wireless links
     */
    case keyDeviceSupportsWirelessSplitting

    /**
     Does device support YCbCr-10
     */
    case keyDeviceSupportsYCbCr10

    /**
     The device's variant (either the guess, see kMGQDeviceVariantGuess, or the actual variant as returned from activation)
     */
    case keyDeviceVariant

    /**
     The device's best guess at its variant
     */
    case keyDeviceVariantGuess

    /**
     The device's diagnostic data
     */
    case keyDiagData

    /**
     Whether the device supports dictation
     */
    case keyDictationCapability

    /**
     Device's die ID
     */
    case keyDieId

    /**
     Various disk usage statistics (keys are kMGQDiskUsage*)
     */
    case keyDiskUsage

    /**
     Device's display driver IC Chip ID
     */
    case keyDisplayDriverICChipID

    /**

     */
    case keyDisplayFCCLogosViaSoftwareCapability

    /**
     Whether the device supports display mirroring
     */
    case keyDisplayMirroringCapability

    /**
     Whether the device supports outputting video to DisplayPort
     */
    case keyDisplayPortCapability

    /**
     Whether the device could support dualSIM
     */
    case keyDualSIMActivationPolicyCapable

    // MARK: E

    /**
     EUICC Chip ID of the hardware platform
     */
    case keyEUICCChipID

    /**
     Current AP production status (if demoted, after-demotion status)
     */
    case keyEffectiveProductionStatusAp

    /**
     Current SEP production status (if demoted, after-demotion status)
     */
    case keyEffectiveProductionStatusSEP

    /**
     Current AP security mode status (if demoted, after-demotion status)
     */
    case keyEffectiveSecurityModeAp

    /**
     Current SEP security mode status (if demoted, after-demotion status)
     */
    case keyEffectiveSecurityModeSEP

    /**
     Whether the device can encode AAC
     */
    case keyEncodeAACCapability

    /**
     Whether the device can have an encrypted data partition
     */
    case keyEncryptedDataPartitionCapability

    /**
     Whether the device's region enforces a shutter click (identical to kMGQRegionalBehaviorShutterClick)
     */
    case keyEnforceCameraShutterClick

    /**
     Whether the device's region permits Google Mail (identical to kMGQRegionalBehaviorGoogleMail)
     */
    case keyEnforceGoogleMail

    /**
     MAC address for the device's ethernet interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keyEthernetMacAddress

    /**
     MAC address for the device's ethernet interface, as a CFData (6 bytes)
     */
    case keyEthernetMacAddressData

    /**
     Whether explicit content is currently restricted
     */
    case keyExplicitContentRestriction

    /**
     Whether the device can be externally charged
     */
    case keyExternalChargeCapability

    /**
     Whether an external power source is currently connected
     */
    case keyExternalPowerSourceConnected

    // MARK: F

    /**
     Whether the device's FDR data is sealed
     */
    case keyFDRSealingStatus

    /**
     Whether the FMFAllowed allowed on this device
     */
    case keyFMFAllowed

    /**
     Back camera's temporal noise reduction value
     */
    case keyFaceTimeBackCameraTemporalNoiseReductionMode

    /**
     The preferred FaceTime bitrate when communicating over a 2G network
     */
    case keyFaceTimeBitRate2G

    /**
     The preferred FaceTime bitrate when communicating over a 3G network
     */
    case keyFaceTimeBitRate3G

    /**
     The preferred FaceTime bitrate when communicating over an LTE network
     */
    case keyFaceTimeBitRateLTE

    /**
     The preferred FaceTime bitrate when communicating over a WiFi network
     */
    case keyFaceTimeBitRateWiFi

    /**
     Whether the FaceTime camera requires fast switch
     */
    case keyFaceTimeCameraRequiresFastSwitchOptions

    /**
     Whether the device supports face detection in hardware
     */
    case keyFaceTimeCameraSupportsHardwareFaceDetection

    /**
     Supported decodings, array of dictionaries, W/H/F keys -> kCFNumberIntType values
     */
    case keyFaceTimeDecodings

    /**
     Supported encodings, array of dictionaries, W/H/F keys -> kCFNumberIntType values
     */
    case keyFaceTimeEncodings

    /**
     Front camera's temporal noise reduction value
     */
    case keyFaceTimeFrontCameraTemporalNoiseReductionMode

    /**
     Whether device should be opt-in for FaceTime Live Photos
     */
    case keyFaceTimePhotosOptIn

    /**
     Preferred decoding, dictionary of W/H/F keys -> kCFNumberIntType values
     */
    case keyFaceTimePreferredDecoding

    /**
     Preferred encoding, dictionary of W/H/F keys -> kCFNumberIntType values
     */
    case keyFaceTimePreferredEncoding

    /**
     The modem's firmware nonce data
     */
    case keyFirmwareNonce

    /**
     The preflight info from the modem used to personalize the BBFW image
     */
    case keyFirmwarePreflightInfo

    /**
     Project version of iBoot installed on the device
     */
    case keyFirmwareVersion

    /**
     Additional scaling of first-party launches
     */
    case keyFirstPartyLaunchTimeLimitScale

    /**
     Whether the device has a forward-facing camera
     */
    case keyForwardCameraCapability

    /**
     X [ long width ] and Y [ short height ] offset of front camera from center of display
     */
    case keyFrontCameraOffsetFromDisplayCenter

    /**
     Array of pitch, yaw and roll for the front camera based on the normal to the screen.
     */
    case keyFrontCameraRotationFromDisplayNormal

    /**
     Whether the device's front camera supports auto HDR
     */
    case keyFrontFacingCameraAutoHDRCapability

    /**
     Whether the device's front camera supports burst mode
     */
    case keyFrontFacingCameraBurstCapability

    /**
     Whether the device has a forward-facing camera (identical to kMGQForwardCameraCapability)
     */
    case keyFrontFacingCameraCapability

    /**
     Whether the device's front camera supports HDR
     */
    case keyFrontFacingCameraHDRCapability

    /**
     Whether the device can have hdr set for the front facing camera
     */
    case keyFrontFacingCameraHDROnCapability

    /**
     Whether the device's front camera supports HFR (high frame rate, a.k.a. slow motion)
     */
    case keyFrontFacingCameraHFRCapability

    /**
     Max HFR(slowmo)for Front Facing 1080p Camera
     */
    case keyFrontFacingCameraHFRVideoCapture1080pMaxFPS

    /**
     Max HFR(slowmo)for Front Facing 720p Camera
     */
    case keyFrontFacingCameraHFRVideoCapture720pMaxFPS

    /**
     The device's front camera max video zoom factor
     */
    case keyFrontFacingCameraMaxVideoZoomFactor

    /**
     Serial number of front facing RGB camera
     */
    case keyFrontFacingCameraModuleSerialNumber

    /**
     Max Single Frame Duration for Front Facing Camera in Burst Mode
     */
    case keyFrontFacingCameraStillDurationForBurst

    /**
     Max FPS for Front Facing Camera - 1080p resolution
     */
    case keyFrontFacingCameraVideoCapture1080pMaxFPS

    /**
     Max FPS for Front Facing Camera - 4k resolution
     */
    case keyFrontFacingCameraVideoCapture4kMaxFPS

    /**
     Max FPS for Front Facing Camera - 720p resolution
     */
    case keyFrontFacingCameraVideoCapture720pMaxFPS

    /**
     Serial number of front facing IR camera
     */
    case keyFrontFacingIRCameraModuleSerialNumber

    /**
     Serial number of front facing IR dot projector
     */
    case keyFrontFacingIRStructuredLightProjectorModuleSerialNumber

    /**

     */
    case keyFull6FeaturesCapability

    // MARK: G

    /**
     Whether the device is capable of using GPS
     */
    case keyGPSCapability

    /**
     Device name for the device (as historically returned by GS; differs from kMGQDeviceName)
     */
    case keyGSDeviceName

    /**
     Whether the device supports GameKit
     */
    case keyGameKitCapability

    /**
     Whether the device has a gas gauge battery
     */
    case keyGasGaugeBatteryCapability

    /**
     Whether the device is GreenTea, i.e., is a Chinese region cellular device
     */
    case keyGreenTeaDeviceCapability

    /**
     Whether the device has a gyroscope
     */
    case keyGyroscopeCapability

    // MARK: H

    /**
     Whether the device supports H264 encoding
     */
    case keyH264EncoderCapability

    /**
     Whether the device supports HDR image capture
     */
    case keyHDRImageCaptureCapability

    /**
     Whether the device supports HD video capture
     */
    case keyHDVideoCaptureCapability

    /**
     Whether the device supports HEVCDecode @ 10 bits
     */
    case keyHEVCDecoder10bitSupported

    /**
     Whether the device supports HEVCDecode @ 12 bits
     */
    case keyHEVCDecoder12bitSupported

    /**
     Whether the device supports HEVCDecode @ 8 bits
     */
    case keyHEVCDecoder8bitSupported

    /**
     Whether the device supports HEVC encoding
     */
    case keyHEVCEncodingCapability

    /**
     ARKit's refresh rate for HME
     */
    case keyHMERefreshRateInARKit

    /**
     Hardware model for this device. E.g., "N53AP"
     */
    case keyHWModelStr

    /**
     Whether the device has Hall Effect Sensor
     */
    case keyHallEffectSensorCapability

    /**
     Whether the device supports encoding image snapshots in hardware
     */
    case keyHardwareEncodeSnapshotsCapability

    /**
     Whether the device supports hardware keyboards
     */
    case keyHardwareKeyboardCapability

    /**
     Hardware platform of the SoC, e.g., "s5l8960x" for N53
     */
    case keyHardwarePlatform

    /**

     */
    case keyHardwareSnapshotsRequirePurpleGfxCapability

    /**

     */
    case keyHasAllFeaturesCapability

    /**
     Whether the device has an ANE
     */
    case keyHasAppleNeuralEngine

    /**
     Whether the device has a baseband
     */
    case keyHasBaseband

    /**
     Whether the device has internal battery
     */
    case keyHasBattery

    /**
     Dali mode support
     */
    case keyHasDaliMode

    /**
     Returns whether or not the device is capable of outputting Extended Color (wide gamut). For devices with a built-in display, this refers to the capability of the built-in display. For devices without a case keybuilt-in display, such as Apple TV, this refers to the output capability of the device, which might not be the same as the capability of the display that the device is currently connected to.
     */
    case keyHasExtendedColorDisplay

    /**
     Does this device have Icefall
     */
    case keyHasIcefall

    /**
     Whether the device has the internal settings bundle
     */
    case keyHasInternalSettingsBundle

    /**
     Whether the device supports Mesa/x162
     */
    case keyHasMesa

    /**
     Whether the device has a PKA (Public Key Accelerator)
     */
    case keyHasPKA

    /**
     Whether the device has an SEP
     */
    case keyHasSEP

    /**
     Whether the device has SpringBoard.app
     */
    case keyHasSpringBoard

    /**
     Whether the device has a thin bezel
     */
    case keyHasThinBezel

    /**
     Whether the device has HealthKit capability
     */
    case keyHealthKitCapability

    /**

     */
    case keyHearingAidAudioEqualizationCapability

    /**

     */
    case keyHearingAidLowEnergyAudioCapability

    /**

     */
    case keyHearingAidPowerReductionCapability

    /**
     Whether the device has a hi-dpi (Retina) display
     */
    case keyHiDPICapability

    /**

     */
    case keyHiccoughInterval

    /**

     */
    case keyHideNonDefaultApplicationsCapability

    /**
     The highest resolution video mode the device supports
     */
    case keyHighestSupportedVideoMode

    /**
     returns an enum that describes the home button type
     */
    case keyHomeButtonType

    /**

     */
    case keyHomeScreenWallpaperCapability

    // MARK: I

    /**
     Whether the device has iAP2 capability
     */
    case keyIAP2Capability

    /**
     Does the device support IDAM
     */
    case keyIDAMCapability

    /**

     */
    case keyIOSurfaceBackedImagesCapability

    /**
     Dictionary of all supported IOSurface formats variables
     */
    case keyIOSurfaceFormatDictionary

    /**
     Icefall serial number as NSString. Requires com.apple.nfcd.info && com.apple.nfcd.hwmanager entitlement.
     */
    case keyIceFallID

    /**
     Icefall is/isn't in restricted mode Requires com.apple.nfcd.info && com.apple.nfcd.hwmanager entitlement.
     */
    case keyIcefallInRestrictedMode

    /**
     Icefall information as NSData. Requires com.apple.nfcd.info && com.apple.nfcd.hwmanager entitlement.
     */
    case keyIcefallInfo

    /**
     Crypto hash method from device tree.
     */
    case keyImage4CryptoHashMethod

    /**
     Whether the device is Image4-aware
     */
    case keyImage4Supported

    /**
     Whether the device is in Diagnostics Mode (entered by a keychord)
     */
    case keyInDiagnosticsMode

    /**
     The SIM card's ICCID
     */
    case keyIntegratedCircuitCardIdentifier

    /**
     The secondary SIM card's ICCID
     */
    case keyIntegratedCircuitCardIdentifier2

    /**
     Whether the installed OS is an internal build
     */
    case keyInternalBuild

    /**
     IMEI of the device's baseband, if any
     */
    case keyInternationalMobileEquipmentIdentity

    /**
     IMEI2 of the device's baseband, if any
     */
    case keyInternationalMobileEquipmentIdentity2

    /**
     Whether the device has the international settings capability
     */
    case keyInternationalSettingsCapability

    /**
     UDID reversed
     */
    case keyInverseDeviceID

    /**
     Whether the device is an emulated device
     */
    case keyIsEmulatedDevice

    /**
     Phone format factor
     */
    case keyIsLargeFormatPhone

    /**

     */
    case keyIPadCapability

    /**
     Whether the device's power button is opposed to volume button.
     */
    case keyIsPwrOpposedVol

    /**
     [factory purpose]To distinguish customer/AppleCare service part device
     */
    case keyIsServicePart

    /**
     Whether the OS is running inside the simulator
     */
    case keyIsSimulator

    /**
     Whether or not the device currently has enough battery charge remaining to perform an OTA software update
     */
    case keyIsThereEnoughBatteryLevelForSoftwareUpdate

    /**
     Whether the OS installation is a UI build according to SystemVersion.plist
     */
    case keyIsUIBuild

    /**
     The number that iTunes uses to identify device classes
     */
    case keyITunesFamilyID

    // MARK: J

    /**
     returns the device's Jasper Serial Number
     */
    case keyJasperSerialNumber

    // MARK: L

    /**

     */
    case keyLTEDeviceCapability

    /**
     Whether a device supports watchdog scaling
     */
    case keyLaunchTimeLimitScaleSupported

    /**
     Whether the device has lisa capability
     */
    case keyLisaCapability

    /**

     */
    case keyLoadThumbnailsWhileScrollingCapability

    /**
     Localized name of the device
     */
    case keyLocalizedDeviceNameString

    /**
     Whether the device is supports reminder locations
     */
    case keyLocationRemindersCapability

    /**
     Whether location services are available on this device
     */
    case keyLocationServicesCapability

    /**
     Low power wallet mode. Return value is true if the device tree entry present and it is non zero.
     */
    case keyLowPowerWalletMode

    /**
     Device's Luna Flex Serial Number
     */
    case keyLunaFlexSerialNumber

    /**
     Lynx Public Key
     */
    case keyLynxPublicKey

    /**
     Lynx Serial Number
     */
    case keyLynxSerialNumber

    // MARK: M

    /**
     Serial number of the device's MLB
     */
    case keyMLBSerialNumber

    /**
     Whether the device has the MMS capability
     */
    case keyMMSCapability

    /**
     [BridgeOS only] returns a dictionary of keys that need to be exposed on the intel side
     */
    case keyMacBridgingKeys

    /**
     Whether the device is capable of using a magnetometer
     */
    case keyMagnetometerCapability

    /**
     Main screen rotation as it is in dev tree. Return type is int32.
     */
    case keyMainDisplayRotation

    /**
     Returns main screen canvas sizes in CFDataRef as an array of CGSizes. CFDataRef.length / sizeof(CGSize) is the number of entries
     */
    case keyMainScreenCanvasSizes

    /**
     Device's screen class (one of the MGScreenClass enum values)
     */
    case keyMainScreenClass

    /**
     Height of the built-in screen in pixels
     */
    case keyMainScreenHeight

    /**
     Physical orientation of the built-in screen relative to the device enclosure in radians
     */
    case keyMainScreenOrientation

    /**
     Pitch of the built-in screen in PPI
     */
    case keyMainScreenPitch

    /**
     Display scale of the built-in screen
     */
    case keyMainScreenScale

    /**
     Device's static screen info (used internally by MobileGestalt; format is opaque and should not be interpreted by clients)
     */
    case keyMainScreenStaticInfo

    /**
     Width of the built-in screen in pixels
     */
    case keyMainScreenWidth

    /**
     Marketing name of the device
     */
    case keyMarketingNameString

    /**
     OS Product Name for the device type - may be different from ProductName
     */
    case keyMarketingProductName

    /**
     MarketingVersion from /System/Library/CoreServices/SystemVersion.plist
     */
    case keyMarketingVersion

    /**
     The maximum H.264 level that the device can play
     */
    case keyMaxH264PlaybackLevel

    /**
     Display maximum scale of the screen - ATV Only
     */
    case keyMaximumScreenScale

    /**
     Whether the device supports Medusa Floating Live Apps
     */
    case keyMedusaFloatingLiveAppCapability

    /**
     Whether the device supports Medusa Overlay Apps
     */
    case keyMedusaOverlayAppCapability

    /**
     Whether the device supports MedusaPIP mirroring
     */
    case keyMedusaPIPCapability

    /**
     Whether the device supports Medusa Pinned Apps
     */
    case keyMedusaPinnedAppCapability

    /**
     The serial number of this device's Mesa sensor module, if any
     */
    case keyMesaSerialNumber

    /**
     Whether the device has Metal capability
     */
    case keyMetalCapability

    /**
     Whether a microphone is available on this device
     */
    case keyMicrophoneCapability

    /**
     The number of microphones in this device
     */
    case keyMicrophoneCount

    /**
     The minimum version of iTunes that this device can sync with
     */
    case keyMinimumSupportediTunesVersion

    /**
     Whether every boot stage needs to verify the boot-manifest
     */
    case keyMixAndMatchPrevention

    /**
     The minimum MobileDevice bundle version needed to restore this device.
     */
    case keyMobileDeviceMinimumVersion

    /**
     The unique CDMA identifier for this device
     */
    case keyMobileEquipmentIdentifier

    /**
     Mobile equipment info base ID
     */
    case keyMobileEquipmentInfoBaseId

    /**
     Mobile equipment info base profile
     */
    case keyMobileEquipmentInfoBaseProfile

    /**
     Mobile equipment info base version
     */
    case keyMobileEquipmentInfoBaseVersion

    /**
     Mobile equipment info CSN
     */
    case keyMobileEquipmentInfoCSN

    /**
     Mobile equipment info displayCSN
     */
    case keyMobileEquipmentInfoDisplayCSN

    /**
     The subscriber's last known country code string
     */
    case keyMobileSubscriberCountryCode

    /**
     The subscriber's network code string, or for GSM, the second three digits of the IMSI
     */
    case keyMobileSubscriberNetworkCode

    /**
     Whether the device has wifi. Devices in certain regions may have wifi disabled
     */
    case keyMobileWifi

    /**
     Device's model number
     */
    case keyModelNumber

    /**
     Is the device a low end Monarch hardware
     */
    case keyMonarchLowEndHardware

    /**
     MultiLynx Public Key Array
     */
    case keyMultiLynxPublicKeyArray

    /**
     MultiLynx Serial Number Array
     */
    case keyMultiLynxSerialNumberArray

    /**
     Whether the device supports multitasking
     */
    case keyMultitaskingCapability

    /**
     Whether the device supports gestures to control multitasking
     */
    case keyMultitaskingGesturesCapability

    /**
     Whether the device supports the Music Store
     */
    case keyMusicStoreCapability

    // MARK: N

    /**
     Whether the device is an N78a. This key is a HACK that exists only because the N78a board id is identical to the N78 board id
     */
    case keyN78aHack

    /**
     NFC Radio Present
     */
    case keyNFCRadio

    /**
     NFC radio callibration data as CFDataRef
     */
    case keyNFCRadioCalibrationDataPresent

    /**
     UniqueID for FDR
     */
    case keyNFCUniqueChipID

    /**
     Dictionary of all nvram variables
     */
    case keyNVRAMDictionary

    /**
     UID of NVMe controller
     */
    case keyNandControllerUID

    /**
     The device's Navajo fusing state
     */
    case keyNavajoFusingState

    /**
     Whether the device has the Nike iPod capability
     */
    case keyNikeIpodCapability

    /**
     Whether the device is not a Green Tea device, i.e., does not have a Chinese region code
     */
    case keyNotGreenTeaDeviceCapability

    // MARK: O

    /**
     Whether the device has OLED display
     */
    case keyOLEDDisplay

    /**

     */
    case keyOTAActivationCapability

    /**
     Whether the device supports off-line (on-device) dictation
     */
    case keyOfflineDictationCapability

    /**
     Whether OpenGL Embedded Standard 1 is available on this device
     */
    case keyOpenGLES1Capability

    /**
     Whether OpenGL Embedded Standard 2 is available on this device
     */
    case keyOpenGLES2Capability

    /**
     Whether OpenGL Embedded Standard 3 is available on this device
     */
    case keyOpenGLES3Capability

    /**
     Device's maximum supported OpenGL ES version (possibly but not necessarily one of the MGOpenGLESVersion enum values)
     */
    case keyOpenGLESVersion

    // MARK: P

    /**

     */
    case keyPTPLargeFilesCapability

    /**
     Serial Number of Display Panel (via sysconfig - CFString Format)
     */
    case keyPanelSerialNumber

    /**
     Whether the device supports panoramas in Camera.app
     */
    case keyPanoramaCameraCapability

    /**
     Partitioning scheme used on the device's storage
     */
    case keyPartitionType

    /**
     Whether the device has a PIN/password configured
     */
    case keyPasswordConfigured

    /**
     Whether the device is currenty locked
     */
    case keyPasswordProtected

    /**
     Whether the device has a pearl camera
     */
    case keyPearlCameraCapability

    /**
     Whether the device supports Pearl ID
     */
    case keyPearlIDCapability

    /**
     Whether the device supports Peek-UI
     */
    case keyPeekUICapability

    /**
     Width of the screen area exposed by one flap of a smart cover in pixels
     */
    case keyPeekUIWidth

    /**

     */
    case keyPeer2PeerCapability

    /**
     Whether the device can act as a personal hotspot
     */
    case keyPersonalHotspotCapability

    /**
     PhoneNumber
     */
    case keyPhoneNumber

    /**
     PhoneNumber2
     */
    case keyPhoneNumber2

    /**
     Whether the device has Phosphorus capability
     */
    case keyPhosphorusCapability

    /**

     */
    case keyPhotoAdjustmentsCapability

    /**
     Convenience function to check if we have a camera and if it isn't restricted
     */
    case keyPhotoCapability

    /**
     Whether the device supports Photo Sharing
     */
    case keyPhotoSharingCapability

    /**
     Whether the device supports Photo Stream
     */
    case keyPhotoStreamCapability

    /**
     Whether the device supports post effects
     */
    case keyPhotosPostEffectsCapability

    /**
     Whether the device has a piezo clicker
     */
    case keyPiezoClickerCapability

    /**
     MAC address for the device's Pinto interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keyPintoMacAddress

    /**
     MAC address for the device's Pinto interface, as a CFData (6 bytes)
     */
    case keyPintoMacAddressData

    /**
     Whether the device supports pipelined still image processing
     */
    case keyPipelinedStillImageProcessingCapability

    /**

     */
    case keyPlatformStandAloneContactsCapability

    /**
     Whether the device has PlatinumCapability
     */
    case keyPlatinumCapability

    /**
     The product hash, an identifier that uniquely identifies the device type
     */
    case keyProductHash

    /**
     ProductName from /System/Library/CoreServices/SystemVersion.plist
     */
    case keyProductName

    /**
     Product type of this device. E.g., "iPhone6,2" for N53
     */
    case keyProductType

    /**
     Version number of the installed OS, e.g., "4.2" for Jasper
     */
    case keyProductVersion

    /**
     Proximity sensor calibration data
     */
    case keyProximitySensorCalibration

    /**
     Proximity sensor calibration dictionary
     */
    case keyProximitySensorCalibrationDictionary

    /**
     Whether the device has a proximity sensor
     */
    case keyProximitySensorCapability

    // MARK: R

    /**
     The SAR (Specific Absorption Rate) separation distance for the device's radios in millimeters
     */
    case keyRFExposureSeparationDistance

    /**
     Serial Number of Display Panel (directly from the Hardware - CFDataFormat)
     */
    case keyRawPanelSerialNumber

    /**
     Whether the device has a rear-facing camera
     */
    case keyRearCameraCapability

    /**
     X [ long width ] and Y [ short height ] offset of rear camera from center of display
     */
    case keyRearCameraOffsetFromDisplayCenter

    /**
     Whether the device's rear camera is capable of 60FPS video capturing.
     */
    case keyRearFacingCamera60fpsVideoCaptureCapability

    /**
     Whether the device's rear camera supports auto HDR
     */
    case keyRearFacingCameraAutoHDRCapability

    /**
     Whether the device's rear camera supports burst mode
     */
    case keyRearFacingCameraBurstCapability

    /**
     Whether the device has a rear-facing camera (identical to kMGQRearCameraCapability)
     */
    case keyRearFacingCameraCapability

    /**
     Whether the device's rear camera supports HDR
     */
    case keyRearFacingCameraHDRCapability

    /**
     Whether the device can have hdr set for the rear facing camera
     */
    case keyRearFacingCameraHDROnCapability

    /**
     Whether the device's rear camera supports HFR (high frame rate, a.k.a. slow motion)
     */
    case keyRearFacingCameraHFRCapability

    /**
     Max HFR(slowmo)for Rear Facing 1080p Camera
     */
    case keyRearFacingCameraHFRVideoCapture1080pMaxFPS

    /**
     Max HFR(slowmo)for Rear Facing 720p Camera
     */
    case keyRearFacingCameraHFRVideoCapture720pMaxFPS

    /**
     The device's rear camera max video zoom factor
     */
    case keyRearFacingCameraMaxVideoZoomFactor

    /**
     Serial number of rear facing RGB camera module
     */
    case keyRearFacingCameraModuleSerialNumber

    /**
     Max Single Frame Duration for Rear Facing Camera in Burst Mode
     */
    case keyRearFacingCameraStillDurationForBurst

    /**
     Rear camera has super wide capability.
     */
    case keyRearFacingCameraSuperWideCameraCapability

    /**
     Publicly available key for Jasper capability / depth camera
     */
    case keyRearFacingCameraTimeOfFlightCameraCapability

    /**
     Max FrameRate for Rear Facing 1080p Camera
     */
    case keyRearFacingCameraVideoCapture1080pMaxFPS

    /**
     Max FrameRate for Rear Facing 4k Camera
     */
    case keyRearFacingCameraVideoCapture4kMaxFPS

    /**
     Max FrameRate for Rear Facing 720p Camera
     */
    case keyRearFacingCameraVideoCapture720pMaxFPS

    /**
     Video capture frame rate for rear facing camera in FPS.
     */
    case keyRearFacingCameraVideoCaptureFPS

    /**
     Whether the device has low-light support on rear-facing camera
     */
    case keyRearFacingLowLightCameraCapability

    /**
     Serial number of rear facing super wide camera module
     */
    case keyRearFacingSuperWideCameraModuleSerialNumber

    /**
     Does the Rear Facing Camera have Telephoto Capability
     */
    case keyRearFacingTelephotoCameraCapability

    /**
     Serial number of rear facing telephoto camera module
     */
    case keyRearFacingTelephotoCameraModuleSerialNumber

    /**
     Installed RecoveryOS version
     */
    case keyRecoveryOSVersion

    /**
     Region code for the device. E.g., "LL" in North America
     */
    case keyRegionCode

    /**
     Region info for the device. E.g., "LL/A" in North America
     */
    case keyRegionInfo

    /**
     Whether Cinnamon is supported for this region
     */
    case keyRegionSupportsCinnamon

    /**
     All the kMGQRegionalBehavior* keys and their values
     */
    case keyRegionalBehaviorAll

    /**
     Whether the device's region requires ChinaBrick
     */
    case keyRegionalBehaviorChinaBrick

    /**
     Whether the device's region enforces the EU volume limit
     */
    case keyRegionalBehaviorEUVolumeLimit

    /**
     Whether the device's region requires GB 18030 support
     */
    case keyRegionalBehaviorGB18030

    /**
     Whether the device's region permits Google Mail
     */
    case keyRegionalBehaviorGoogleMail

    /**
     Whether the device's region requires NTSC video output
     */
    case keyRegionalBehaviorNTSC

    /**
     Whether the device's region does not permit location tiles on the passcode screen
     */
    case keyRegionalBehaviorNoPasscodeLocationTiles

    /**
     Whether the device's region does not permit VOIP
     */
    case keyRegionalBehaviorNoVOIP

    /**
     Whether the device's region does not permit WiFi
     */
    case keyRegionalBehaviorNoWiFi

    /**
     Whether the device's region enforces a shutter click
     */
    case keyRegionalBehaviorShutterClick

    /**
     Whether the device's regional behavior values are valid
     */
    case keyRegionalBehaviorValid

    /**
     Whether the device's region enforces the French volume limit
     */
    case keyRegionalBehaviorVolumeLimit

    /**
     The device's regulatory model number (used to determine which regulatory image to display)
     */
    case keyRegulatoryModelNumber

    /**
     Type of system image installed on the device, one of the kMGReleaseType* constants (NULL for user installs)
     */
    case keyReleaseType

    /**
     Remote Bluetooth address, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keyRemoteBluetoothAddress

    /**
     Remote Bluetooth address, as a CFData (6 bytes)
     */
    case keyRemoteBluetoothAddressData

    /**
     Does device support rendering Wide Gamut Images at display time
     */
    case keyRenderWideGamutImagesAtDisplayTime

    /**
     Whether the device supports letterpress fast rendering
     */
    case keyRendersLetterPressSlowly

    /**
     Battery level percentage (kCFNumberFloatType) needed to perform an OTA software update
     */
    case keyRequiredBatteryLevelForSoftwareUpdate

    /**
     Whether the device is running RestoreOS
     */
    case keyRestoreOSBuild

    /**
     Restricted country codes list
     */
    case keyRestrictedCountryCodes

    /**
     Whether the device has a ringer switch
     */
    case keyRingerSwitchCapability

    /**
     Serial Number of Ambient Light Sensor (directly from the Hardware - CFString)
     */
    case keyRosalineSerialNumber

    /**
     Roswell serial number
     */
    case keyRoswellChipID

    /**
     Current Rotate To Wake Status (is the driver loaded yet)
     */
    case keyRotateToWakeStatus

    // MARK: S

    /**
     Whether sensitive UI is allowed in SpringBoard (identical to kMGQSensitiveUICapability)
     */
    case keySBAllowSensitiveUI

    /**
     Whether the installed build is a carrier build but not an internal build
     */
    case keySBCanForceDebuggingInfo

    /**
     IOSDIOProductID and IOSDIOManufacturerID as CFStrings
     */
    case keySDIOManufacturerTuple

    /**
     SDIO product info
     */
    case keySDIOProductInfo

    /**
     SE information as CFData. Requires com.apple.nfcd.info && com.apple.nfcd.hwmanager entitlement.
     */
    case keySEInfo

    /**
     Nonce from SEP for personalization
     */
    case keySEPNonce

    /**
     Whether the device supports SIM cards
     */
    case keySIMCapability

    /**
     Whether the device supports contacts stored in its SIM card
     */
    case keySIMPhonebookCapability

    /**
     The current status of the SIM
     */
    case keySIMStatus

    /**
     The current status of the SIM2
     */
    case keySIMStatus2

    /**
     The current status of the SIM tray
     */
    case keySIMTrayStatus

    /**
     The current status of the SIM2 tray
     */
    case keySIMTrayStatus2

    /**
     Whether the device is capable of SMS messaging
     */
    case keySMSCapability

    /**
     returns the device's Savage ChipID
     */
    case keySavageChipID

    /**
     Keys and values for Savage personalization
     */
    case keySavageInfo

    /**
     returns the device's Savage Serial Number
     */
    case keySavageSerialNumber

    /**
     Returns the device's Savage UID
     */
    case keySavageUID

    /**
     Various attributes of the built-in screen
     */
    case keyScreenDimensionsCapability

    /**
     Screen Recorder Framework Availability
     */
    case keyScreenRecorderCapability

    /**
     Serial Number of LCM (extracted from RawPanelSerialNumber)
     */
    case keyScreenSerialNumber

    /**
     MAC address for the device's secondary bluetooth interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keySecondaryBluetoothMacAddress

    /**
     MAC address for the device's secondary bluetooth interface, as a CFData (6 bytes)
     */
    case keySecondaryBluetoothMacAddressData

    /**
     MAC address for the device's secondary ethernet interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keySecondaryEthernetMacAddress

    /**
     MAC address for the device's secondary ethernet interface, as a CFData (6 bytes)
     */
    case keySecondaryEthernetMacAddressData

    /**
     MAC address for the device's secondary wifi interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keySecondaryWifiMacAddress

    /**
     MAC address for the device's secondary wifi interface, as a CFData (6 bytes)
     */
    case keySecondaryWifiMacAddressData

    /**
     Whether the device has secure element
     */
    case keySecureElement

    /**
     SecureElement Serial Number Requires com.apple.nfcd.info && com.apple.nfcd.hwmanager entitlement.
     */
    case keySecureElementID

    /**
     Security domain of device's SoC
     */
    case keySecurityDomain

    /**
     Whether sensitive UI is allowed in SpringBoard
     */
    case keySensitiveUICapability

    /**
     Device's serial number
     */
    case keySerialNumber

    /**
     Whether the device supports ShoeBox (Passbook)
     */
    case keyShoeboxCapability

    /**
     Whether lockdown should hactivate the device
     */
    case keyShouldHactivate

    /**
     Does the device have SiKA support in hardware
     */
    case keySiKACapability

    /**
     Whether the device is production fused
     */
    case keySigningFuse

    /**
     Whether the device is a silicon bringup board
     */
    case keySiliconBringupBoard

    /**

     */
    case keySimultaneousCallAndDataCurrentlySupported

    /**

     */
    case keySimultaneousCallAndDataSupported

    /**

     */
    case keySiriGestureCapability

    /**
     Whether the device supports offline Siri
     */
    case keySiriOfflineCapability

    /**
     S-key button presence on the device
     */
    case keySkey

    /**
     Regional software behavior bits. Always exactly 16 bytes
     */
    case keySoftwareBehavior

    /**
     The software bundle version from SysCfg
     */
    case keySoftwareBundleVersion

    /**
     Software Dimming Alpha value
     */
    case keySoftwareDimmingAlpha

    /**
     MiGa calibration value for device's speaker.
     */
    case keySpeakerCalibrationMiGa

    /**
     SpGa calibration value for device's speaker.
     */
    case keySpeakerCalibrationSpGa

    /**
     SpTS calibration value for device's speaker.
     */
    case keySpeakerCalibrationSpTS

    /**
     Whether the device has Sphere
     */
    case keySphereCapability

    /**
     Whether the device supports Stark (preference-overrideable; see also kMGQDeviceSupportsCarIntegration)
     */
    case keyStarkCapability

    /**
     JCOP information as dictionary. Requires com.apple.nfcd.info && com.apple.nfcd.hwmanager entitlement.
     */
    case keyStockholmJcopInfo

    /**
     Keyboard models that trigger the alternate wake policy
     */
    case keyStrictWakeKeyboardCases

    /**
     Supported device families
     */
    case keySupportedDeviceFamilies

    /**
     List of languages for which keyboards are supported
     */
    case keySupportedKeyboards

    /**
     Whether the device has OLED display
     */
    case keySupportsBurninMitigation

    /**
     Whether the device can enable EDU MultiUser
     */
    case keySupportsEDUMU

    /**
     Device Supports Force Touch
     */
    case keySupportsForceTouch

    /**
     Device Supports Iris Capture
     */
    case keySupportsIrisCapture

    /**
     Whether the device supports Low Power Mode
     */
    case keySupportsLowPowerMode

    /**
     Perseus Support
     */
    case keySupportsPerseus

    /**
     Is the Device Rotate To Wake Capable
     */
    case keySupportsRotateToWake

    /**
     Does the Device support SOS service
     */
    case keySupportsSOS

    /**
     Whether the device's button is non-legacy mechanical type
     */
    case keySupportsSSHBButtonType

    /**
     Device Supports Touch Remote
     */
    case keySupportsTouchRemote

    /**
     The device's factory-programmed system configuration data
     */
    case keySysCfg

    /**
     The device's factory-programmed system configuration data as a dictionary
     */
    case keySysCfgDict

    /**
     UUID of the installed system image from the SystemVersion.plist
     */
    case keySystemImageID

    /**

     */
    case keySystemTelephonyOfAnyKindCapability

    // MARK: T

    /**

     */
    case keyTVOutCrossfadeCapability

    /**

     */
    case keyTVOutSettingsCapability

    /**
     Whether the device is capable of telephony
     */
    case keyTelephonyCapability

    /**

     */
    case keyTelephonyMaximumGeneration

    /**
     Whether the device supports hardware 1588 timestamp
     */
    case keyTimeSyncCapability

    /**
     Authentication chip serial number of top module
     */
    case keyTopModuleAuthChipID

    /**
     Does device deliver touches at 120Hz
     */
    case keyTouchDelivery120Hz

    /**
     Whether the device supports Mesa/x162 (identical to kMGQHasMesa)
     */
    case keyTouchIDCapability

    /**
     Tristar Id
     */
    case keyTristarID

    // MARK: U

    /**
     The device's desired background quality
     */
    case keyUIBackgroundQuality

    /**
     Whether the device supports parallax UI
     */
    case keyUIParallaxCapability

    /**
     Whether the device supports procedural wallpaper
     */
    case keyUIProceduralWallpaperCapability

    /**
     Whether the device needs to consider ui reachability
     */
    case keyUIReachability

    /**
     Whether the device supports UMTS
     */
    case keyUMTSDeviceCapability

    /**
     Whether the device has the unified iPod capability
     */
    case keyUnifiedIPodCapability

    /**
     Also known as ECID
     */
    case keyUniqueChipID

    /**
     UDID of the device
     */
    case keyUniqueDeviceID

    /**
     UDID of the device as a CFData
     */
    case keyUniqueDeviceIDData

    /**
     User assigned device name specific to this device
     */
    case keyUserAssignedDeviceName

    /**
     CGRect with User Intent button physical location and height
     */
    case keyUserIntentPhysicalButtonCGRect

    /**
     String version of CGRect with User Intent button physical location and height
     */
    case keyUserIntentPhysicalButtonCGRectString

    /**
     CGRect with User Intent button physical location and height
     */
    case keyUserIntentPhysicalButtonNormalizedCGRect

    // MARK: V

    /**
     Whether the device supports VOIP apps
     */
    case keyVOIPCapability

    /**
     Whether the device supports FaceTime over cellular
     */
    case keyVeniceCapability

    /**
     Whether the device has a vibrator
     */
    case keyVibratorCapability

    /**
     Whether the device is capable of taking videos
     */
    case keyVideoCameraCapability

    /**

     */
    case keyVideoStillsCapability

    /**
     Whether the device has voice control
     */
    case keyVoiceControlCapability

    /**
     Whether the device has volume buttons
     */
    case keyVolumeButtonCapability

    // MARK: W

    /**
     The device's weather graphic quality level
     */
    case keyWAGraphicQuality

    /**
     Whether the device supports WAPI
     */
    case keyWAPICapability

    /**
     Whether the device supports wlan backgound scan caching.
     */
    case keyWLANBkgScanCache

    /**
     WiFi Antenna SKU Info
     */
    case keyWSKU

    /**
     Whether the device has watch companion capability
     */
    case keyWatchCompanionCapability

    /**
     Whether the watch supports auto-playlist playback
     */
    case keyWatchSupportsAutoPlaylistPlayback

    /**
     Whether the watch supports high quality clock face graphics
     */
    case keyWatchSupportsHighQualityClockFaceGraphics

    /**
     Whether the watch supports siri with AOP
     */
    case keyWatchSupportsListeningOnGesture

    /**
     Whether the Watch supports music streaming
     */
    case keyWatchSupportsMusicStreaming

    /**
     Whether the watch supports Siri Watch Face Commute
     */
    case keyWatchSupportsSiriCommute

    /**
     Whether the device has WiFi calling capability.
     */
    case keyWiFiCallingCapability

    /**
     Whether the device has wifi. Devices in certain regions may have wifi disabled (identical to kMGQMobileWifi)
     */
    case keyWiFiCapability

    /**
     MAC address for the device's wifi interface, in the format "ff:ff:ff:ff:ff:ff" (lower case letters)
     */
    case keyWifiAddress

    /**
     MAC address for the device's wifi interface, as a CFData (6 bytes)
     */
    case keyWifiAddressData

    /**
     Watch WiFi antenna SKU version
     */
    case keyWifiAntennaSKUVersion

    /**
     Whether Wifi Calling on secondary devices is enabled
     */
    case keyWifiCallingSecondaryDeviceCapability

    /**
     The chipset of the wifi chip in this device
     */
    case keyWifiChipset

    /**
     Wifi Firmware Version
     */
    case keyWifiFirmwareVersion

    /**
     The vendor of the wifi chip in this device
     */
    case keyWifiVendor

    /**
     Serial number of the device's wifi board. Not to be confused with the device serial number (kMGQSerialNumber) or the baseband's serial number (kMGQBasebandSerialNumber)
     */
    case keyWirelessBoardSnum

    /**
     Whether the device has wireless charging capability.
     */
    case keyWirelessChargingCapability

    // MARK: Y

    /**
     Returns the device's Yonkers ChipID
     */
    case keyYonkersChipID

    /**
     Returns the device's Yonkers Serial Number
     */
    case keyYonkersSerialNumber

    /**
     Returns the device's Yonkers UID
     */
    case keyYonkersUID

    /**
     Whether YouTube is allowed on this device (identical to kMGQAllowYouTube)
     */
    case keyYouTubeCapability

    /**
     Whether the YouTube plugin is allowed on this device (identical to kMGQAllowYouTubePlugin)
     */
    case keyYouTubePluginCapability

    // MARK: - Unknown

    /**
     Custom
     */
    case unknown(String)
}
