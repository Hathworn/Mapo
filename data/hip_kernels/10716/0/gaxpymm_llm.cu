#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        if (tid < n) {
            int offset = bid * n * p + tid * p;
            for (int c = 0; c < p; c++) {
                dots_s[offset + c] = a[bid * n + tid] * b[tid * p + c];
            }
        }

        __syncthreads();

        // Using reduction pattern for better parallelism.
        if (tid < n / 2) {
            for (int c = 0; c < p; c++) {
                for (int step = 1; step < n; step *= 2) {
                    if (tid + step < n) {
                        dots_s[bid * n * p + tid * p + c] += dots_s[bid * n * p + (tid + step) * p + c];
                    }
                    __syncthreads();
                }
            }
        }

        if (tid == 0) {
            for (int c = 0; c < p; c++) {
                y[bid * p + c] = dots_s[bid * n * p + c];
            }
        }
    }
}