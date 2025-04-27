#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m && tid < n) {  // Combined condition checks
        double product = a[bid * n + tid] * x[tid];  // Use a register for temporary storage

        // Parallel reduction for dot product
        dots_s[tid] = product;
        __syncthreads();

        for (int stride = n / 2; stride > 0; stride /= 2) {
            if (tid < stride) {
                dots_s[tid] += dots_s[tid + stride];
            }
            __syncthreads();
        }

        if (tid == 0) {
            y[bid] = dots_s[0];  // Write result to global memory
        }
    }
}