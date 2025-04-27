#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        if (tid < n) {
            // Initialize shared memory partial results
            for (int c = 0; c < p; c++) {
                dots_s[tid*p + c] = a[bid*n + tid] * b[tid*p + c];
            }
        }
        __syncthreads();

        // Parallel reduction to accumulate results into dots_s[0] for each column
        for (int stride = n/2; stride > 0; stride /= 2) {
            if (tid < stride) {
                for (int c = 0; c < p; c++) {
                    dots_s[tid*p + c] += dots_s[(tid + stride)*p + c];
                }
            }
            __syncthreads();
        }

        // Thread 0 writes the result
        if (tid == 0) {
            for (int c = 0; c < p; c++) {
                y[bid*p + c] = dots_s[c];
            }
        }
    }
}