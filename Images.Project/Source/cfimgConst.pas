unit cfimgConst;

interface

const
  DLLIMAGE_VERSION = 20211009; //TcfFileVersion = (Major: 1; Minor: 0; Release: 0; Build: 0);

type
  TcfImage = (
    cfiSun,
    cfiCloud,
    cfiRain
    //...
  );

const
  CFImageName: array[TcfImage] of string =
    ('sun',
     'cloud',
     'rain'
    );


implementation

end.
