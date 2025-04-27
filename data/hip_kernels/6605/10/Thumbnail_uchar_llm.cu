#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_uchar(hipTextureObject_t uchar_tex, int *histogram, int src_width, int src_height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory to reduce global memory access; assume histogram size is small enough
    __shared__ int local_histogram[256];
    if (threadIdx.x < 256)  // Initialize shared memory histogram
    {
        local_histogram[threadIdx.x] = 0;
    }
    __syncthreads();

    if (y < src_height && x < src_width)
    {
        unsigned char pixel = tex2D<unsigned char>(uchar_tex, x, y);
        atomicAdd(&local_histogram[pixel], 1);
    }

    __syncthreads();

    if (threadIdx.x < 256)  // Update global memory histogram
    {
        atomicAdd(&histogram[threadIdx.x], local_histogram[threadIdx.x]);
    }
}