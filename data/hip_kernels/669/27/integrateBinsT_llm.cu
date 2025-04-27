#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void integrateBinsT(int width, int height, int nbins, int binPitch, int* devIntegrals) {
    const int blockY = blockDim.y * blockIdx.x;
    const int threadY = threadIdx.y;
    const int bin = threadIdx.x;
    const int y = blockY + threadY;

    // Early exit to avoid out-of-bound processing
    if (y >= height || bin >= binPitch) return;

    // Calculate starting point once per thread
    int* imagePointer = devIntegrals + (binPitch * y + bin) * width;
    int accumulant = 0;

    // Prefetch next memory location to leverage memory coalescing
    for (int x = 0; x < width; x++) {
        accumulant += *imagePointer;
        *imagePointer = accumulant;
        imagePointer += binPitch;
    }
}