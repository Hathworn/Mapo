#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    extern __shared__ double dots_s[];
    
    // Use a thread block to handle multiple rows if possible
    int rowStep = gridDim.x;
    for (int row = bid; row < m; row += rowStep) {
        if (tid < n) {
            dots_s[tid] = a[row * n + tid] * x[tid]; // Store result in shared memory
        }
        __syncthreads(); // Synchronize to ensure all threads have written

        // Reduction within the block
        for (int stride = n / 2; stride > 0; stride >>= 1) {
            if (tid < stride && tid + stride < n) {
                dots_s[tid] += dots_s[tid + stride];
            }
            __syncthreads(); // Ensure stride reduction is complete before next stride
        }
        
        if (tid == 0) {
            y[row] = dots_s[0]; // First thread writes the result
        }
        __syncthreads();
    }
}