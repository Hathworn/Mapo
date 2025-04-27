#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void neg_double(int n, int idx, double *dy, int incy, double *result) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop with stride of total threads
    while (i < n) {
        if(i >= idx && i % incy == 0) {
            result[i] = -dy[i]; // Negate and assign
        }
        i += blockDim.x * gridDim.x; // Move to next position
    }
}