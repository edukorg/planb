module github.com/edukorg/planb

go 1.14

require (
	github.com/beorn7/perks v0.0.0-20160804104726-4c0e84591b9a
	github.com/cezarsa/fasthttp v0.0.0-20160513150518-b0d76e0fc7e8
	github.com/codegangsta/cli v1.20.0
	github.com/go-redis/redis v6.5.7+incompatible
	github.com/golang/protobuf v0.0.0-20170902000452-17ce1425424a
	github.com/google/gops v0.3.3-0.20171222022621-e09130d89827
	github.com/hashicorp/golang-lru v0.0.0-20160813221303-0a025b7e63ad
	github.com/kardianos/osext v0.0.0-20170510131534-ae77be60afb1
	github.com/klauspost/compress v1.2.1
	github.com/klauspost/cpuid v0.0.0-20170728055534-ae7887de9fa5
	github.com/klauspost/crc32 v0.0.0-20161016154125-cb6bfca970f6
	github.com/matttproud/golang_protobuf_extensions v1.0.0
	github.com/nu7hatch/gouuid v0.0.0-20131221200532-179d4d0c4d8d
	github.com/prometheus/client_golang v0.8.0
	github.com/prometheus/client_model v0.0.0-20170216185247-6f3806018612
	github.com/prometheus/common v0.0.0-20170830190555-bc8b88226a12
	github.com/prometheus/procfs v0.0.0-20170703101242-e645f4e5aaa8
	golang.org/x/net v0.0.0-20170828231752-66aacef3dd8a
	gopkg.in/check.v1 v1.0.0-20161208181325-20d25e280405
)

replace github.com/valyala/fasthttp b0d76e0fc7e8bc9abf66250596ca36a6aff9087c => github.com/cezarsa/fasthttp v0.0.0-20160513150518-b0d76e0fc7e8
