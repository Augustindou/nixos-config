{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "augustindou";
  home.homeDirectory = "/home/augustindou";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = with pkgs; [ ];
  home.file = { };
  home.sessionVariables = { };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Programs

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "augustin.doultremontao@gmail.com";
    userName = "augustindou";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ];
    userSettings = {
      "files.autoSave" = "afterDelay";
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "editor.lineNumbers" = "relative";
      "editor.stickyScroll.enabled" = false;
      "editor.bracketPairColorization.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.suggestSelection" = "recentlyUsed";
      "window.zoomLevel" = 1;
      "workbench.tree.stickyScrollMaxItemCount" = 5;
      "workbench.activityBar.location" = "hidden";
      "git.confirmSync" = false;
    };
    keybindings = [
      # sidebar shortcuts
      { key = "ctrl+shift+b"; command = "workbench.action.toggleActivityBarVisibility"; }
      { key = "ctrl+[IntlBackslash]"; command = "workbench.action.toggleSidebarVisibility"; }
      { key = "ctrl+1"; command = "workbench.view.explorer"; }
      { key = "ctrl+2"; command = "workbench.view.search"; }
      { key = "ctrl+3"; command = "workbench.scm.focus"; }
      { key = "ctrl+4"; command = "workbench.view.debug"; }
      { key = "ctrl+5"; command = "workbench.view.extensions"; }
      { key = "alt+1"; command = "workbench.view.explorer"; }
      { key = "alt+2"; command = "workbench.view.search"; }
      { key = "alt+3"; command = "workbench.scm.focus"; }
      { key = "alt+4"; command = "workbench.view.debug"; }
      { key = "alt+5"; command = "workbench.view.extensions"; }
      { key = "ctrl+escape"; command = "workbench.action.toggleSidebarVisibility"; }
      { key = "ctrl+escape"; command = "-workbench.action.chat.cancel"; }
      # removed keyboard shortcuts
      { key = "ctrl+p"; command = "-extension.vim_ctrl+p"; }
      { key = "ctrl+w"; command = "-extension.vim_ctrl+w"; }
      # format document on ctrl+s
      { key = "ctrl+s"; command = "editor.action.formatDocument"; when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor"; }
      { key = "ctrl+shift+i"; command = "-editor.action.formatDocument"; when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor"; }
      { key = "ctrl+s"; command = "-workbench.action.files.save"; }
      { key = "ctrl+s"; command = "-extension.vim_ctrl+s"; when = "editorTextFocus && vim.active && vim.use<C-s> && !inDebugRepl"; }
    ];
  };
  
  programs.firefox = {
    enable = true;
  };
}
