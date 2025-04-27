#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void extractValues(void* fb, int* voxels, int num_voxels, int* values) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to reduce global memory accesses
    extern __shared__ int shared_voxels[];
    
    if (index < num_voxels) {
        // Load voxels into shared memory
        shared_voxels[threadIdx.x] = voxels[index];
        __syncthreads();

        // Process values from shared memory
        float* tile = (float*)fb;
        values[index] = __float_as_int(tile[shared_voxels[threadIdx.x]]);
    }
}