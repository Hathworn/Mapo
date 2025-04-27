#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void quad(float *a, int n, float *u, float *v)
{
    int col  = blockIdx.x * blockDim.x + threadIdx.x;
    int row  = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds and compute when col >= row
    if (row < n && col < n && col >= row) {
        float sum = u[col]*a[row*n+col]*u[row];
        
        // Use shared memory to reduce atomic operations
        __shared__ float sharedSum;
        sharedSum = 0.0f;
        __syncthreads();

        // Atomic add to shared memory
        if (col == row) {
            atomicAdd(&sharedSum, sum);
        } else {
            atomicAdd(&sharedSum, 2*sum);
        }
        
        __syncthreads();

        // Atomic add from shared memory to global memory
        if (threadIdx.x == 0 && threadIdx.y == 0) {
            atomicAdd(v, sharedSum);
        }
    }
}