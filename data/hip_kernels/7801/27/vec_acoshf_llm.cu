#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_acoshf (size_t n, float *result, float *x)
{
    // Compute global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop unrolling: process elements in chunks, assuming n is multiple of chunk size
    int stride = gridDim.x * blockDim.x;
    for (; id < n; id += stride)
    {
        result[id] = acoshf(x[id]);
    }
}