all:
	corral run -- ponyc -o ./build/ ./utility
	./build/utility

test:
	corral run -- ponyc -V=0 -o ./build/ ./utility
	./build/utility




corral-fetch:
	@corral clean -q
	@corral fetch -q

corral-local:
	@-rm corral.json
	@-rm lock.json
	@corral init -q
	@corral add /Volumes/Development/Development/pony/pony.stringext -q

corral-git:
	@-rm corral.json
	@-rm lock.json
	@corral init -q
	@corral add github.com/KittyMac/pony.stringext.git -q

ci: corral-git corral-fetch all
	
dev: corral-local corral-fetch all
