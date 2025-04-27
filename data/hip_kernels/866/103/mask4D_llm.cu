#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for better performance
    for (; tid < scalarCount; tid += stride) {
        // Inline calculations using modulo to avoid repeated division
        int xindex0 = tid / xstrides0;
        int remainder0 = tid % xstrides0;
        int xindex1 = remainder0 / xstrides1;
        int remainder1 = remainder0 % xstrides1;
        int xindex2 = remainder1 / xstrides2;
        int xindex3 = remainder1 % xstrides2;

        // Simplified conditional checking
        if (xindex3 >= mask[xindex0]) 
            in[tid] = 0;
    }
}