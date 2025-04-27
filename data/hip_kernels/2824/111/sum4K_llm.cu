#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum4K(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Preload the loop condition check to minimize redundant operations
    if (i >= N) return;
    
    float x[4];

    // Using shared memory to improve memory access times
    __shared__ float sharedA[1024], sharedB[1024];
    
    int localIdx = threadIdx.x;
    for (int j = 0; j < 4; j++)
    {
        if (i < N) 
        {
            sharedA[localIdx] = A[i];
            sharedB[localIdx] = B[i];
            
            x[j] = sharedA[localIdx] * sharedA[localIdx];
            C[i] += sharedA[localIdx] * 3 + 20 * sharedB[localIdx] - sharedA[localIdx] * x[j] + x[j] * sharedB[localIdx] * 7;
            
            i += blockDim.x * gridDim.x;
        }
    }
}