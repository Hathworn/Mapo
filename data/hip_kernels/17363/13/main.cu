#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_bfs.cu"
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
    int *g_left_weight = NULL;
hipMalloc(&g_left_weight, XSIZE*YSIZE);
int *g_right_weight = NULL;
hipMalloc(&g_right_weight, XSIZE*YSIZE);
int *g_down_weight = NULL;
hipMalloc(&g_down_weight, XSIZE*YSIZE);
int *g_up_weight = NULL;
hipMalloc(&g_up_weight, XSIZE*YSIZE);
int *g_graph_height = NULL;
hipMalloc(&g_graph_height, XSIZE*YSIZE);
bool *g_pixel_mask = NULL;
hipMalloc(&g_pixel_mask, XSIZE*YSIZE);
int vertex_num = 1;
int width = XSIZE;
int height = YSIZE;
int vertex_num1 = 1;
int width1 = XSIZE;
int height1 = YSIZE;
bool *g_over = NULL;
hipMalloc(&g_over, XSIZE*YSIZE);
int *g_counter = NULL;
hipMalloc(&g_counter, XSIZE*YSIZE);
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
kernel_bfs<<<gridBlock, threadBlock>>>(g_left_weight,g_right_weight,g_down_weight,g_up_weight,g_graph_height,g_pixel_mask,vertex_num,width,height,vertex_num1,width1,height1,g_over,g_counter);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_bfs<<<gridBlock, threadBlock>>>(g_left_weight,g_right_weight,g_down_weight,g_up_weight,g_graph_height,g_pixel_mask,vertex_num,width,height,vertex_num1,width1,height1,g_over,g_counter);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_bfs<<<gridBlock, threadBlock>>>(g_left_weight,g_right_weight,g_down_weight,g_up_weight,g_graph_height,g_pixel_mask,vertex_num,width,height,vertex_num1,width1,height1,g_over,g_counter);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}