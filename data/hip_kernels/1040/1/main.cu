#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "delete_rows_and_columns.cu"
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
    int *dl_matrix = NULL;
hipMalloc(&dl_matrix, XSIZE*YSIZE);
int *deleted_rows = NULL;
hipMalloc(&deleted_rows, XSIZE*YSIZE);
int *deleted_cols = NULL;
hipMalloc(&deleted_cols, XSIZE*YSIZE);
const int search_depth = 1;
const int selected_row_id = 1;
const int total_dl_matrix_row_num = 1;
const int total_dl_matrix_col_num = 1;
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
delete_rows_and_columns<<<gridBlock, threadBlock>>>(dl_matrix,deleted_rows,deleted_cols,search_depth,selected_row_id,total_dl_matrix_row_num,total_dl_matrix_col_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
delete_rows_and_columns<<<gridBlock, threadBlock>>>(dl_matrix,deleted_rows,deleted_cols,search_depth,selected_row_id,total_dl_matrix_row_num,total_dl_matrix_col_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
delete_rows_and_columns<<<gridBlock, threadBlock>>>(dl_matrix,deleted_rows,deleted_cols,search_depth,selected_row_id,total_dl_matrix_row_num,total_dl_matrix_col_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}