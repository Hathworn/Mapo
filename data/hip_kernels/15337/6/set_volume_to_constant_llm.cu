#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_volume_to_constant(float *out, float value)
{
    // Calculate unique thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Load shared memory to reduce global memory accesses
    __shared__ bool shouldProcess[1];
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        shouldProcess[0] = (idx < c_Size.x && idy < c_Size.y && idz < c_Size.z);
    }
    __syncthreads();

    // Only access global memory if within bounds
    if (shouldProcess[0]) {
        long int id = (idz * c_Size.y + idy) * c_Size.x + idx;
        out[id] = value;
    }
}