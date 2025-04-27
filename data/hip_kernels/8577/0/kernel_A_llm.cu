#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_A( float *g_data, int dimx, int dimy )
{
    int ix  = blockIdx.x;
    int iy  = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = iy * dimx + ix;

    // Ensure index is within array bounds
    if (ix < dimx && iy < dimy) {
        float value = g_data[idx];

        // Conditional operations based on ix parity
        float calculation = sqrtf(((ix % 2) ? logf(value) : cosf(value)) + 1.f);
        value += calculation;

        g_data[idx] = value;
    }
}