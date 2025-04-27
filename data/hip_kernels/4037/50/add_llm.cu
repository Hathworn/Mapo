#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *x, float *y) {
    // Calculate unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop through data using global indexing
    for (int i = index; i < n; i += stride) {
        y[i] = x[i] + y[i];
    }
}