```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Calculate shared memory index for coalesced access
    unsigned int ti = iy * nx + ix;
    unsigned int to = ix * ny + iy;

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        // Use registers for repeated calculations
        unsigned int inputIndex1 = to;
        unsigned int inputIndex2 = to + blockDim.x * ny;
        unsigned int inputIndex3 = to + 2 * blockDim.x * ny;
        unsigned int inputIndex4 = to + 3 * blockDim.x * ny;

        // Transfer data with less global memory access
        float temp1 = in[inputIndex1];
        float temp2 = in[inputIndex2];
        float temp3 = in[inputIndex3];
        float temp4 = in[inputIndex4];

        // Writing back to global memory
        out[ti] = temp1;
        out[ti +   blockDim.x] = temp2;
        out[ti + 2 * blockDim.x] = temp3;
        out[ti + 3 * blockDim.x] = temp4;
    }
}