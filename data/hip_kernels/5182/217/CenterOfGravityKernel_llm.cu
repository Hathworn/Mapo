#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CenterOfGravityKernel(float *pointsCoordinates, float *centerOfGravity, int *activityFlag, int maxCells) 
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x
                 + blockDim.x * blockIdx.x
                 + threadIdx.x;

    // Optimization: Use shared memory for acceleration
    __shared__ float xSumShared;
    __shared__ float ySumShared;
    __shared__ float zSumShared;
    __shared__ int livingCellsShared;

    if (threadId == 0) {
        xSumShared = 0.00f;
        ySumShared = 0.00f;
        zSumShared = 0.00f;
        livingCellsShared = 0;
    }
    __syncthreads();

    float xSum = 0.00f, ySum = 0.00f, zSum = 0.00f;
    int livingCells = 0;
    
    for (int c = threadId; c < maxCells; c += blockDim.x * gridDim.x) {
        if (activityFlag[c] == 1) {
            xSum += pointsCoordinates[c * 3];
            ySum += pointsCoordinates[c * 3 + 1];
            zSum += pointsCoordinates[c * 3 + 2];
            livingCells++;
        }
    }
    
    // Atomic operations to avoid race conditions
    atomicAdd(&xSumShared, xSum);
    atomicAdd(&ySumShared, ySum);
    atomicAdd(&zSumShared, zSum);
    atomicAdd(&livingCellsShared, livingCells);

    __syncthreads();

    if (threadId == 0) {
        centerOfGravity[0] = xSumShared / (float)livingCellsShared;
        centerOfGravity[1] = ySumShared / (float)livingCellsShared;
        centerOfGravity[2] = zSumShared / (float)livingCellsShared;
    }
}