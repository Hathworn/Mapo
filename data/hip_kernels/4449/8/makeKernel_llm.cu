#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeKernel(float* KernelPhase, int row, int column, float* ImgProperties, float MagXscaling) {
    // Precompute constant values once
    float MagX = ImgProperties[1];
    float pixSize = ImgProperties[0];
    float nm = ImgProperties[2];
    float lambda = ImgProperties[3];

    float pixdxInv = MagX / pixSize * MagXscaling;
    float km = nm / lambda;

    const int numThreads = blockDim.x * gridDim.x;
    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop where possible and reduce thread divergence
    for (int i = threadID; i < row * column; i += numThreads) {
        int dx = i % row;
        int dy = i / row;

        // Calculate kdx and kdy once per loop iteration
        float kdx = (dx - row / 2.0f) * pixdxInv;
        float kdy = (dy - row / 2.0f) * pixdxInv;
        float temp = km * km - kdx * kdx - kdy * kdy;

        // Use ternary operator for conditionally setting KernelPhase
        KernelPhase[i] = (temp >= 0) ? (sqrtf(temp) - km) : 0;
    }
}