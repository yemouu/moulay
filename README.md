# ymlay
Gentoo Overlay with random packages.

I try to update this overlay every Friday.

## How to use
If you want to use this overlay, install `app-eselect/eselect-repository`, add the overlay and sync the repository.

```
emerge -a app-eselect/eselect-repository

eselect repository add ymlay git https://gitlab.com/yemou/ymlay

emaint sync -r ymlay
```

## List of Packages
 - [app-editors/kakoune](https://gitlab.com/yemou/ymlay/tree/master/app-editors/kakoune)
 - [app-misc/beautifuldiscord](https://gitlab.com/yemou/ymlay/tree/master/app-misc/beautifuldiscord)
 - [app-misc/volctl](https://gitlab.com/yemou/ymlay/tree/master/app-misc/volctl)
 - [dev-python/discord-py](https://gitlab.com/yemou/ymlay/tree/master/dev-python/discord-py)
 - [dev-python/websockets](https://gitlab.com/yemou/ymlay/tree/master/dev-python/websockets)
 - [dev-util/kak-lsp](https://gitlab.com/yemou/ymlay/tree/master/dev-util/kak-lsp)
 - [gui-apps/wev](https://gitlab.com/yemou/ymlay/tree/master/gui-apps/wev)
 - [gui-apps/wf-recorder](https://gitlab.com/yemou/ymlay/tree/master/gui-apps/wf-recorder)
 - [gui-apps/wlr-randr](https://gitlab.com/yemou/ymlay/tree/master/gui-apps/wlr-randr)
 - [gui-apps/wofi](https://gitlab.com/yemou/ymlay/tree/master/gui-apps/wofi)
 - [x11-misc/blugon](https://gitlab.com/yemou/ymlay/tree/master/x11-misc/blugon)
 - [x11-misc/setroot](https://gitlab.com/yemou/ymlay/tree/master/x11-misc/setroot)

