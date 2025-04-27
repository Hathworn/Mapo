#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int order, const int matrices, double * C)
{
    // Calculate the unique thread index for device memory operations
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int globalIdy = blockIdx.y * blockDim.y + threadIdx.y;
    int stride = blockDim.x * gridDim.x; // Stride for memory access optimization

    // Iterate over matrix batch efficiently using stride
    for (int b = 0; b < matrices; ++b) {
        // Check combined row and column boundary condition
        int index = b * order * order + globalIdx * order + globalIdy;
        if ((globalIdx < order) && (globalIdy < order)) {
            C[index] = 0;
        }
        globalIdx += stride;  // Efficiently skip over threads out-of-bounds
    }
}