#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *x, float *y) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use global index to perform parallel addition
    if (index < n) {
        y[index] = x[index] + y[index];
    }
}