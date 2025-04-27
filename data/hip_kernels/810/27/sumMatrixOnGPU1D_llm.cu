#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global thread ID
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate global index and stride
    unsigned int idx = iy * nx + ix;
    unsigned int stride = blockDim.x * gridDim.x;

    // Ensure thread is within bounds and process in strides
    for (unsigned int i = idx; i < nx * ny; i += stride)
    {
        MatC[i] = MatA[i] + MatB[i];
    }
}