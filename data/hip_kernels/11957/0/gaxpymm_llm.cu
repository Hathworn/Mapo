#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double sharedMem[];

    if (bid < m) {
        // Load shared memory with partial results for tid < n
        if (tid < n) {
            for (int c = 0; c < p; c++) {
                sharedMem[tid * p + c] = a[bid * n + tid] * b[tid * p + c];
            }
        }
        
        __syncthreads();
        
        // Reduce within block
        if (tid == 0) {
            for (int c = 0; c < p; c++) {
                double sum = sharedMem[c];
                for (int i = 1; i < n; i++) {
                    sum += sharedMem[i * p + c];
                }
                y[bid * p + c] = sum;
            }
        }
    }
}