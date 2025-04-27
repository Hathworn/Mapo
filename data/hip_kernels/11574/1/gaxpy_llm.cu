#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Ensure valid block and thread indexing
    if (bid < m && tid < n) {
        dots_s[tid] = a[bid * n + tid] * x[tid];
    }

    __syncthreads();

    // Reduce using parallel reduction (faster accumulation of dots_s)
    for (int stride = n / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            dots_s[tid] += dots_s[tid + stride];
        }
        __syncthreads();
    }

    // Write result to output when thread 0 sums the segment
    if (tid == 0) {
        y[bid] = dots_s[0];
    }
}