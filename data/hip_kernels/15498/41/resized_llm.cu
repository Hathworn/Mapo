#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void resized(unsigned char *imgData, int width, float scale_factor, hipTextureObject_t texObj) {
    // Calculate global thread index
    const unsigned int tidX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int tidY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned idx = tidY * width + tidX;

    // Ensure thread index is within bounds before accessing texture memory
    if (tidX < width && tidY < gridDim.y * blockDim.y) {
        // Read from texture memory and store in imgData
        imgData[idx] = tex2D<unsigned char>(texObj, tidX * scale_factor, tidY * scale_factor);
    }
}