#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "prime_generator.cu"
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
    int *d_input_list = NULL;
hipMalloc(&d_input_list, XSIZE*YSIZE);
uint64_cu *d_prime_list = NULL;
hipMalloc(&d_prime_list, XSIZE*YSIZE);
uint64_cu *d_startPrimelist = NULL;
hipMalloc(&d_startPrimelist, XSIZE*YSIZE);
uint64_cu *d_total_inputsize = NULL;
hipMalloc(&d_total_inputsize, XSIZE*YSIZE);
uint64_cu *d_number_of_primes = NULL;
hipMalloc(&d_number_of_primes, XSIZE*YSIZE);
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
prime_generator<<<gridBlock, threadBlock>>>(d_input_list,d_prime_list,d_startPrimelist,d_total_inputsize,d_number_of_primes);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
prime_generator<<<gridBlock, threadBlock>>>(d_input_list,d_prime_list,d_startPrimelist,d_total_inputsize,d_number_of_primes);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
prime_generator<<<gridBlock, threadBlock>>>(d_input_list,d_prime_list,d_startPrimelist,d_total_inputsize,d_number_of_primes);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}