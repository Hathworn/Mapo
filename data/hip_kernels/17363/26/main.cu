#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_push1_start_stochastic.cu"
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
int *g_sink_weight = NULL;
hipMalloc(&g_sink_weight, XSIZE*YSIZE);
int *g_push_reser = NULL;
hipMalloc(&g_push_reser, XSIZE*YSIZE);
int *g_relabel_mask = NULL;
hipMalloc(&g_relabel_mask, XSIZE*YSIZE);
int *g_graph_height = NULL;
hipMalloc(&g_graph_height, XSIZE*YSIZE);
int *g_height_write = NULL;
hipMalloc(&g_height_write, XSIZE*YSIZE);
int graph_size = XSIZE*YSIZE;
int width = XSIZE;
int rows = XSIZE;
int graph_size1 = XSIZE*YSIZE;
int width1 = XSIZE;
int rows1 = 1;
int *d_relabel = NULL;
hipMalloc(&d_relabel, XSIZE*YSIZE);
int *d_stochastic = NULL;
hipMalloc(&d_stochastic, XSIZE*YSIZE);
int *d_counter = NULL;
hipMalloc(&d_counter, XSIZE*YSIZE);
bool *d_finish = NULL;
hipMalloc(&d_finish, XSIZE*YSIZE);
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
kernel_push1_start_stochastic<<<gridBlock, threadBlock>>>(g_left_weight,g_right_weight,g_down_weight,g_up_weight,g_sink_weight,g_push_reser,g_relabel_mask,g_graph_height,g_height_write,graph_size,width,rows,graph_size1,width1,rows1,d_relabel,d_stochastic,d_counter,d_finish);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_push1_start_stochastic<<<gridBlock, threadBlock>>>(g_left_weight,g_right_weight,g_down_weight,g_up_weight,g_sink_weight,g_push_reser,g_relabel_mask,g_graph_height,g_height_write,graph_size,width,rows,graph_size1,width1,rows1,d_relabel,d_stochastic,d_counter,d_finish);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_push1_start_stochastic<<<gridBlock, threadBlock>>>(g_left_weight,g_right_weight,g_down_weight,g_up_weight,g_sink_weight,g_push_reser,g_relabel_mask,g_graph_height,g_height_write,graph_size,width,rows,graph_size1,width1,rows1,d_relabel,d_stochastic,d_counter,d_finish);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}