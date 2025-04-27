#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecmabite(int *out, int *in, int threads, std::size_t size)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Use standard indexing
    if (idx < size / 2) // Ensure the index is within bounds
    {
        out[idx] = in[2 * idx]; // Simplify with computed index
    }
}