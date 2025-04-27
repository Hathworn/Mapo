#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Utilize a single index calculation for better memory coalescing
    unsigned int idx = blockIdx.y * blockDim.y * nx + blockIdx.x * blockDim.x + threadIdx.y * nx + threadIdx.x;

    if (idx < nx * ny)
    {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}