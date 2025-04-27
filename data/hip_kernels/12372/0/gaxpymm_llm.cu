#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        // Use a single loop to handle multiplication and accumulation
        for (int c = 0; c < p; c++) {
            double sum = 0.0;  // Initialize accumulator
            for (int i = 0; i < n; i++) {
                sum += a[bid * n + i] * b[i * p + c];
            }
            // Store the computed result
            if (tid == 0) {
                y[bid * p + c] = sum;
            }
        }
    }
}