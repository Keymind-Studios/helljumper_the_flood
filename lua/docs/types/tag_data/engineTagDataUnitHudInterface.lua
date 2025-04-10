---@class EngineTagUnitHUDInterfacePanelTypeEnum : Enum 

---@class EngineTagUnitHUDInterfacePanelTypeIntegratedLight : EngineTagUnitHUDInterfacePanelTypeEnum 

---@alias EngineTagUnitHUDInterfacePanelType 
---| EngineTagUnitHUDInterfacePanelTypeIntegratedLight

---@class EngineTagUnitHUDInterfacePanelTypeTable 
---@field typeIntegratedLight EngineTagUnitHUDInterfacePanelTypeIntegratedLight
Engine.tag.unitHUDInterfacePanelType = {} 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlayFlags 
---@field useTeamColor boolean 

---@class MetaEngineTagDataUnitHUDInterfaceHUDSoundLatchedTo 
---@field shieldRecharging boolean 
---@field shieldDamaged boolean 
---@field shieldLow boolean 
---@field shieldEmpty boolean 
---@field healthLow boolean 
---@field healthEmpty boolean 
---@field healthMinorDamage boolean 
---@field healthMajorDamage boolean 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanelMeterMoreFlags 
---@field showOnlyWhenActive boolean 
---@field flashOnceIfActivatedWhileDisabled boolean 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field interfaceBitmap MetaEngineTagDependency 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field sequenceIndex MetaEngineIndex 
---@field multitexOverlay TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field type EngineTagDataUnitHUDInterfacePanelType 
---@field flags MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlayFlags 

---@class MetaEngineTagDataUnitHUDInterfaceHUDSound 
---@field sound MetaEngineTagDependency 
---@field latchedTo MetaEngineTagDataUnitHUDInterfaceHUDSoundLatchedTo 
---@field scale number 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanel 
---@field type EngineTagDataUnitHUDInterfacePanelType 
---@field backgroundAnchorOffset MetaEnginePoint2DInt 
---@field backgroundWidthScale number 
---@field backgroundHeightScale number 
---@field backgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field backgroundInterfaceBitmap MetaEngineTagDependency 
---@field backgroundDefaultColor MetaEngineColorARGBInt 
---@field backgroundFlashingColor MetaEngineColorARGBInt 
---@field backgroundFlashPeriod number 
---@field backgroundFlashDelay number 
---@field backgroundNumberOfFlashes integer 
---@field backgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field backgroundFlashLength number 
---@field backgroundDisabledColor MetaEngineColorARGBInt 
---@field backgroundSequenceIndex MetaEngineIndex 
---@field backgroundMultitexOverlay TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field meterAnchorOffset MetaEnginePoint2DInt 
---@field meterWidthScale number 
---@field meterHeightScale number 
---@field meterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field meterMeterBitmap MetaEngineTagDependency 
---@field meterColorAtMeterMinimum MetaEngineColorARGBInt 
---@field meterColorAtMeterMaximum MetaEngineColorARGBInt 
---@field meterFlashColor MetaEngineColorARGBInt 
---@field meterEmptyColor MetaEngineColorARGBInt 
---@field meterFlags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field meterMinimumMeterValue integer 
---@field meterSequenceIndex MetaEngineIndex 
---@field meterAlphaMultiplier integer 
---@field meterAlphaBias integer 
---@field meterValueScale integer 
---@field meterOpacity number 
---@field meterTranslucency number 
---@field meterDisabledColor MetaEngineColorARGBInt 
---@field meterMinAlpha number 
---@field meterMinimumFractionCutoff number 
---@field meterMoreFlags MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanelMeterMoreFlags 

