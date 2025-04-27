#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        // Precompute index to reduce repetitive computation
        int index = bid * n + tid;
        if (tid < n) {
            // Compute the dot product directly and store locally
            dots_s[index] = a[index] * x[tid];
        }
        __syncthreads(); // Synchronize threads to ensure memory consistency

        // Perform reduction using a single thread block to improve performance
        if (tid == 0) {
            double sum = 0.0;
            for (int i = 0; i < n; i++) {
                sum += dots_s[bid * n + i];
            }
            y[bid] = sum; // Store the result in y
        }
    }
}