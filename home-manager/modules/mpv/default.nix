{
  programs.mpv = {
    enable = true;
    config = {
      # Video output optimized for Wayland
      vo = "gpu-next"; # Best for Wayland + libplacebo
      hwdec = "auto-safe"; # Hardware decoding
      profile = "gpu-hq"; # High quality preset

      # Color management
      target-colorspace-hint = true;
      target-prim = "auto";
      target-trc = "auto";

      # Quality settings
      scale = "ewa_lanczossharp"; # High quality upscaling
      cscale = "ewa_lanczossharp"; # High quality chroma upscaling
      dscale = "mitchell"; # Downscaling

      # Deband (reduces color banding)
      deband = true;
      deband-iterations = 2;
      deband-threshold = 35;
      deband-range = 20;
      deband-grain = 5;

      # Performance
      video-sync = "display-resample";
      interpolation = true; # Smooth motion
      tscale = "oversample";

      # Other improvements
      keep-open = true; # Don't close on video end
      save-position-on-quit = true; # Remember position
    };
  };
}
