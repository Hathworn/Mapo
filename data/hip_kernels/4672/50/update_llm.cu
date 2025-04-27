#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure 'i' is within bounds before continuing computations
    if (i < nhalf) {
        current[i] /= nhalf;

        // Avoid branch by using fmaxf, which computes the maximum of two values
        newTE[i] = fmaxf(original[i], current[i]); 
    }
}