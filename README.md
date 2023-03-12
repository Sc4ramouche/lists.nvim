# lists.nvim

The idea is to be able to display any sort of a list if you need a reminder. I use this to remind myself the purpose of conventional commits and some of the vim commands I tend to forget.

Originally I explored an easier way to display those lists with [built-in messages](https://neovim.io/doc/user/message.html), but this protocol doesn't allow to conveniently display multi-line strings. Thus I tried to implement the same idea as a plugin, which allowed me to use more pleasant UI and get some lua experience along the way.

### Acknowledgements

- [Writing Neovim Plugins – A Beginner Guide](https://alpha2phi.medium.com/writing-neovim-plugins-a-beginner-guide-part-i-e169d5fd1a58), learned a great trick on how to setup and reload a plugin without quitting vim.
- The UI is inspired by [Harpoon](https://github.com/ThePrimeagen/harpoon), relying on `popup` provided by [plenary](https://github.com/nvim-lua/plenary.nvim).

### TODOs

- [ ] Add lists dynamically.
- [ ] Watch [TJ's plugin tutorial](https://www.youtube.com/watch?v=n4Lp4cV8YR0) and see what I can improve.
