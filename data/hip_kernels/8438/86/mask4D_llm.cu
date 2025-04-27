```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    // Calculate thread ID and stride efficiently using grid-stride loop
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop through elements, updating by stride
    for (int idx = tid; idx < scalarCount; idx += stride) {
        int linearIndex = idx;
        // Calculate multi-dimensional indices using modulo and division
        int xindex0 = linearIndex / xstrides0;
        linearIndex -= xindex0 * xstrides0;
        int xindex1 = linearIndex / xstrides1;
        linearIndex -= xindex1 * xstrides1;
        int xindex2 = linearIndex / xstrides2;
        int xindex3 = linearIndex % xstrides2; // Use modulo for xindex3 calculation

        // Apply mask condition
        if (xindex3 >= mask[xindex0]) {
            in[idx] = 0;
        }
    }
}