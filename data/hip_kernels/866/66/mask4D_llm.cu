#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    while (tid < scalarCount) {
        // Calculate indices using fast integer division and modulus
        int xindex0 = tid / xstrides0;
        int rem0 = tid % xstrides0;
        int xindex1 = rem0 / xstrides1;
        int rem1 = rem0 % xstrides1;
        int xindex2 = rem1 / xstrides2;
        int xindex3 = rem1 % xstrides2;

        // Avoid repeated access to mask for optimization
        int threshold = mask[xindex0];
        if (xindex3 >= threshold) {
            in[tid] = 0;
        }

        tid += stride;
    }
}