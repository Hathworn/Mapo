#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void convolutionGlobal(float *imgIn, float *kernel, float *imgOut, int w, int h, int nc, int kernelSize) {
    size_t x = threadIdx.x + blockDim.x * blockIdx.x;
    size_t y = threadIdx.y + blockDim.y * blockIdx.y;

    int r = kernelSize / 2;
    
    // Check for boundaries
    if (x >= w || y >= h) return;

    for (unsigned int c = 0; c < nc; c++) {
        float sum = 0;

        // Load x_new and y_new using conditional operators for improved readability
        for (unsigned int i = 0; i < kernelSize; i++) {
            unsigned int x_new = (x + r < i) ? 0 : ((x + r - i >= w) ? w - 1 : x + r - i);

            for (unsigned int j = 0; j < kernelSize; j++) {
                unsigned int y_new = (y + r < j) ? 0 : ((y + r - j >= h) ? h - 1 : y + r - j);

                // Accumulate convolution result
                sum += kernel[i + j * kernelSize] * imgIn[x_new + y_new * w + w * h * c];
            }
        }

        // Store result in the output image
        imgOut[x + y * w + c * w * h] = sum;
    }
}