#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gen_matvec(float *A, float *x, float *y, const int m, const int n)
{
    // Use shared memory for input vector
    extern __shared__ float shared_x[];
    
    // Calculate global index
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (threadIdx.x < n) {
        // Load data to shared memory
        shared_x[threadIdx.x] = x[threadIdx.x];
    }
    
    __syncthreads(); // Synchronize threads
    
    if (xIndex < m) {
        float c = 0.0f;
        for (int i = 0; i < n; i++) {
            // Accessing shared memory
            c += shared_x[i] * A[xIndex + m * i];
        }
        y[xIndex] = c;
    }
}