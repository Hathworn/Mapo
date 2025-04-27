#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Early exit if block index exceeds the limit
    if (bid >= m) return;
    
    // Perform calculations only on valid thread indices
    if (tid < n) {
        dots_s[tid] = a[bid * n + tid] * x[tid];
    }
    __syncthreads();

    // Use reduction to sum the shared memory elements
    for (int stride = n / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            dots_s[tid] += dots_s[tid + stride];
        }
        __syncthreads();
    }

    // Write the result from tid 0 to global memory
    if (tid == 0) {
        y[bid] = dots_s[0];
    }
}