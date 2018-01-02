c = c  # noqa: F821
config = config  # noqa: F821
# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Hide the statusbar unless a message is shown.
# Type: Bool
c.statusbar.hide = False

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'always'

# Homepage
config.set('url.default_page', 'https://archlinux.org')
config.set('url.start_pages', 'https://archlinux.org')

# External Editor
config.set('editor.command', ['urxvt', '-e', 'vim', '{}'])
config.set('content.private_browsing', True)
config.set('content.xss_auditing', True)

# Not so unique useragent and accept lang
config.set('content.headers.accept_language', 'en-US,en;q=0.5')
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0')

# open new tabs in background
config.set('tabs.background', True)
config.set('content.webgl', False)

# Search engines - allows searching via :open
# Example: ':open google test' searches google for test
# Defaults to searx instance if no engine specified
config.set('url.searchengines', {"DEFAULT": "https://duckduckgo.com/?q={}","sx": "https://www.perfectpixel.de/searx/?q={}", "sp": "https://www.startpage.com/do/dsearch?query={}&cat=web&pl=opensearch&language=english", "arch": "https://wiki.archlinux.org/index.php?title=Special:Search&search={}", "aur": "https://aur.archlinux.org/packages/?O=0&K={}", "yt": "https://www.youtube.com/results?search_query={}&page={{startPage?}}", "g": "https://www.google.com/search?hl=en&q={}", "d": "https://duckduckgo.com/?q={}"})

# My custom keybinds
# Spawn mpv or feh with current page or by using hints
config.bind('zm', 'spawn mpv {url}')
config.bind('zM', 'hint links spawn mpv {hint-url}')
config.bind('zf', 'spawn feh {url}')
config.bind('zF', 'hint links spawn feh {hint-url}')

# Use `less` scroll keybinds instead of closing and opening with d and u
config.unbind('d', mode='normal')
config.unbind('u', mode='normal')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')

# Switch tab from up down to left right
config.unbind('J', mode='normal')
config.unbind('K', mode='normal')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# Move new default keybinds from x to z
config.unbind('xO', mode='normal')
config.unbind('xb', mode='normal')
config.unbind('xo', mode='normal')
config.unbind('xt', mode='normal')
config.unbind('xx', mode='normal')

# All this so I can close tabs with just x and undo with X
config.bind('x', 'tab-close')
config.bind('X', 'undo')
config.bind('zO', 'set-cmd-text -s :open -b -r {url:pretty}')
config.bind('zb', 'config-cycle statusbar.hide')
config.bind('zo', 'set-cmd-text -s :open -b')
config.bind('zt', 'config-cycle tabs.show always switching')
config.bind('zx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
