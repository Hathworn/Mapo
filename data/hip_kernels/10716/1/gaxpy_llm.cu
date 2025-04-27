#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        // Cooperative loading of data into shared memory
        double local_sum = 0.0;
        for (int i = tid; i < n; i += blockDim.x) {
            local_sum += a[bid * n + i] * x[i];
        }

        // Reduce sum within each block
        dots_s[tid] = local_sum;
        __syncthreads();

        // Reduction step
        for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            if (tid < stride) {
                dots_s[tid] += dots_s[tid + stride];
            }
            __syncthreads();
        }

        // Write result back to global memory
        if (tid == 0) {
            y[bid] = dots_s[0];
        }
    }
}