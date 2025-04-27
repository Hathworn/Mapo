#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function for setting random numbers

__global__ void setRandom(hiprandState_t* states, int* numbers, int max) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure idx does not exceed array bounds
    if (idx < TOTALTHREADS) {
        numbers[idx] = hiprand(&states[idx]) % max;
    }
}