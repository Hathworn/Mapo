#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "refine_dilateFPPlaneDepthMapXpYp_kernel.cu"
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
    float *fpPlaneDepthMap = NULL;
hipMalloc(&fpPlaneDepthMap, XSIZE*YSIZE);
int fpPlaneDepthMap_p = 1;
float *maskMap = NULL;
hipMalloc(&maskMap, XSIZE*YSIZE);
int maskMap_p = 1;
int width = XSIZE;
int height = YSIZE;
int xp = 1;
int yp = 1;
float fpPlaneDepth = 1;
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
refine_dilateFPPlaneDepthMapXpYp_kernel<<<gridBlock, threadBlock>>>(fpPlaneDepthMap,fpPlaneDepthMap_p,maskMap,maskMap_p,width,height,xp,yp,fpPlaneDepth);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
refine_dilateFPPlaneDepthMapXpYp_kernel<<<gridBlock, threadBlock>>>(fpPlaneDepthMap,fpPlaneDepthMap_p,maskMap,maskMap_p,width,height,xp,yp,fpPlaneDepth);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
refine_dilateFPPlaneDepthMapXpYp_kernel<<<gridBlock, threadBlock>>>(fpPlaneDepthMap,fpPlaneDepthMap_p,maskMap,maskMap_p,width,height,xp,yp,fpPlaneDepth);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}