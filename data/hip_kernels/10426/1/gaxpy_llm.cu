#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Check if block is within bounds
    if (bid < m) {
        // Calculate the product within threads
        if (tid < n) {
            dots_s[tid] = a[bid * n + tid] * x[tid];
        }

        __syncthreads();

        // Use a single thread to accumulate the sum
        if (tid == 0) {
            double sum = 0.0;
            for (int i = 0; i < n; i++) {
                sum += dots_s[i];
            }
            y[bid] = sum;
        }
    }
}