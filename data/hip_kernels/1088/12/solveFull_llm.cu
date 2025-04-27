#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void solveFull(double* data, double* inv1, double* inv2, const int nx, const int nBatch)
{
    // Matrix index
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;

    // Guard clause to prevent accessing out-of-bounds memory
    if (globalIdx >= nBatch || globalIdy >= nx - 2) return;
    
    // Set values to last two entries in array
    double oldNx2 = data[(nx - 2) * nBatch + globalIdx]; // Two points from end
    double oldNx1 = data[(nx - 1) * nBatch + globalIdx]; // One point from end

    // Prevent redundant calculations outside the intended index range
    if (globalIdy < nx - 2)
    {
        int index = globalIdy * nBatch + globalIdx;
        data[index] -= (inv1[index] * oldNx2 + inv2[index] * oldNx1); // Optimize subtract operation
    }
}