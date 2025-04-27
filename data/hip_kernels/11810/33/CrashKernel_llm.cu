#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CrashKernel(double *array, int nrad, int nsec, int Crash)
{
    // Calculate flattened global thread index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Combined flattened index for array access
    int index = idy * nsec + idx;

    // Boundary check for both dimensions
    if (idy < nrad && idx < nsec) {
        // Use ternary operator for concise conditional assignment
        array[index] = (array[index] < 0.0) ? 1.0 : 0.0;
    }
}