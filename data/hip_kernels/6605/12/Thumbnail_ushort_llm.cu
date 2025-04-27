#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_ushort(hipTextureObject_t ushort_tex, int *histogram, int src_width, int src_height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundary conditions
    if (y < src_height && x < src_width)
    {
        // Improved texture fetching and computation with a temporary variable
        unsigned short pixel_val = tex2D<unsigned short>(ushort_tex, x, y);
        unsigned short pixel = (pixel_val + 128) >> 8;

        // Use atomic addition for histogram update
        atomicAdd(&histogram[pixel], 1);
    }
}