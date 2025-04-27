#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel( int *a, int *b, int *c, int N ) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Use local variables to reduce global memory access
        int local_idx1 = (idx + 1) & 255; 
        int local_idx2 = (idx + 2) & 255;
        float a_sum = a[idx] + a[local_idx1] + a[local_idx2];
        float b_sum = b[idx] + b[local_idx1] + b[local_idx2];
        c[idx] = (a_sum + b_sum) / 6.0f; // Direct calculation to avoid redundant division
    }
}