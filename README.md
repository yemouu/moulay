# moulay
Gentoo Overlay with random packages.

## How to use
If you want to use this overlay, install `app-eselect/eselect-repository`, add the overlay and sync the repository.

```
emerge -a app-eselect/eselect-repository

eselect repository add moulay git https://github.com/comfies/moulay

emaint sync -r moulay
```

### Note
Some dependencies come from the [GURU Overlay](https://wiki.gentoo.org/wiki/Project:GURU)

## List of Packages
 - [app-editors/bed](https://github.com/comfies/moulay/tree/master/app-editors/bed)
 - [app-misc/beautifuldiscord](https://github.com/comfies/moulay/tree/master/app-misc/beautifuldiscord)
 - [app-misc/tiramisu](https://github.com/comfies/moulay/tree/master/app-misc/tiramisu)
 - [app-misc/volctl](https://github.com/comfies/moulay/tree/master/app-misc/volctl)
 - [dev-python/discord-py](https://github.com/comfies/moulay/tree/master/dev-python/discord-py)
 - [dev-util/kak-lsp](https://github.com/comfies/moulay/tree/master/dev-util/kak-lsp)
 - [gui-apps/wev](https://github.com/comfies/moulay/tree/master/gui-apps/wev)
 - [gui-apps/wlr-randr](https://github.com/comfies/moulay/tree/master/gui-apps/wlr-randr)
 - [media-fonts/montserrat](https://github.com/comfies/moulay/tree/master/media-fonts/montserrat)
 - [x11-misc/blugon](https://github.com/comfies/moulay/tree/master/x11-misc/blugon)
 - [x11-misc/setroot](https://github.com/comfies/moulay/tree/master/x11-misc/setroot)
