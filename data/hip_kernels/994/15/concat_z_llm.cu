#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void concat_z(size_t sz, float_t* src, float_t* dest, float_t* z, size_t stride)
{
    // Use shared memory to avoid redundant global accesses
    extern __shared__ float_t shared_mem[];
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    if (index < sz)
    {
        // Load into shared memory
        if (index >= stride)
        {
            shared_mem[index] = src[index - stride];
        }
        else
        {
            shared_mem[index] = z[index];
        }
        // Write back from shared memory to global memory
        dest[index] = shared_mem[index];
    }
}