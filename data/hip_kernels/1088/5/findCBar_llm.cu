#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void findCBar(double* cOld, double* cCurr, double* cBar, int nx)
{
    // Matrix index
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;

    // Avoid index calculation for unnecessary threads
    if (globalIdx >= nx) return;

    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;
    int index = globalIdy * nx + globalIdx;

    // Ensure index is within bounds before accessing arrays
    if (index < nx * gridDim.y * blockDim.y) {
        // Compute cBar
        cBar[index] = 2.0 * cCurr[index] - cOld[index];
    }
}