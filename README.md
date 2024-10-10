# GitSignatureCheck
A lightweight tool to check if all the commits of a branch are signed by trusted contributors

## Usage
You can execute the check by running:
```
docker run -v "my/git/repo:/mnt/code" docker.io/alessandrotaufer/git-signature-check
```

it will automatically inspect the git repository (you should mount it as a volume) and
check the signature of all the commits that are between the HEAD and the base branch.

## Environment vars
You can set the following env vars to personalize the behaviour of the tool

* `BASE_BRANCH` -> Use it to customize the base branch (up to which commit you would like to check the signature)
* `LIVE_GPG_TRUST` -> If defined will perform a live gpg trust of the gpg keys contained in the
                       `/mnt/resources/live_trusted_signatures` folder
