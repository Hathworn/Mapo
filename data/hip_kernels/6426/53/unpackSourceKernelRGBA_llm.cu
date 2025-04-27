#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unpackSourceKernelRGBA(uint32_t* dst, unsigned pitch, const hipSurfaceObject_t src, unsigned width, unsigned height) {
    // Compute x and y indices for the thread
    const unsigned x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the indices are within the image dimensions
    if (x < width && y < height) {
        uint32_t val;

        // Use efficient surface read operation for fetching data
        surf2Dread(&val, src, x * sizeof(uint32_t), y);

        // Store the fetched value in the destination array
        dst[y * pitch + x] = val;
    }
}