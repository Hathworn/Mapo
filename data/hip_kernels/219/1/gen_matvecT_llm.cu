#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gen_matvecT(float *A, float *x, float *y, const int m, const int n)
{
    // Use shared memory for y to reduce global memory accesses
    __shared__ float shared_y[1024];  // Assume 1024 threads per block (adjust size as needed)
    
    // Load y elements into shared memory
    if (threadIdx.x < m) {
        shared_y[threadIdx.x] = y[threadIdx.x];
    }
    __syncthreads();  // Ensure all y elements are loaded before proceeding

    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    if (xIndex < n) {
        float c = 0.0f;
        for (int i = 0; i < m; i++) {
            c += shared_y[i] * A[xIndex * m + i];  // Use shared memory for y[i]
        }
        x[xIndex] = c;
    }
}