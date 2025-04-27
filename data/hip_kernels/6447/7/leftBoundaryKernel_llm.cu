#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void leftBoundaryKernel(double* temperature, int block_size) {
    // Use threadIdx.x directly, no calculation needed for j
    if (threadIdx.x < block_size) {
        // Calculate base index outside loop to prevent recalculation
        int baseIndex = (block_size + 2);
        // Eliminate multiplication inside the loop
        temperature[baseIndex + baseIndex * threadIdx.x] = 1.0;
    }
}