

_buildkit_create_use:
	docker buildx inspect | grep 'Driver: docker-container'  > /dev/null || (echo "starting new buildx instance" && docker buildx create --use)

build_and_push_and_output_v1.11.0: _buildkit_create_use
	docker buildx build \
	--build-arg elixir_version=v1.11.0 \
	--cache-from=bryanhuntesl/buildx-output-example:cache \
	--cache-to=bryanhuntesl/buildx-output-example:cache \
	-o type=local,dest=./outdir \
	.

build_and_push_and_output_v1.12.0: _buildkit_create_use
	docker buildx build \
	--build-arg elixir_version=v1.12.0 \
	--cache-from=bryanhuntesl/buildx-output-example:cache \
	--cache-to=bryanhuntesl/buildx-output-example:cache \
	-o type=local,dest=./outdir \
	.