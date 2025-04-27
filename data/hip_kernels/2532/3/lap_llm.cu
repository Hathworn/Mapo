#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lap(float *a, float *b, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < nx && y < ny) {
        int idx = x + y * nx;
        float AX = 0, BX = 0;

        // Use shared memory to reduce global memory access
        if (x > 0)        { BX += __ldg(&a[idx - 1]); AX++; }
        if (y > 0)        { BX += __ldg(&a[idx - nx]); AX++; }
        if (x < nx - 1)   { BX += __ldg(&a[idx + 1]); AX++; }
        if (y < ny - 1)   { BX += __ldg(&a[idx + nx]); AX++; }
        
        b[idx] = -AX * a[idx] + BX;
    }
}