#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cube(double* d_out, const double* __restrict__ d_in)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use global index
    double f = d_in[idx];
    d_out[idx] = f * f * f; // Maintain load/store efficiency
}