# moulay
Gentoo Overlay with random packages.

I try to update this overlay every Friday.

## How to use
If you want to use this overlay, install `app-eselect/eselect-repository`, add the overlay and sync the repository.

```
emerge -a app-eselect/eselect-repository

eselect repository add moulay git https://github.com/yemouu/moulay

emaint sync -r moulay
```

### Note
Some dependencies come from the [GURU Overlay](https://wiki.gentoo.org/wiki/Project:GURU)

## List of Packages
 - [app-misc/beautifuldiscord](https://github.com/yemouu/moulay/tree/master/app-misc/beautifuldiscord)
 - [app-misc/volctl](https://github.com/yemouu/moulay/tree/master/app-misc/volctl)
 - [dev-python/discord-py](https://github.com/yemouu/moulay/tree/master/dev-python/discord-py)
 - [dev-util/kak-lsp](https://github.com/yemouu/moulay/tree/master/dev-util/kak-lsp)
 - [gui-apps/wev](https://github.com/yemouu/moulay/tree/master/gui-apps/wev)
 - [gui-apps/wlr-randr](https://github.com/yemouu/moulay/tree/master/gui-apps/wlr-randr)
 - [gui-apps/wofi](https://github.com/yemouu/moulay/tree/master/gui-apps/wofi)
 - [media-fonts/montserrat](https://github.com/yemouu/moulay/tree/master/media-fonts/montserrat)
 - [net-im/riot-desktop](https://github.com/yemouu/moulay/tree/master/net-im/riot-desktop)
 - [x11-misc/blugon](https://github.com/yemouu/moulay/tree/master/x11-misc/blugon)
 - [x11-misc/setroot](https://github.com/yemouu/moulay/tree/master/x11-misc/setroot)
