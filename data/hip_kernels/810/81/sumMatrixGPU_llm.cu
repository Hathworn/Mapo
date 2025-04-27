#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate 1D global index for current thread
    unsigned int idx = blockIdx.y * blockDim.y * nx + blockIdx.x * blockDim.x + threadIdx.y * nx + threadIdx.x;

    // Boundary check
    if (idx < nx * ny)
    {
        MatC[idx] = MatA[idx] + MatB[idx]; // Perform element-wise addition
    }
}