#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecmabite(int *out, int *in, std::size_t size)
{
    // Compute global thread index to allow function to work for any launch configuration
    auto idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Prevent out-of-bounds memory access
    if (idx < size / 2)
    {
        out[idx] = in[2 * idx];
    }
}