#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of id
    if (id < size) {
        float random_val = rand[id]; // Cache rand[id] to avoid repeated access
        if (random_val < prob) {
            input[id] = 0;
        } else {
            input[id] *= scale;
        }
    }
}