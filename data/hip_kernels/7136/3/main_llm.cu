#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "histogram_equalization_llm.cu"
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
    int *lut = NULL;
hipMalloc(&lut, XSIZE*YSIZE);
unsigned char *img_out = NULL;
hipMalloc(&img_out, XSIZE*YSIZE);
unsigned char *img_in = NULL;
hipMalloc(&img_in, XSIZE*YSIZE);
int *hist_in = NULL;
hipMalloc(&hist_in, XSIZE*YSIZE);
int img_size = XSIZE*YSIZE;
int nbr_bin = 1;
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
histogram_equalization<<<gridBlock, threadBlock>>>(lut,img_out,img_in,hist_in,img_size,nbr_bin);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
histogram_equalization<<<gridBlock, threadBlock>>>(lut,img_out,img_in,hist_in,img_size,nbr_bin);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
histogram_equalization<<<gridBlock, threadBlock>>>(lut,img_out,img_in,hist_in,img_size,nbr_bin);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}