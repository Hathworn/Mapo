#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "izhikevich_update_membrane_potentials_kernel.cu"
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
    float *d_membrane_potentials_v = NULL;
hipMalloc(&d_membrane_potentials_v, XSIZE*YSIZE);
float *d_states_u = NULL;
hipMalloc(&d_states_u, XSIZE*YSIZE);
float *d_param_a = NULL;
hipMalloc(&d_param_a, XSIZE*YSIZE);
float *d_param_b = NULL;
hipMalloc(&d_param_b, XSIZE*YSIZE);
float *d_current_injections = NULL;
hipMalloc(&d_current_injections, XSIZE*YSIZE);
float timestep = 1;
size_t total_number_of_neurons = 1;
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
izhikevich_update_membrane_potentials_kernel<<<gridBlock, threadBlock>>>(d_membrane_potentials_v,d_states_u,d_param_a,d_param_b,d_current_injections,timestep,total_number_of_neurons);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
izhikevich_update_membrane_potentials_kernel<<<gridBlock, threadBlock>>>(d_membrane_potentials_v,d_states_u,d_param_a,d_param_b,d_current_injections,timestep,total_number_of_neurons);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
izhikevich_update_membrane_potentials_kernel<<<gridBlock, threadBlock>>>(d_membrane_potentials_v,d_states_u,d_param_a,d_param_b,d_current_injections,timestep,total_number_of_neurons);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}