.PHONY: fmt
fmt:
	ormolu --mode=inplace ./{app,src,test}/*.hs
