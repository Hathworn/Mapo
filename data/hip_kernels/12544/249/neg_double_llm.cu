#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void neg_double(int n, int idx, double *dy, int incy, double *result) {
    // Calculate the index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds and meets condition
    if (i < n && i >= idx && i % incy == 0) {
        result[i] = -dy[i]; // Negate value
    }
}