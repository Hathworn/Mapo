#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscaleKernel(int *ms, int *aux, int n) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Use memory coalescing for accessing global memory
    if (i < n) {
        for (int k = 0; k < n - 3; k += 3) {
            // Use shared memory to reduce redundant calculations (Example stub)
            int r = ms[i * n + k];
            int g = ms[i * n + k + 1];
            int b = ms[i * n + k + 2];

            // Precompute constants
            int grayscale = 0.299 * r + 0.5876 * g + 0.114 * b;

            // Write result back to global memory once
            aux[i * n + k] = grayscale;
            aux[i * n + k + 1] = grayscale;
            aux[i * n + k + 2] = grayscale;
        }
    }
}