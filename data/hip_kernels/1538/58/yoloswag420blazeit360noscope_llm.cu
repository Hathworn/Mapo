#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify 1D indexing computation
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop
    for (int i = id; i < size; i += stride) { // Use grid-stride loop for better coalescing and efficiency
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale; // Conditional assignment
    }
}