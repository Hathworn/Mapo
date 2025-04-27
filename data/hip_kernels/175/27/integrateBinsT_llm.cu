#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void integrateBinsT(int width, int height, int nbins, int binPitch, int* devIntegrals) {
    const int blockY = blockDim.y * blockIdx.x;
    const int threadY = threadIdx.y;
    const int bin = threadIdx.x;
    const int y = blockY + threadY;

    // Early return if out of bounds
    if (y >= height || bin >= nbins) return;

    int* imagePointer = devIntegrals + (y * width + bin) * binPitch;
    int accumulant = 0;

    // Loop unrolling for better performance
    for(int x = 0; x < width; x += 4) {
        if (x < width) accumulant += *imagePointer; *imagePointer = accumulant; imagePointer += binPitch;
        if (x + 1 < width) accumulant += *imagePointer; *imagePointer = accumulant; imagePointer += binPitch;
        if (x + 2 < width) accumulant += *imagePointer; *imagePointer = accumulant; imagePointer += binPitch;
        if (x + 3 < width) accumulant += *imagePointer; *imagePointer = accumulant; imagePointer += binPitch;
    }
}