
_buildkit_create_use:
	docker buildx inspect | grep 'Driver: docker-container'  > /dev/null || (echo "starting new buildx instance" && docker buildx create --use)

purge_buildx_instance:
	docker buildx inspect | grep 'Driver: docker-container' > /dev/null && docker buildx inspect | sed -ne '/^Name:[ ]*[a-z_]*$$/{s/Name:[ ]*//;p;}' | xargs docker buildx rm

build_and_push_and_output_v1.11.0: _buildkit_create_use
	docker buildx build \
	--build-arg elixir_version=v1.11.0 \
	--cache-from=bryanhuntesl/buildx-output-example:cache-v1.11.0 \
	--cache-to=bryanhuntesl/buildx-output-example:cache-v1.11.0 \
	-o type=local,dest=./outdir \
	.

build_and_push_and_output_v1.12.0: _buildkit_create_use
	docker buildx build \
	--build-arg elixir_version=v1.12.0 \
	--cache-from=bryanhuntesl/buildx-output-example:cache-v1.12.0 \
	--cache-to=bryanhuntesl/buildx-output-example:cache-v1.12.0 \
	-o type=local,dest=./outdir \
	.

build_and_push_and_output: build_and_push_and_output_v1.11.0 build_and_push_and_output_v1.12.0