%load DobotDll
if ~libisloaded('DobotDll')
   [notfound, warnings]=loadlibrary('DobotDll.dll','DobotDll.h');
end
%libfunctionsview DobotDll

%create size 128 charArrays
ch=blanks(128);

%create pointer piont to charArrays
str1= libpointer('cstring',ch);

%search the magician device   res1:device number     res2:device address
[res1,res2]=calllib('DobotDll','SearchDobot',str1,128);

%create pointer piont to device address
str2= libpointer('cstring',res2);

%contect device res3:contect result 0:success 1:error 2:timeout
[res3,res4]=calllib('DobotDll','ConnectDobot',str2, 115200);

%create queue index
queue_index=0;
%create ptp struct
ptp.ptpMode=0;
ptp.x=200.0;
ptp.y=0.0;
ptp.z=0.0;
ptp.r=0.0;
%cmd start exec queue
calllib('DobotDll','SetQueuedCmdStartExec')

%create c type struct
ptpstruct=libstruct('tagPTPCmd',ptp);

%create ptp pointer
ptpstructptr=libpointer('tagPTPCmdPtr',ptpstruct);
queue_index_ptr=libpointer('uint64Ptr',queue_index);

%send ptp cmd
calllib('DobotDll','SetPTPCmd',ptpstructptr,true,queue_index_ptr);

%cmd stop exec queue
calllib('DobotDll','SetQueuedCmdStopExec');

%cmd disconnect device
calllib('DobotDll','DisconnectDobot'); 

%clear value
clear ptpstruct;
clear ptpstructptr;
clear str1;
clear str2;
clear queue_index_ptr;
%unloadlibrary DobotDll;
