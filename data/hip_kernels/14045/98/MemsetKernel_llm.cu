#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize loading imag part
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

// Optimize global kernel function
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ float shared_value;

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        shared_value = value;
    }
    __syncthreads();

    if (i < h && j < w) {
        const int pos = i * w + j;
        image[pos] = shared_value; // Use shared memory value
    }
}