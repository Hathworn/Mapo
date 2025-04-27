#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Check if block index is within range
    if (bid < m) {
        // Load and compute partial results into shared memory
        for (int c = 0; c < p; c++) {
            if (tid < n) {
                dots_s[tid*p + c] = a[bid*n + tid] * b[tid*p + c];
            }
        }

        __syncthreads();

        // First thread in block reduces partial results
        if (tid == 0) {
            for (int c = 0; c < p; c++) {
                double sum = 0.0;
                for (int i = 0; i < n; i++) {
                    sum += dots_s[i*p + c];
                }
                y[bid*p + c] = sum; // Store result in global memory
            }
        }
    }
}