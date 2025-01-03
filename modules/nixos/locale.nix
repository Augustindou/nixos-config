{ ... }: {
    config = {
        time.timeZone = "Europe/Brussels";

        i18n.defaultLocale = "en_US.UTF-8";
        i18n.extraLocaleSettings = {
            LC_ADDRESS = "fr_BE.UTF-8";
            LC_IDENTIFICATION = "fr_BE.UTF-8";
            LC_MEASUREMENT = "fr_BE.UTF-8";
            LC_MONETARY = "fr_BE.UTF-8";
            LC_NAME = "fr_BE.UTF-8";
            LC_NUMERIC = "fr_BE.UTF-8";
            LC_PAPER = "fr_BE.UTF-8";
            LC_TELEPHONE = "fr_BE.UTF-8";
            LC_TIME = "en_US.UTF-8";
        };
    };
}
