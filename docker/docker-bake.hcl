variable "BASE_IMAGE_NAME" {
    default = "ignition"
}

target "default" {
    name="${BASE_IMAGE_NAME}-${tgt}-${replace(version, ".", "-")}"
	matrix = {
		tgt = ["example"]
		ignition = ["8.1.32"]
		version = ["1.0.0", "latest"]
	}
	args = {
		IGNITION_VERSION = ignition
	}
	context = "docker"
    dockerfile = "Dockerfile"
    platforms = [
		"linux/amd64", 
		"linux/arm64", 
		"linux/arm/v7",
 	]
	tags = [
		"ghcr.io/keith-gamble/aks-lite-test/${BASE_IMAGE_NAME}-${tgt}:${version}"
	]
}