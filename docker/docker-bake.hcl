variable "BASE_IMAGE_NAME" {
    default = "ignition"
}

target "default" {
    name="${BASE_IMAGE_NAME}-${tgt}-${replace(version, ".", "-")}"
    context = "."
	matrix = {
		tgt = ["example"]
		version = ["latest"]
	}
	args = {
		IGNITION_VERSION = version
	}
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