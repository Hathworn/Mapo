#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(double *a, double *b, double *c, int n) {
    // Calculate contiguous global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Improved bounds check with efficient memory access
    if (id < n) {
        double temp_a = a[id];  // Cache data from global memory
        double temp_b = b[id];  // Cache data from global memory
        c[id] = temp_a + temp_b; // Perform addition and write to global memory
    }
}