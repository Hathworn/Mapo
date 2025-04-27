#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernel(int n, double* gpuWeights, int* gpuG, int* gpuTempGrid, int *flag)
{
    // Moment's coordinates in the grid //
    int momentCol = blockIdx.x * blockDim.x + threadIdx.x;
    int momentRow = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Shared memory allocated for weights //
    __shared__ double sharedWeights[25];
    // Shared memory allocated for a block of moments //
    // Size is (BLOCK_SIZE+4)^2 //
    int sharedSize = (BLOCK_SIZE+4);
    __shared__ int sharedG[(BLOCK_SIZE+4)*(BLOCK_SIZE+4)];
    
    // Moment's coordinates in the shared memory //
    int sharedRow = threadIdx.y + 2;
    int sharedCol = threadIdx.x + 2;

    // Store weights in shared memory //
    if (threadIdx.x < 5 && threadIdx.y < 5)
        sharedWeights[threadIdx.x * 5 + threadIdx.y] = gpuWeights[threadIdx.x * 5 + threadIdx.y];

    // Synchronize to ensure sharedWeights are fully loaded //
    __syncthreads();

    // In this double loop, moments and their necessary neighbours are //
    // passed from global to shared memory sequentially //
    for (int i = momentRow; i < n + 2; i += blockDim.y * gridDim.y)
    {
        for (int j = momentCol; j < n + 2; j += blockDim.x * gridDim.x)
        {
            // Store moment in shared memory //
            sharedG[sharedRow * sharedSize + sharedCol] = gpuG[((i + n) % n) * n + ((j + n) % n)];
            
            if (threadIdx.x < 2)
            {
                int idxRow = (i + n) % n;

                // Load boundaries //
                sharedG[sharedRow * sharedSize + sharedCol - 2] = gpuG[idxRow * n + (-2 + j + n) % n];
                sharedG[sharedRow * sharedSize + sharedCol + BLOCK_SIZE] = gpuG[idxRow * n + (BLOCK_SIZE + j + n) % n];

                if (threadIdx.y < 2)
                {
                    // Load corners //
                    sharedG[(sharedRow - 2) * sharedSize + sharedCol - 2] = gpuG[((-2 + i + n) % n) * n + (-2 + j + n) % n];
                    sharedG[(sharedRow + BLOCK_SIZE) * sharedSize + sharedCol - 2] = gpuG[((i + n + BLOCK_SIZE) % n) * n + (-2 + j + n) % n];
                    sharedG[(sharedRow - 2) * sharedSize + sharedCol + BLOCK_SIZE] = gpuG[((-2 + i + n) % n) * n + (j + n + BLOCK_SIZE) % n];
                    sharedG[(sharedRow + BLOCK_SIZE) * sharedSize + sharedCol + BLOCK_SIZE] = gpuG[((i + n + BLOCK_SIZE) % n) * n + (j + n + BLOCK_SIZE) % n];
                }
            }
            
            if (threadIdx.y < 2)
            {
                int idxRowTop = (-2 + i + n) % n;
                int idxRowBottom = (i + n + BLOCK_SIZE) % n;

                // Load top and bottom boundaries //
                sharedG[(sharedRow - 2) * sharedSize + sharedCol] = gpuG[idxRowTop * n + (j + n) % n];
                sharedG[(sharedRow + BLOCK_SIZE) * sharedSize + sharedCol] = gpuG[idxRowBottom * n + (j + n) % n];
            }
            
            __syncthreads();

            // Compute the spins of moments within the grid //
            if (i < n && j < n)
            {
                double weightFactor = 0.0;
                
                for (int row = 0; row < 5; row++)
                {
                    for (int col = 0; col < 5; col++)
                    {
                        if (col == 2 && row == 2) continue;
                        weightFactor += sharedG[(sharedRow - 2 + row) * sharedSize + sharedCol - 2 + col] * sharedWeights[row * 5 + col];
                    }
                }

                // Determine future atomic spin value based on weight factor //
                if (abs(weightFactor) < 0.0001)
                {
                    gpuTempGrid[n * i + j] = sharedG[sharedRow * sharedSize + sharedCol];
                }
                else if (weightFactor > 0.00001)
                {
                    gpuTempGrid[n * i + j] = 1;
                    if (gpuG[n * i + j] == -1)
                    {
                        *flag = 1;
                    }
                }
                else
                {
                    gpuTempGrid[n * i + j] = -1;
                    if (gpuG[n * i + j] == 1)
                    {
                        *flag = 1;
                    }
                }
            }
            __syncthreads();
        }
    }
}