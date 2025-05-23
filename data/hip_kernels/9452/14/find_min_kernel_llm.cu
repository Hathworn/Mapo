#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_min_kernel(float * d_out, const float * d_in)
{
    // Shared memory for the block
    extern __shared__ float sdata[];

    const int threadGId = blockIdx.x * blockDim.x + threadIdx.x;
    const int threadLId = threadIdx.x;

    // Load data into shared memory with bounds check
    if (threadGId < gridDim.x * blockDim.x)
        sdata[threadLId] = d_in[threadGId];
    else
        sdata[threadLId] = FLT_MAX; // Assign max float if out of bounds

    __syncthreads(); // Ensure all loads are complete

    // Perform reduction to find minimum
    for (unsigned int blockHalfSize = blockDim.x / 2; blockHalfSize > 0; blockHalfSize >>= 1) {
        if (threadLId < blockHalfSize) {
            sdata[threadLId] = min(sdata[threadLId], sdata[threadLId + blockHalfSize]);
        }
        __syncthreads(); // Ensure all operations are complete for this stage
    }

    // Write result for this block back to global memory
    if (threadLId == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}