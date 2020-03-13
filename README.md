# ymlay
Gentoo Overlay with random packages that I use.
I try to update this overlay every Friday.

## How to use
If you want to use this overlay, install `app-eselect/eselect-repository`, add the overlay and sync the repository.

```
emerge -a app-eselect/eselect-repository

eselect repository add ymlay git https://gitlab.com/yemou/ymlay

emaint sync -r ymlay
```

## List of Packages
 - app-editors/kakoune
 - app-misc/beautifuldiscord
 - app-misc/volctl
 - dev-python/discord-py
 - dev-python/websockets
 - dev-util/kak-lsp
 - gui-apps/wev
 - gui-apps/wf-recorder
 - gui-apps/wlr-randr
 - gui-apps/wofi
 - x11-misc/blugon
 - x11-misc/setroot
