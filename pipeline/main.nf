#!/usr/bin/env nextflow
// hash:sha256:a5d1da34c4f42f8f9beca0c1ce8058d4028c1534e66f2096bd9c43f527452477

nextflow.enable.dsl = 1

test_to_copy_of_fastqc_1 = channel.fromPath("../data/Test/*", type: 'any', relative: true)

// capsule - Copy of FastQC
process capsule_copy_of_fast_qc_1 {
	tag 'capsule-4763389'
	container "registry.apps-edge.acmecorp.codeocean.dev/published/9140f7ad-ac10-4f05-a561-c7924ae56fdf:v1"

	cpus 1
	memory '8 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	val path1 from test_to_copy_of_fastqc_1

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=9140f7ad-ac10-4f05-a561-c7924ae56fdf
	export CO_CPUS=1
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/Test/$path1" "capsule/data/$path1" # id: 4a117340-fb77-4f8c-b4d9-81e613abe125

	echo "[${task.tag}] cloning git repo..."
	git clone --branch v1.0 "https://apps-edge.acmecorp.codeocean.dev/capsule-4763389.git" capsule-repo
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_copy_of_fast_qc_1_args}

	echo "[${task.tag}] completed!"
	"""
}
