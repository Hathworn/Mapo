#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate thread ID using 3D block and thread indices for better scalability
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int offset = blockIdx.y * gridDim.x * blockDim.x + id;

    // Check within bounds and update input using rand and scale
    if (offset < size) {
        input[offset] = (rand[offset] < prob) ? 0 : input[offset] * scale;
    }
}