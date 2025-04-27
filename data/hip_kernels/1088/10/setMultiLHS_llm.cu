#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setMultiLHS(double* dsMulti, double* dlMulti, double* diagMulti, double* duMulti, double* dwMulti, double a, double b, double c, double d, double e, int nx, int batchCount)
{
    // Calculate thread's global index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int globalIdy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds for both indices
    if (globalIdx < batchCount && globalIdy < nx)
    {
        int index = globalIdy * batchCount + globalIdx;  // Compute index inside bounds

        // Assign values to the matrices
        dsMulti[index] = a;
        dlMulti[index] = b;
        diagMulti[index] = c;
        duMulti[index] = d;
        dwMulti[index] = e;
    }
}