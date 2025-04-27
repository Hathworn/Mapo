#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        current[i] /= nhalf;
        // Use ternary operator efficiently by assigning directly to newTE[i]
        newTE[i] = fmaxf(original[i], current[i]);
    }
}