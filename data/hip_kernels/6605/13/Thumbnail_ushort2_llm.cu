#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_ushort2(hipTextureObject_t ushort2_tex, int *histogram, int src_width, int src_height)
{
    // Use shared memory for histogram accumulation within block
    __shared__ int localHist[512];
    int localIndex = threadIdx.y * blockDim.x + threadIdx.x;
    if (localIndex < 512) localHist[localIndex] = 0;
    __syncthreads();

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (y < src_height && x < src_width)
    {
        ushort2 pixel = tex2D<ushort2>(ushort2_tex, x, y);
        atomicAdd(&localHist[(pixel.x + 128) >> 8], 1);
        atomicAdd(&localHist[256 + (pixel.y + 128) >> 8], 1);
    }
    __syncthreads();

    // Aggregate local histogram to global memory
    if (localIndex < 512)
    {
        atomicAdd(&histogram[localIndex], localHist[localIndex]);
    }
}