---@class MetaEngineTagDataUnitHudInterface 
---@field anchor EngineTagDataHUDInterfaceAnchor 
---@field hudBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field hudBackgroundWidthScale number 
---@field hudBackgroundHeightScale number 
---@field hudBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field hudBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field hudBackgroundDefaultColor MetaEngineColorARGBInt 
---@field hudBackgroundFlashingColor MetaEngineColorARGBInt 
---@field hudBackgroundFlashPeriod number 
---@field hudBackgroundFlashDelay number 
---@field hudBackgroundNumberOfFlashes integer 
---@field hudBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field hudBackgroundFlashLength number 
---@field hudBackgroundDisabledColor MetaEngineColorARGBInt 
---@field hudBackgroundSequenceIndex MetaEngineIndex 
---@field hudBackgroundMultitexOverlay TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field shieldPanelBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field shieldPanelBackgroundWidthScale number 
---@field shieldPanelBackgroundHeightScale number 
---@field shieldPanelBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field shieldPanelBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field shieldPanelBackgroundDefaultColor MetaEngineColorARGBInt 
---@field shieldPanelBackgroundFlashingColor MetaEngineColorARGBInt 
---@field shieldPanelBackgroundFlashPeriod number 
---@field shieldPanelBackgroundFlashDelay number 
---@field shieldPanelBackgroundNumberOfFlashes integer 
---@field shieldPanelBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field shieldPanelBackgroundFlashLength number 
---@field shieldPanelBackgroundDisabledColor MetaEngineColorARGBInt 
---@field shieldPanelBackgroundSequenceIndex MetaEngineIndex 
---@field shieldPanelBackgroundMultitexOverlay TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field shieldPanelMeterAnchorOffset MetaEnginePoint2DInt 
---@field shieldPanelMeterWidthScale number 
---@field shieldPanelMeterHeightScale number 
---@field shieldPanelMeterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field shieldPanelMeterMeterBitmap MetaEngineTagDependency 
---@field shieldPanelMeterColorAtMeterMinimum MetaEngineColorARGBInt 
---@field shieldPanelMeterColorAtMeterMaximum MetaEngineColorARGBInt 
---@field shieldPanelMeterFlashColor MetaEngineColorARGBInt 
---@field shieldPanelMeterEmptyColor MetaEngineColorARGBInt 
---@field shieldPanelMeterFlags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field shieldPanelMeterMinimumMeterValue integer 
---@field shieldPanelMeterSequenceIndex MetaEngineIndex 
---@field shieldPanelMeterAlphaMultiplier integer 
---@field shieldPanelMeterAlphaBias integer 
---@field shieldPanelMeterValueScale integer 
---@field shieldPanelMeterOpacity number 
---@field shieldPanelMeterTranslucency number 
---@field shieldPanelMeterDisabledColor MetaEngineColorARGBInt 
---@field shieldPanelMeterMinAlpha number 
---@field shieldPanelMeterOverchargeMinimumColor MetaEngineColorARGBInt 
---@field shieldPanelMeterOverchargeMaximumColor MetaEngineColorARGBInt 
---@field shieldPanelMeterOverchargeFlashColor MetaEngineColorARGBInt 
---@field shieldPanelMeterOverchargeEmptyColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field healthPanelBackgroundWidthScale number 
---@field healthPanelBackgroundHeightScale number 
---@field healthPanelBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field healthPanelBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field healthPanelBackgroundDefaultColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundFlashingColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundFlashPeriod number 
---@field healthPanelBackgroundFlashDelay number 
---@field healthPanelBackgroundNumberOfFlashes integer 
---@field healthPanelBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field healthPanelBackgroundFlashLength number 
---@field healthPanelBackgroundDisabledColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundSequenceIndex MetaEngineIndex 
---@field healthPanelBackgroundMultitexOverlay TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field healthPanelMeterAnchorOffset MetaEnginePoint2DInt 
---@field healthPanelMeterWidthScale number 
---@field healthPanelMeterHeightScale number 
---@field healthPanelMeterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field healthPanelMeterMeterBitmap MetaEngineTagDependency 
---@field healthPanelMeterColorAtMeterMinimum MetaEngineColorARGBInt 
---@field healthPanelMeterColorAtMeterMaximum MetaEngineColorARGBInt 
---@field healthPanelMeterFlashColor MetaEngineColorARGBInt 
---@field healthPanelMeterEmptyColor MetaEngineColorARGBInt 
---@field healthPanelMeterFlags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field healthPanelMeterMinimumMeterValue integer 
---@field healthPanelMeterSequenceIndex MetaEngineIndex 
---@field healthPanelMeterAlphaMultiplier integer 
---@field healthPanelMeterAlphaBias integer 
---@field healthPanelMeterValueScale integer 
---@field healthPanelMeterOpacity number 
---@field healthPanelMeterTranslucency number 
---@field healthPanelMeterDisabledColor MetaEngineColorARGBInt 
---@field healthPanelMeterMinAlpha number 
---@field healthPanelMeterMediumHealthLeftColor MetaEngineColorARGBInt 
---@field healthPanelMeterMaxColorHealthFractionCutoff number 
---@field healthPanelMeterMinColorHealthFractionCutoff number 
---@field motionSensorBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field motionSensorBackgroundWidthScale number 
---@field motionSensorBackgroundHeightScale number 
---@field motionSensorBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field motionSensorBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field motionSensorBackgroundDefaultColor MetaEngineColorARGBInt 
---@field motionSensorBackgroundFlashingColor MetaEngineColorARGBInt 
---@field motionSensorBackgroundFlashPeriod number 
---@field motionSensorBackgroundFlashDelay number 
---@field motionSensorBackgroundNumberOfFlashes integer 
---@field motionSensorBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field motionSensorBackgroundFlashLength number 
---@field motionSensorBackgroundDisabledColor MetaEngineColorARGBInt 
---@field motionSensorBackgroundSequenceIndex MetaEngineIndex 
---@field motionSensorBackgroundMultitexOverlays TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field motionSensorForegroundAnchorOffset MetaEnginePoint2DInt 
---@field motionSensorForegroundWidthScale number 
---@field motionSensorForegroundHeightScale number 
---@field motionSensorForegroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field motionSensorForegroundInterfaceBitmap MetaEngineTagDependency 
---@field motionSensorForegroundDefaultColor MetaEngineColorARGBInt 
---@field motionSensorForegroundFlashingColor MetaEngineColorARGBInt 
---@field motionSensorForegroundFlashPeriod number 
---@field motionSensorForegroundFlashDelay number 
---@field motionSensorForegroundNumberOfFlashes integer 
---@field motionSensorForegroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field motionSensorForegroundFlashLength number 
---@field motionSensorForegroundDisabledColor MetaEngineColorARGBInt 
---@field motionSensorForegroundSequenceIndex MetaEngineIndex 
---@field motionSensorForegroundMultitexOverlays TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field motionSensorCenterAnchorOffset MetaEnginePoint2DInt 
---@field motionSensorCenterWidthScale number 
---@field motionSensorCenterHeightScale number 
---@field motionSensorCenterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field auxiliaryOverlayAnchor EngineTagDataHUDInterfaceAnchor 
---@field overlays TagBlock<MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlay> 
---@field sounds TagBlock<MetaEngineTagDataUnitHUDInterfaceHUDSound> 
---@field meters TagBlock<MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanel> 


