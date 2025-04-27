#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mirrorImage_kernel(uint width, uint height, uint border, uint borderWidth, uint borderHeight, int* devInput, int* devOutput) {
    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory for better performance if needed
    extern __shared__ int sharedMem[];

    if ((x0 < borderWidth) && (y0 < borderHeight)) {
        int x1, y1;

        // Calculate mirrored x1 using modulo for simplicity
        x1 = x0 < border ? border - x0 - 1 : (x0 < border + width ? x0 - border : border + 2 * width - x0 - 1);
        
        // Calculate mirrored y1 using modulo for simplicity
        y1 = y0 < border ? border - y0 - 1 : (y0 < border + height ? y0 - border : border + 2 * height - y0 - 1);

        // Ensuring memory coalescing
        devOutput[y0 * borderWidth + x0] = devInput[y1 * width + x1];
    }
}