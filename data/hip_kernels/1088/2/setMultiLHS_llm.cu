#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setMultiLHS(double* dsMulti, double* dlMulti, double* diagMulti, double* duMulti, double* dwMulti, double a, double b, double c, double d, double e, int nx, int batchCount)
{
    // Calculate global index for better warp utilization
    int index = threadIdx.x + blockIdx.x * blockDim.x + (threadIdx.y + blockIdx.y * blockDim.y) * batchCount;

    // Boundary check using one condition for improved efficiency
    if (index < nx * batchCount) {
        
        // Coalesced memory accesses
        dsMulti[index] = a;
        dlMulti[index] = b;
        diagMulti[index] = c;
        duMulti[index] = d;
        dwMulti[index] = e;
    }
}