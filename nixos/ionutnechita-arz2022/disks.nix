{ disks ? [ "/dev/nvme0n1" ], ... }:
{
  # checkout the example folder for how to configure different disko layouts
  disko.devices = {
    disk.sda = {
      device = builtins.elemAt disks 0;
      type = "disk";
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            name = "ESP";
            start = "1MiB";
            end = "300MiB";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          }
          {
            name = "root";
            start = "300MiB";
            end = "100%";
            part-type = "primary";
            bootable = true;
            content = {
              type = "filesystem";
              format = "xfs";
              mountpoint = "/";
            };
          }
        ];
      };
    };
  };
}
