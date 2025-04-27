#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initGridKernel (float *d_grid, int axis, int w, int h, int d) {
    // Use shared memory to reduce global memory accesses
    __shared__ float shared_grid[IG_BLOCKDIM_X * IG_BLOCKDIM_Y * IG_BLOCKDIM_Z];

    const int baseX = blockIdx.x * IG_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * IG_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = blockIdx.z * IG_BLOCKDIM_Z + threadIdx.z;
    const int idx = (baseZ * h + baseY) * w + baseX;
    const int localIdx = threadIdx.z * IG_BLOCKDIM_X * IG_BLOCKDIM_Y + threadIdx.y * IG_BLOCKDIM_X + threadIdx.x;

    // Store values in shared memory to reduce global writes 
    if (axis == 0) {
        shared_grid[localIdx] = (float)baseX;
    } else if (axis == 1) {
        shared_grid[localIdx] = (float)baseY;
    } else {
        shared_grid[localIdx] = (float)baseZ;
    }
    
    __syncthreads();
    
    // Write back to global memory
    d_grid[idx] = shared_grid[localIdx];
}