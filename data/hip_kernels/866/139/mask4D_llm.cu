#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use register for linearIndex to improve performance
    for (; tid < scalarCount; tid += stride) {
        int linearIndex = tid;

        // Optimize index calculations using reduced arithmetic operations
        int xindex0 = linearIndex / xstrides0;
        linearIndex -= xstrides0 * xindex0;
        int xindex1 = linearIndex / xstrides1;
        linearIndex -= xstrides1 * xindex1;
        int xindex2 = linearIndex / xstrides2;
        int xindex3 = linearIndex - xstrides2 * xindex2;

        // Reduce memory load by caching mask[xindex0]
        int maskValue = mask[xindex0];
        if (xindex3 >= maskValue) in[tid] = 0;
    }
}