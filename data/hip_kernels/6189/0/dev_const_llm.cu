#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_const(float *px, float k) {
    // Compute global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate total number of threads
    int total_threads = gridDim.x * blockDim.x;

    // Loop over elements in steps of total_threads
    for(int i = tid; i < total_threads; i += total_threads) {
        px[i] = k;
    }
}