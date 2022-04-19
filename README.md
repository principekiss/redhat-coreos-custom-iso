# redhat-coreos-custom-iso

Custom RedHat CoreOS live ISO that setup the core user with Vagrant ssh public key in initramfs for Vagrant to ssh when booting the box and still be able to run the coreos-installer and install Openshift on the system.

#### Download the Butane image:
```sh
podman pull quay.io/coreos/butane:release
```

#### Download the CoreOS image:
```sh
curl -s -o rhcos-live.x86_64.iso https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.9/4.9.0/rhcos-live.x86_64.iso
```

#### Generate the Ignition JSON file:
```sh
podman run --rm --tty --interactive --volume ${PWD}:/pwd:z --workdir /pwd  quay.io/coreos/butane:release --pretty --strict --raw ./live.bu > ./live.ign
```

#### To inject the Ignition file, we use the coreos-installer command from a container, so first we have to pull the image:
```sh
podman pull quay.io/coreos/coreos-installer:release
```

#### Inject the Ignition into the live ISO:
```sh
podman run --rm --tty --interactive --volume ${PWD}:/data:z --workdir /data quay.io/coreos/coreos-installer:release iso ignition embed -i ./live.ign ./rhcos-live.x86_64.iso
```

