This [Code Ocean](https://codeocean.com) Pipeline will allow you to run and reproduce the results of [Materialized Pipeline - acme-2.22.0 - Original](https://acmecorp-edge.codeocean.com/capsule/1208175/tree) on your local machine<sup>1</sup>. Follow the instructions below, or consult [our knowledge base](https://docs.codeocean.com/user-guide/compute-capsule-basics/managing-capsules/exporting-capsules-to-your-local-machine) for more information. Don't hesitate to reach out to [Support](mailto:support@codeocean.com) if you have any questions.

<sup>1</sup> You may need access to additional hardware and/or software licenses.

# Prerequisites

- [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html)
- [Docker Community Edition (CE)](https://www.docker.com/community-edition)
- [nvidia-container-runtime](https://docs.docker.com/config/containers/resource_constraints/#gpu) for code that leverages the GPU

# Instructions

## Download attached Data Assets

In order to fetch the Data Asset(s) this Pipeline depends on, download them into the Pipeline's `data` folder:
* [Bernie](https://acmecorp-edge.codeocean.com/data-assets/4a117340-fb77-4f8c-b4d9-81e613abe125) should be downloaded to `data/Test`

External Data Assets (if such are needed) do not need to be downloaded up-front but would rather be downloaded during runtime. If so, and you don't have AWS credentials set up in your environment, please see [these instructions](https://www.nextflow.io/docs/latest/awscloud.html).
## Log in to the Docker registry

In your terminal, execute the following command, providing your password or API key when prompted for it:
```shell
docker login -u eden.berman@codeocean.com registry.acmecorp-edge.codeocean.com
```

## Configure your Code Ocean credentials

In your terminal, execute the following commands and enter your password or API key when prompted for it:
```shell
export CO_USERNAME=eden.berman%40codeocean.com
read -s -p "Enter Code Ocean password or API key: " CO_PASSWORD && echo && export CO_PASSWORD
```

## Run the Pipeline to reproduce the results

In your terminal, navigate to the `pipeline` folder within the folder where you've extracted the Pipeline and execute the following command, adjusting parameters as needed:
```shell
NXF_VER=22.10.8 DATA_PATH=$PWD/../data nextflow -log ../results/nextflow/nextflow.log run main.nf -resume
```

Edit the `nextflow.config` file found inside the same folder as needed.

See the `params` section for setting the different capsule parameters (by process name).

See [Nextflow configuration documentation](https://www.nextflow.io/docs/latest/config.html#configuration-file) for further details.
