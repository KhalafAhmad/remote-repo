resource "local_file" "file1"{
filename = local.fileName
content = local.cont
}

locals {
fileName = "file1.txt"
cont = "hello world "
}
