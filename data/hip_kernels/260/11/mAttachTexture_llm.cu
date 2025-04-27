#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mAttachTexture(uint8_t *frame, float *dense) {
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;
    float value = dense[Idx]; // Cache dense value to avoid repeated memory accesses
    frame[Idx] = (value > 255.0f) ? 255 : static_cast<uint8_t>(value); // Use static_cast for clarity
}