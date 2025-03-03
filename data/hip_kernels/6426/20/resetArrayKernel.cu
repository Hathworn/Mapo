#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void resetArrayKernel(hipSurfaceObject_t dst, size_t width, size_t height) {
unsigned x = blockIdx.x * blockDim.x + threadIdx.x;
unsigned y = blockIdx.y * blockDim.y + threadIdx.y;

if (x < width && y < height) {
surf2Dwrite(0, dst, x * sizeof(uint32_t), y);
}
}