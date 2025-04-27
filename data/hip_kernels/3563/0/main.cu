#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "graph_determ_weights.cu"
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
    unsigned int *contact_mat_cum_row_indexes = NULL;
hipMalloc(&contact_mat_cum_row_indexes, XSIZE*YSIZE);
unsigned int *contact_mat_column_indexes = NULL;
hipMalloc(&contact_mat_column_indexes, XSIZE*YSIZE);
float *contact_mat_values = NULL;
hipMalloc(&contact_mat_values, XSIZE*YSIZE);
unsigned int rows = 1;
unsigned int values = 1;
float *immunities = NULL;
hipMalloc(&immunities, XSIZE*YSIZE);
float *shedding_curve = NULL;
hipMalloc(&shedding_curve, XSIZE*YSIZE);
unsigned int infection_length = 1;
float transmission_rate = 1;
int *infection_mat_values = NULL;
hipMalloc(&infection_mat_values, XSIZE*YSIZE);
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
graph_determ_weights<<<gridBlock, threadBlock>>>(contact_mat_cum_row_indexes,contact_mat_column_indexes,contact_mat_values,rows,values,immunities,shedding_curve,infection_length,transmission_rate,infection_mat_values);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
graph_determ_weights<<<gridBlock, threadBlock>>>(contact_mat_cum_row_indexes,contact_mat_column_indexes,contact_mat_values,rows,values,immunities,shedding_curve,infection_length,transmission_rate,infection_mat_values);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
graph_determ_weights<<<gridBlock, threadBlock>>>(contact_mat_cum_row_indexes,contact_mat_column_indexes,contact_mat_values,rows,values,immunities,shedding_curve,infection_length,transmission_rate,infection_mat_values);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}