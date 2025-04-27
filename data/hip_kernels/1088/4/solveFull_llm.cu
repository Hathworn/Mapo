#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void solveFull ( double* data, double* inv1, double* inv2, const int nx, const int nBatch )
{
    // Matrix index
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Check boundary
    if (globalIdy >= nx - 2) return;

    // Calculate reused data indices for performance
    int globalBatchIdx = globalIdx;
    int oldNx2Idx = (nx - 2) * nBatch + globalBatchIdx; // Two points from end
    int oldNx1Idx = (nx - 1) * nBatch + globalBatchIdx; // One point from end
    
    // Load reused data into registers
    double oldNx2 = data[oldNx2Idx];
    double oldNx1 = data[oldNx1Idx];
 
    // Set index being computed
    int index = globalIdy * nBatch + globalBatchIdx;

    // Perform computation
    data[index] -= inv1[index] * oldNx2 + inv2[index] * oldNx1;
}