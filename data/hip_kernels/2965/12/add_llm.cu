#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(const int *a, const int *b, int *dest, const size_t length) {
    // Use thread index to increase parallelism
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    
    if (tid < length) {
        dest[tid] = a[tid] - b[tid];
    }
}