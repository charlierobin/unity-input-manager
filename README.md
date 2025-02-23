# Unity Input Manager Helper 
## A file editor for Unity Input Manager Assets

I’ve always found editing the input axes for games in Unity to be about as pleasant as having teeth pulled, just minus the charming company of the dentist and her equally charming assistant.

So over the years I’ve slowly put together an editing app of my own. It started in (roughly) 2015 I think, and has had the odd bit added here and there, plus (of course) the mistakes and other bugs fixed.

I know that these days we’re supposed to use the new Unity input system, but, good though it is, a lot of the time it’s just too involved for the kind of games I tend to produce. So although by now I always thought that I would have ditched the old input system for the new one, it just hasn’t happened that way: I keep coming back to the old ways.

There are still things here and there that I always wanted to add but never got around to: a window displaying the “history” of deleted axes, a folder in `Documents` in which any Asset documents are automatically opened on launch, drag and drop between different settings files (at the moment it’s copy and paste only).

But even as it is, I still find it to be a very useful app, so perhaps others will feel the same way.

You can have as many input manager asset files open as you like, and copy/paste axes between them:

<img width="1000" alt="three-windows-and-templates-window" src="https://github.com/user-attachments/assets/606eab58-e9a8-4161-a895-f639177d6421" />

I went through a lot of the Unity template projects and collected all their default input manager files, making them available for browsing:

<img width="897" alt="templates-popup" src="https://github.com/user-attachments/assets/ee0eca0d-b85a-4d42-972b-67b25f5f9a57" />

... and making it easy to select the required settings in them and quickly create a new input manager asset from them:

 <img width="889" alt="creating-new-asset-using-some-axes-from-template" src="https://github.com/user-attachments/assets/41f2ea26-3e97-4ce0-a5c6-8688312aee19" />

In the narrower windows you get a summary view of an axis’ settings, with a wider window you get a more detailed breakdown of every setting (similar to the actual view in Unity itself):

<img width="1000" alt="detailed-view-wide" src="https://github.com/user-attachments/assets/53abd696-6077-4c42-9a0e-8b8003c0cffa" />

There’s a simple floating editing window:

<img width="1000" alt="edit-window" src="https://github.com/user-attachments/assets/c8a2e021-fe55-46fb-a128-fbc8e306f475" />

There’s a popup of common key names/joystick axes/controller buttons etc for help when editing:

<img width="374" alt="axes-popup-menu" src="https://github.com/user-attachments/assets/953ce682-154e-4e25-9755-0321f87edf65" />

(These popups were never finished, so I think there are a few keys/buttons/axes missing, but I’ve never got around to cross-referencing with the official Unity documentation and building a comprehensive list.)

So, in conclusion, perhaps others will find this app as useful as I’ve found it over the years.

Source code is in `xojo-project-files`, for those happy to take the risk downloading pre-built binaries, here they are:

Download links below for a zip of Intel, ARM and universal versions, and a zip of a disk image of Intel, ARM and universal versions. (All macOS, as already mentioned somewhere above, I think.)

[zip of Intel, ARM and universal versions](https://www.dropbox.com/scl/fi/anw470px54ocj6tu36b9l/UnityInputManagerHelper.zip?rlkey=v3glmsai513tst4cexcf6rd0j&st=59k7g92r&dl=1)

[zip of a disk image of Intel, ARM and universal versions](https://www.dropbox.com/scl/fi/s33f4w8l7zgsa8h9ombn2/UnityInputManagerHelper.dmg.zip?rlkey=dtf27q0enuamswxuxdaaour03&st=b10jxqxk&dl=1)
