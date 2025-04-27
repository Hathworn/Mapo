#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uchar4tofloat4(uchar4 *inputImage, float4 *outputImage, int width, int height) {
    // Calculate global thread indices.
    int offsetX = blockIdx.x * blockDim.x + threadIdx.x;
    int offsetY = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute linear index based on 2D thread index.
    int offset = offsetY * width + offsetX;

    // Check boundary conditions.
    if (offsetX < width && offsetY < height) {
        uchar4 pixel = inputImage[offset];

        // Directly convert to float4 and store.
        outputImage[offset] = make_float4(pixel.x, pixel.y, pixel.z, pixel.w);
    }
}