#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiply(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns)
{
    // variable declarations
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds and compute matrix multiplication
    if (row < numARows && col < numBColumns)
    {
        float Cvalue = 0.0;
        
        // Use shared memory to reduce global memory accesses
        __shared__ float sharedA[32][32]; // Assuming blockDim is 32
        __shared__ float sharedB[32][32];

        for (int k = 0; k < (numAColumns + 31) / 32; ++k)
        {
            if(k * 32 + threadIdx.x < numAColumns && row < numARows)
                sharedA[threadIdx.y][threadIdx.x] = A[row * numAColumns + k * 32 + threadIdx.x];
            else
                sharedA[threadIdx.y][threadIdx.x] = 0.0;

            if(k * 32 + threadIdx.y < numBRows && col < numBColumns)
                sharedB[threadIdx.y][threadIdx.x] = B[(k * 32 + threadIdx.y) * numBColumns + col];
            else
                sharedB[threadIdx.y][threadIdx.x] = 0.0;

            __syncthreads();

            for (int n = 0; n < 32; ++n)
                Cvalue += sharedA[threadIdx.y][n] * sharedB[n][threadIdx.x];

            __syncthreads();
        }
        
        C[row * numCColumns + col] = Cvalue;
    }
}