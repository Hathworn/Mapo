#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelInterpolationRow(double *original, double *result, int rows, int cols, int factor) {
    // Calculate unique index for each thread
    int x = blockIdx.y * blockDim.y + threadIdx.y;
    int y = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate original and result indices
    int idOriginal, idResult;

    // Reference points for interpolation
    double a, b;
    double m;

    // Perform row-wise interpolation
    if (x < rows - 1 && y < cols) {
        idOriginal = y * rows + x;
        idResult = y * rows * factor * factor + x * factor;

        // Load values from global memory
        a = original[idOriginal];
        b = original[idOriginal + 1];

        // Calculate interpolation step
        m = (b - a) / ((double)factor);

        // Before reaching the end
        for (int p = 0; p <= factor; ++p) {
            if (p < factor) {  // Avoid out-of-bounds
                result[idResult + p] = a;
                a += m;
            }
        }
    } 

    // Handle the last row separately if needed
    else if (x == rows - 1 && y < cols) {
        idOriginal = y * rows + x;
        idResult = y * rows * factor * factor + x * factor;

        // Load the last value
        b = original[idOriginal];

        // Final border processing
        for (int p = 0; p < factor; ++p) {
            result[idResult + p] = b;
        }
    }
}
```
