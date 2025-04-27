#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        current[i] /= nhalf;
        // Use max function to improve performance
        newTE[i] = max(original[i], current[i]);
    }
}