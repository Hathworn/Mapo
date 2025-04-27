#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "topp_initialization_kernel.cu"
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
    bool *finished = NULL;
hipMalloc(&finished, XSIZE*YSIZE);
int *sequence_length = NULL;
hipMalloc(&sequence_length, XSIZE*YSIZE);
int *word_ids = NULL;
hipMalloc(&word_ids, XSIZE*YSIZE);
int *topp_id_val_buf = NULL;
hipMalloc(&topp_id_val_buf, XSIZE*YSIZE);
int *topp_offset_buf = NULL;
hipMalloc(&topp_offset_buf, XSIZE*YSIZE);
const int batch_size = 1;
const int vocab_size = 1;
const int start_id = 1;
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
topp_initialization_kernel<<<gridBlock, threadBlock>>>(finished,sequence_length,word_ids,topp_id_val_buf,topp_offset_buf,batch_size,vocab_size,start_id);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
topp_initialization_kernel<<<gridBlock, threadBlock>>>(finished,sequence_length,word_ids,topp_id_val_buf,topp_offset_buf,batch_size,vocab_size,start_id);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
topp_initialization_kernel<<<gridBlock, threadBlock>>>(finished,sequence_length,word_ids,topp_id_val_buf,topp_offset_buf,batch_size,vocab_size,start_id);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}