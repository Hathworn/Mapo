#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "copy_kernel_frombuf_llm.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    char *dest = NULL;
hipMalloc(&dest, XSIZE*YSIZE);
char *src = NULL;
hipMalloc(&src, XSIZE*YSIZE);
int rx_s = 1;
int rx_e = 1;
int ry_s = 1;
int ry_e = 1;
int rz_s = 1;
int rz_e = 1;
int x_step = 1;
int y_step = 1;
int z_step = 1;
int size_x = XSIZE*YSIZE;
int size_y = XSIZE*YSIZE;
int size_z = XSIZE*YSIZE;
int buf_strides_x = 2;
int buf_strides_y = 2;
int buf_strides_z = 2;
int type_size = XSIZE*YSIZE;
int dim = 2;
int OPS_soa = 1;
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
copy_kernel_frombuf<<<gridBlock, threadBlock>>>(dest,src,rx_s,rx_e,ry_s,ry_e,rz_s,rz_e,x_step,y_step,z_step,size_x,size_y,size_z,buf_strides_x,buf_strides_y,buf_strides_z,type_size,dim,OPS_soa);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
copy_kernel_frombuf<<<gridBlock, threadBlock>>>(dest,src,rx_s,rx_e,ry_s,ry_e,rz_s,rz_e,x_step,y_step,z_step,size_x,size_y,size_z,buf_strides_x,buf_strides_y,buf_strides_z,type_size,dim,OPS_soa);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
copy_kernel_frombuf<<<gridBlock, threadBlock>>>(dest,src,rx_s,rx_e,ry_s,ry_e,rz_s,rz_e,x_step,y_step,z_step,size_x,size_y,size_z,buf_strides_x,buf_strides_y,buf_strides_z,type_size,dim,OPS_soa);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}