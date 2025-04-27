#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void myTextureKernel(hipSurfaceObject_t SurfObj, size_t width, size_t height)
{
    // Calculate 2D thread indices
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds for thread execution
    if (idx < width && idy < height) {
        uchar4 data = make_uchar4(255, 255, 255, 255);
        // Write to output surface
        surf2Dwrite(data, SurfObj, idx * sizeof(uchar4), idy);
    }
}