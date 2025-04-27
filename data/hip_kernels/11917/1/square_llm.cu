#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float *d_out, const float *d_in) {
    // Use register to store input value for faster access
    const unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x;
    const float val = d_in[gid];
    
    // Avoid repeat computation by storing result in a register
    d_out[gid] = val * val;
}