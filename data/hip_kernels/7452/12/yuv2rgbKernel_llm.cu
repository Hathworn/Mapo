#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yuv2rgbKernel(int *imgy, int *imgcb, int *imgcr, int *imgr, int *imgg, int *imgb, int n) {

    // Calculate thread index
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if the thread index is within bounds
    if (index < n) {
        // Load YUV values
        int y = imgy[index];
        int cb = imgcb[index];
        int cr = imgcr[index];

        // Compute RGB values using integer arithmetic
        int r = y + (int)(1.14f * cr);
        int g = y - (int)(0.396f * cb + 0.581f * cr);
        int b = y + (int)(2.029f * cb);

        // Store results
        imgr[index] = r;
        imgg[index] = g;
        imgb[index] = b;
    }
}