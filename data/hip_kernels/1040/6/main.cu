#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "check_existance_of_candidate_rows.cu"
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
    int *deleted_rows = NULL;
hipMalloc(&deleted_rows, XSIZE*YSIZE);
int *row_group = NULL;
hipMalloc(&row_group, XSIZE*YSIZE);
const int search_depth = 1;
int *token = NULL;
hipMalloc(&token, XSIZE*YSIZE);
int *selected_row_id = NULL;
hipMalloc(&selected_row_id, XSIZE*YSIZE);
const int total_dl_matrix_row_num = 1;
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
check_existance_of_candidate_rows<<<gridBlock, threadBlock>>>(deleted_rows,row_group,search_depth,token,selected_row_id,total_dl_matrix_row_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
check_existance_of_candidate_rows<<<gridBlock, threadBlock>>>(deleted_rows,row_group,search_depth,token,selected_row_id,total_dl_matrix_row_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
check_existance_of_candidate_rows<<<gridBlock, threadBlock>>>(deleted_rows,row_group,search_depth,token,selected_row_id,total_dl_matrix_row_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}