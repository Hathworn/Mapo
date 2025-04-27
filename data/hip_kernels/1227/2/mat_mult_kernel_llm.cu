#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_mult_kernel(int *a, int *b, int *c, int mat_rows, int mat_cols) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for improved coalescing

    while (tid < mat_rows) {
        int res = 0;
        for (int i = 0; i < mat_cols; i++) {
            res += a[tid * mat_cols + i] * b[i]; // Accumulate results
        }
        c[tid] = res; // Store result in global memory
        tid += stride; // Use calculated stride for next position
    }
}