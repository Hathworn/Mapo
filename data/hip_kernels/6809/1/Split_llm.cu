#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Split(int * xi, bool * xb, size_t idxi, size_t idxb, size_t N, float threshold)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop with a step equal to the grid size for coalesced memory access
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        // Direct access to the specific index
        xb[(idxb)*N + i] = (((float)xi[(idxi - 1) * N + i]) == threshold);
    }
}