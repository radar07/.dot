{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 500;
      height = 500;
      always_parse_args = true;
      show_all = false;
      insensitive = true;
      allow_images = true;
      normal_window = true;
      allow_markup = true;
      prompt = "🔍 Search program";
    };
    style = ''
      * {
        font-family: "FiraCode Nerd Font", monospace;
        font-size: 16px;
      }

      window {
        margin: 0px;
        border: 1px solid #626880;
        background-color: #303446;
      }

      #input {
        margin: 5px;
        border: 1px #626880;
        border-style: solid;
        border-radius: 10px;
        background-color: #303446;
        color: #c6d0f5;
        outline-color: #303446;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #303446;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #303446;
      }

      #scroll {
        margin: 5px;
      }

      #text {
        padding: 4px;
        border: none;
        color: #c6d0f5;
      }

      #entry:nth-child(even){
        background-color: #3C4053;
      }

      #entry:selected {
        background-color: #626880;
      }

      #text:selected {
        background: transparent;
      }
    '';
  };
}
