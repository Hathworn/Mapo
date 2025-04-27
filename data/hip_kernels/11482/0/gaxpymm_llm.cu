#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpymm(double *y, double *a, double *b, int m, int n, int p) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];
    
    if (bid < m) {
        if (tid < n) {
            // Compute partial dot products
            for (int c = 0; c < p; c++) {
                dots_s[tid * p + c] = a[bid * n + tid] * b[tid * p + c];
            }
        }
        
        __syncthreads();
        
        if (tid == 0) {
            // Aggregate the results
            for (int c = 0; c < p; c++) {
                double sum = 0.0;
                for (int i = 0; i < n; i++) {
                    sum += dots_s[i * p + c];
                }
                y[bid * p + c] = sum;
            }
        }
    }
}