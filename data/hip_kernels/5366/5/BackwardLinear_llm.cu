#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BackwardLinear(float *dZ, float *W, int nColsW, int nRowsW, int nColsdZ, float *dA)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    float dAValue = 0;

    // Check bounds before entering loop
    if (row < nColsW && col < nColsdZ)
    {
        // Use shared memory to optimize access to W array
        __shared__ float sharedW[blockDim.y][blockDim.x];
        
        for (int i = 0; i < nRowsW; i++)
        {
            sharedW[threadIdx.y][threadIdx.x] = W[i * nColsW + row];
            __syncthreads(); // Ensure all threads have loaded data
            
            dAValue += sharedW[threadIdx.y][threadIdx.x] * dZ[i * nColsdZ + col];
            __syncthreads(); // Ensure completion before next iteration
        }
        
        dA[row * nColsdZ + col] = dAValue;
    }
}