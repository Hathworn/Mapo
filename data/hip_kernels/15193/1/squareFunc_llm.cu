#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void squareFunc(unsigned int *d_in, unsigned int *d_out)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Ensure unique thread index across grid
    if (idx < blockDim.x) { // Boundary check to avoid out-of-bounds access
        unsigned int val = d_in[idx];
        d_out[idx] = val * val;
    }
    //printf("%d square value %d \n  ", idx, d_out[idx]);
}