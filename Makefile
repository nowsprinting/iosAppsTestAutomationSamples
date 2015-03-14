export PATH := ${PATH}:/usr/local/bin:~/oclint/bin
REPORTER=junit:test-reports/xctest-report.xml
DST_OS=8.1
DST_NAME=iPhone 4s

test:
	xctool -workspace HelloTesting.xcworkspace -scheme HelloTesting \
		-sdk iphonesimulator \
		-destination "platform=iOS Simulator,OS=${DST_OS},name=${DST_NAME}" \
		-reporter ${REPORTER} \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES \
		OTHER_CFLAGS="-DUSE_GCOV_FLUSH" \
		OBJROOT=build \
		clean test

coverage-and-gcovr: test
	mkdir -p coverage-reports
	gcovr --object-directory build \
		--exclude Pods --exclude ".*Tests" --exclude ".*\.h" \
		--xml > coverage-reports/coverage.xml

send-to-coveralls:
	coveralls \
		--exclude Pods --exclude-pattern ".*Tests" --exclude-pattern ".*\.h" \
		--repo-token 9ig1boI707fjkhwNBgVtTwOVFREPGVHeT

oclint:
	xctool -workspace HelloTesting.xcworkspace -scheme HelloTesting \
		-reporter json-compilation-database:compile_commands.json \
		clean build
	mkdir -p pmd-reports
	oclint-json-compilation-database -- \
		-max-priority-1 10 -max-priority-2 100 -max-priority-3 200 \
		-report-type pmd -o pmd-reports/oclint.xml

frank-test:
	frank setup --target="HelloTesting" --conf="Debug"
	frank build --workspace HelloTesting.xcworkspace --scheme HelloTesting
	export USE_SIM_LAUNCHER_SERVER=TRUE
	cucumber --format junit --out cucumber-reports Frank/features

