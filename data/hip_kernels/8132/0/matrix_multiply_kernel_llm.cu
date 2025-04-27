#include "hip/hip_runtime.h"
#include "includes.h"

//Cuda checks
__global__ void matrix_multiply_kernel(unsigned char *temp, unsigned char *matrix, float *kernal, int order, int middle, int windowSizeX, int windowSizeY) {
    // Find place in the execution
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    if (y >= windowSizeY || x >= windowSizeX) {
        return;
    }

    float sum = 0.0f;

    // Loop unrolling for better performance
    int orderSquared = order * order;
    int tempOffset, kernelOffset;
    for (int idx = 0; idx < orderSquared; ++idx) {
        int y2 = idx / order;
        int x2 = idx % order;
        
        int tempX = max(0, min(windowSizeX - 1, x - middle + x2)); // Apply boundary conditions
        int tempY = max(0, min(windowSizeY - 1, y - middle + y2)); // Apply boundary conditions

        tempOffset = (windowSizeX * tempY) + tempX;
        kernelOffset = (order * x2) + y2;
        sum += temp[tempOffset] * kernal[kernelOffset];
    }

    // Clamp the sum value using fminf and fmaxf
    sum = fminf(fmaxf(sum, 0.0f), 255.0f);

    // Add sum value to matrix
    matrix[(windowSizeX * y) + x] = (unsigned char) sum;
}