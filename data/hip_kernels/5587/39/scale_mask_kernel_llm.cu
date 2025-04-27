```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use shared memory for mask_num to reduce global memory access
    __shared__ float shared_mask_num;
    if (threadIdx.x == 0) shared_mask_num = mask_num;
    __syncthreads();

    // Use efficient memory access pattern
    if (i < n && mask[i] == shared_mask_num) {
        x[i] *= scale;
    }
}