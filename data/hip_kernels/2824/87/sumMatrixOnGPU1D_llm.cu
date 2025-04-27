```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    if (ix >= nx) return; // Early exit if thread is out of bounds

    // Use loop unrolling for improved performance
    for (int iy = 0; iy < ny; iy += 4)
    {
        int idx = iy * nx + ix;
        MatC[idx] = MatA[idx] + MatB[idx];
        
        if (iy + 1 < ny) // Avoid out of bounds in unrolling
        {
            idx = (iy + 1) * nx + ix;
            MatC[idx] = MatA[idx] + MatB[idx];
        }
        if (iy + 2 < ny) 
        {
            idx = (iy + 2) * nx + ix;
            MatC[idx] = MatA[idx] + MatB[idx];
        }
        if (iy + 3 < ny) 
        {
            idx = (iy + 3) * nx + ix;
            MatC[idx] = MatA[idx] + MatB[idx];
        }
    }
}