#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index calculation
    int stride = blockDim.x * gridDim.x; // Extend to support larger sizes

    for(int i = id; i < size; i += stride) { // Implement loop unrolling
        float random_value = rand[i]; // Cache load
        if(random_value >= prob) {
            input[i] *= scale; // Avoid unnecessary assignment
        } else {
            input[i] = 0;
        }
    }
}