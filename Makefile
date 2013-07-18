VSN := $(shell erl -eval 'io:format("~s~n", [erlang:system_info(otp_release)]), init:stop().' | grep 'R' | sed -e 's,R\(..\)B.*,\1,')
OLD_HASH := $(shell expr $(VSN) \<= 15)
ifeq ($(OLD_HASH),1)
hash := "-Dold_hash"
endif

all: deps compile

compile:
	@./rebar compile $(hash) escriptize

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps
