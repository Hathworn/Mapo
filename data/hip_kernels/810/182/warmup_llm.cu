#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(int *out, int N) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single if condition for index within bounds
    if (tid < N) {
        out[tid] = 0;
    }
}