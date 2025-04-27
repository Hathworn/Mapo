#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify 1D block and grid computation
    int stride = gridDim.x * blockDim.x; // Calculate stride for processing large arrays

    for (int i = id; i < size; i += stride) { // Use a loop to handle more data in parallel
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale; // Perform conditional scaling
    }
}