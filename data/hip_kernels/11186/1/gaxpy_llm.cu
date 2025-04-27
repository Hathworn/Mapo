#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    // Use a more compact thread mapping for better memory coalescing
    int index = bid * n + tid;

    if (bid < m && tid < n) {
        dots_s[tid] = a[index] * x[tid];
        __syncthreads();

        // Utilize parallel reduction for accumulation
        for (int stride = n / 2; stride > 0; stride >>= 1) {
            if (tid < stride) {
                dots_s[tid] += dots_s[tid + stride];
            }
            __syncthreads();
        }

        // Only the first thread writes the result
        if (tid == 0) {
            y[bid] = dots_s[0];
        }
    }
}