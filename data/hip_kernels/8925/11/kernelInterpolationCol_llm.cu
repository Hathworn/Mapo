#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelInterpolationCol(double *result, int rows, int cols, int factor) {
    // Define shared memory for row calculations
    extern __shared__ double shared[];

    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Use shared memory to store column results for faster access
    if (threadIdx.x < cols * factor && threadIdx.y < rows) {
        int trueY = y * factor;
        int offset = x + trueY * cols * factor;

        double a = result[offset];
        double b = result[offset + cols * factor * factor];
        double m = (b - a) / ((double)factor);

        // Interpolation loop with shared memory optimization
        if (y != rows - 1) {
            for (int p = 0; p <= factor; ++p) {
                shared[threadIdx.y * blockDim.x + threadIdx.x] = a;
                a += m;
                offset += cols * factor * factor;
            }
        } else {
            for (int p = 0; p < factor; ++p) {
                shared[threadIdx.y * blockDim.x + threadIdx.x] = b;
                b -= m;
                offset += cols * factor * factor;
            }
        }

        // Write results back to global memory
        for (int p = 0; p < factor; ++p) {
            result[offset] = shared[threadIdx.y * blockDim.x + threadIdx.x];
        }
    }
}