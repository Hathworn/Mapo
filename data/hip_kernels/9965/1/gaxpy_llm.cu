#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Check if block index is within bounds
    if (bid < m) {
        // Each thread computes its part of the dot product
        if (tid < n) {
            dots_s[tid] = a[bid * n + tid] * x[tid];
        } else {
            dots_s[tid] = 0.0;  // Initialize unused part of shared memory to zero
        }
        __syncthreads();

        // Use parallel reduction to sum the results
        for (int stride = n / 2; stride > 0; stride /= 2) {
            if (tid < stride) {
                dots_s[tid] += dots_s[tid + stride];
            }
            __syncthreads();
        }

        // Only the first thread writes the result
        if (tid == 0) {
            y[bid] = dots_s[0];
        }
    }
}