#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use shared memory for faster data access
    extern __shared__ float shared_X[];

    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (i < N) {
        shared_X[threadIdx.x] = X[i * INCX];
        __syncthreads();
        
        // Perform computation using shared memory
        if ((shared_X[threadIdx.x] * shared_X[threadIdx.x]) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}