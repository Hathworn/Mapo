#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_carr(float br, float bi, float * c, int N)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (idx < N) {
        int idc = idx * 2;  // Calculate position in c

        // Set values in c array
        c[idc] = br;
        c[idc + 1] = bi;
    }
}