#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_uchar2(hipTextureObject_t uchar2_tex, int *histogram, int src_width, int src_height)
{
    // Use shared memory to reduce global memory accesses
    __shared__ int local_histogram[512];
    
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int tid = threadIdx.y * blockDim.x + threadIdx.x;
    
    // Initialize shared memory
    if (tid < 512)
    {
        local_histogram[tid] = 0;
    }
    __syncthreads();
    
    if (y < src_height && x < src_width)
    {
        uchar2 pixel = tex2D<uchar2>(uchar2_tex, x, y);
        atomicAdd(&local_histogram[pixel.x], 1);
        atomicAdd(&local_histogram[256 + pixel.y], 1);
    }
    __syncthreads();
    
    // Write results back to global memory
    if (tid < 512)
    {
        atomicAdd(&histogram[tid], local_histogram[tid]);
    }
}