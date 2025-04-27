#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_count(float *prp_0, int sz)
{
    // Calculate global index for 3D grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Ensure thread index is within bounds
    int index = idz * sz * sz + idy * sz + idx;
    if (idx < sz && idy < sz && idz < sz) {
        prp_0[index] = index;  // Compute global linear index and store
    }
}