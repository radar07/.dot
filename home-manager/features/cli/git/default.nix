{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    signing = {
      key = "AE028221AB6BCAC3";
    };

    settings = {
      user = {
        name = "Pranav RK";
        email = "pranavrk7@gmail.com";
      };
      aliases = {
        st = "status";
        br = "branch";
        co = "checkout";
        ci = "commit";
        cm = "commit -m";
        ca = "commit --amend";
        ssb = "status -sb";
        d = "diff";
        dt = "difftool";
      };
      core = {
        editor = "nvim";
        diff = "auto";
        status = "auto";
        branch = "auto";
        interactive = "auto";
        ui = true;
        autocrlf = "input";
        pager = "${pkgs.delta}/bin/delta";
      };
      merge = {
        conflictstyle = "diff3";
      };
      help = {
        autocorrect = 20;
      };
      delta = {
        navigate = true;
        light = false;
        line-numbers = true;
      };
      diff = {
        colorMoved = "default";
      };
      difftool = {
        prompt = true;
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
      fetch = {
        prune = true;
      };
      rerere = {
        enabled = true;
      };
      column = {
        ui = "auto";
      };
      branch = {
        sort = "-committerdate";
      };
      log = {
        showSignature = false;
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
