#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "imperviousness_change_char.cu"
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
    const unsigned char *dev_BIN1 = NULL;
hipMalloc(&dev_BIN1, XSIZE*YSIZE);
const unsigned char *dev_BIN2 = NULL;
hipMalloc(&dev_BIN2, XSIZE*YSIZE);
unsigned int WIDTH = 1;
unsigned int HEIGHT = 1;
char *dev_LTAKE_map = NULL;
hipMalloc(&dev_LTAKE_map, XSIZE*YSIZE);
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
imperviousness_change_char<<<gridBlock, threadBlock>>>(dev_BIN1,dev_BIN2,WIDTH,HEIGHT,dev_LTAKE_map);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
imperviousness_change_char<<<gridBlock, threadBlock>>>(dev_BIN1,dev_BIN2,WIDTH,HEIGHT,dev_LTAKE_map);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
imperviousness_change_char<<<gridBlock, threadBlock>>>(dev_BIN1,dev_BIN2,WIDTH,HEIGHT,dev_LTAKE_map);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}