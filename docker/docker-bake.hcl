variable "BASE_IMAGE_NAME" {
    default = "ignition"
}

target "default" {
    name="${BASE_IMAGE_NAME}-${tgt}-${replace(version, ".", "-")}"
	matrix = {
		tgt = ["example"]
		version = ["1.0.0", "latest"]
	}
	args = {
		IGNITION_VERSION = version
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