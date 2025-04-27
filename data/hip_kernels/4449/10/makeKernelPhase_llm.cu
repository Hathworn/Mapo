#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeKernelPhase(float* KernelPhase, int row, int column, float* ImgProperties) {

    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    const float pixdxInv = ImgProperties[1] / ImgProperties[0]; // Magnification/pixSize
    const float km = ImgProperties[2] / ImgProperties[3]; // nm / lambda

    for (int i = threadID; i < row * column; i += blockDim.x * gridDim.x) {
        int dx = i % row;
        int dy = i / row;

        dx = dx - (row >> 1); // Use bitwise shift for division
        dy = dy - (row >> 1); // Use bitwise shift for division

        float kdx = float(dx) * pixdxInv / row;
        float kdy = float(dy) * pixdxInv / row;
        float temp = km * km - kdx * kdx - kdy * kdy;

        KernelPhase[i] = (temp >= 0) ? (sqrtf(temp) - km) : 0;
    }

}