#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_eqf (size_t n, float *result, float *x, float *y)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Shared memory for better data locality (optional, depends on context)
    // __shared__ float shm_result[blockDim.x];
    // __shared__ float shm_x[blockDim.x];
    // __shared__ float shm_y[blockDim.x];

    // Check bounds and perform the computation
    if (id < n) 
    {
        result[id] = (x[id] == y[id]) ? 1.0f : 0.0f;
    }
}