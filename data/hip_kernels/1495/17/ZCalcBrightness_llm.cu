#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ZCalcBrightness(float* DataArray, float* BrightArray, int size, int rows, int cols, int startIndex) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size * rows)
        return;

    // Pre-calculate indices for optimized memory access
    int sizeIndex = id / rows;
    int rowIndex = id % rows;
    int baseIndex = sizeIndex * rows * cols + rowIndex * cols;

    // Initialize brightness value
    float brightness = 0.0f;

    // Apply loop unrolling for performance improvement
    int i;
    for (i = startIndex; i < cols - 4; i += 4) {
        brightness += DataArray[baseIndex + i] +
                      DataArray[baseIndex + i + 1] +
                      DataArray[baseIndex + i + 2] +
                      DataArray[baseIndex + i + 3];
    }
    for (; i < cols; i++) {
        brightness += DataArray[baseIndex + i];
    }

    // Store the result
    BrightArray[id] = brightness;
}