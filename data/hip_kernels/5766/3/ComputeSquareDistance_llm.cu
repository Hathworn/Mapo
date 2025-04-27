#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeSquareDistance(float* dOut, float* dIn, int n, int d)
{
    // Use shared memory to store blocks of data
    __shared__ float blockA[KNN_BLOCK_SIZE][KNN_BLOCK_SIZE];
    __shared__ float blockB[KNN_BLOCK_SIZE][KNN_BLOCK_SIZE];

    // Determine starting indices for blocks A and B
    int aStart = blockIdx.x * blockDim.x;
    int bStart = blockIdx.y * blockDim.y;

    int ax = aStart + threadIdx.x;
    int bx = bStart + threadIdx.y;

    float sqDist = 0.0f;

    // Calculate number of vertical blocks needed
    int numBlocksVertical = (d + KNN_BLOCK_SIZE - 1) / KNN_BLOCK_SIZE;

    for(int i = 0; i < numBlocksVertical; ++i)
    {
        int startY = i * KNN_BLOCK_SIZE;
        int currY  = startY + threadIdx.y;

        // Load data into shared memory
        if(startY + threadIdx.y < d)
        {
            if(ax < n)
                blockA[threadIdx.y][threadIdx.x] = dIn[ax * d + currY];
            if(bx < n)
                blockB[threadIdx.y][threadIdx.x] = dIn[(bStart + threadIdx.x) * d + currY];
        }
        __syncthreads();

        // Compute partial square distances
        if(ax < n && bx < n)
        {
            #pragma unroll  // Unroll loop for performance
            for(int j = 0; j < KNN_BLOCK_SIZE; ++j)
            {
                float diff = blockA[j][threadIdx.x] - blockB[j][threadIdx.y];
                sqDist += diff * diff;
            }
        }
        __syncthreads();
    }

    // Output the computed square distance
    if(ax < n && bx < n)
    {
        dOut[ax * n + bx] = ax == bx ? INFINITY : sqDist;
    }
}