#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    while (tid < scalarCount) {
        // Calculate multi-dimensional index from 1D index
        int linearIndex = tid;
        int xindex0 = linearIndex / xstrides0;
        linearIndex = linearIndex - xstrides0 * xindex0;
        int xindex1 = linearIndex / xstrides1;
        linearIndex = linearIndex - xstrides1 * xindex1;
        int xindex2 = linearIndex / xstrides2;
        int xindex3 = linearIndex - xstrides2 * xindex2;

        // Set value to zero if condition is met
        if (xindex3 >= mask[xindex0]) in[tid] = 0;

        // Move to next index
        tid += stride;
    }
}