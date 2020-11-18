package bake

command: {
  image: #Dubo & {
args: {
      BUILD_TITLE: "Homekit Wiz"
      BUILD_DESCRIPTION: "A dubo image for Homekit Wiz based on \(args.DEBOOTSTRAP_SUITE) (\(args.DEBOOTSTRAP_DATE))"
    }
  }
}
