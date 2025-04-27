#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Ensure valid block index and thread index
    if (bid < m && tid < n) {
        for (int c = 0; c < p; c++) {
            // Load multiplication results to shared memory
            dots_s[tid * p + c] = a[bid * n + tid] * b[tid * p + c];
        }
        __syncthreads(); // Synchronize threads to ensure shared memory is ready

        // Accumulate results using a single thread
        if (tid == 0) {
            for (int c = 0; c < p; c++) {
                double sum = dots_s[c];
                for (int i = 1; i < n; i++) {
                    sum += dots_s[i * p + c];
                }
                y[bid * p + c] = sum; // Write results to global memory
            }
        }
    }
}