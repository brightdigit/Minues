
therbe.xcodeproj: therbe-temp.xcodeproj Assets.xcassets
	swift sh watchapp2-container.swift .therbe-temp.xcodeproj therbe.xcodeproj
Assets.xcassets:
	./speculid.sh
generated_sources:
	sourcery --sources Framework/Sources/ --templates Framework/Templates/ --output Framework/Generated/
therbe-temp.xcodeproj: generated_sources
	xcodegen generate

