#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        // Read input data into shared memory
        double temp_sum = 0.0;
        for (int c = 0; c < p; c++) {
            if (tid < n) {
                dots_s[tid * p + c] = a[bid * n + tid] * b[tid * p + c];
            }
        }
        __syncthreads();

        // Accumulate results with parallel reduction
        for (int c = 0; c < p; c++) {
            for (int stride = 1; stride < n; stride *= 2) {
                if (tid % (2 * stride) == 0 && tid + stride < n) {
                    dots_s[tid * p + c] += dots_s[(tid + stride) * p + c];
                }
                __syncthreads();
            }
            // Write result to global memory
            if (tid == 0) {
                y[bid * p + c] = dots_s[c];
            }
        }
    }
}