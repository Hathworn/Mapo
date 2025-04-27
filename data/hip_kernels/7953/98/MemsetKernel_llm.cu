#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Return early if thread is out of bounds
    if (i >= h || j >= w) return;
    
    const int pos = i * w + j;

    // Use shared memory for coalesced writes if necessary
    __shared__ float shared_value;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        shared_value = value;
    }
    __syncthreads();

    image[pos] = shared_value;
}