#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *r, int *g, int *b, float *gc)
{
    // Calculate the thread's global index once to avoid recalculations
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Use constant float multiplication to convert integers to float values in range
    float factor = 0.00390625;

    // Compute the indices and assign the values with factor multiplication for better code readability and minimal operations
    int index = 5120 * 6 + i * 6;
    gc[index]     = b[i] * factor;
    gc[index + 1] = g[i] * factor;
    gc[index + 2] = r[i] * factor;

    // The below commented operations can be uncommented if needed in the future, place-holding them for potential functionality
    // gc[index + 3] = float(i % 512);
    // gc[index + 4] = float(i / 512);
    // gc[index + 5] = float(a[i]);
}