```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void unpackSourceKernelF32C1(float* dst, unsigned pitch, const hipSurfaceObject_t src, unsigned width, unsigned height) {
    const unsigned x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        // Optimize memory access by coalescing writes
        float val;
        surf2Dread(&val, src, x * sizeof(float), y);
        dst[y * pitch + x] = val;
    }
}