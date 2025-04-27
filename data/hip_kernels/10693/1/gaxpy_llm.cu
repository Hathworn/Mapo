#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];

    if (bid < m) {
        // Calculate index for accessing shared memory.
        int index = tid;
        
        if (index < n) {
            // Perform multiplication for each element.
            dots_s[index] = a[bid * n + index] * x[index];
        }
        __syncthreads();

        // Use parallel reduction for summation.
        for (int offset = n / 2; offset > 0; offset >>= 1) {
            if (index < offset) {
                dots_s[index] += dots_s[index + offset];
            }
            __syncthreads();
        }

        // Store the result of the reduction.
        if (index == 0) {
            y[bid] = dots_s[0];
        }
    }
}