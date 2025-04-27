```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UpdateScalars(float *WHAT, float *WITH, float AMOUNT, float *MASS) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < blockDim.x * gridDim.x) { // Bounds check for thread idx
        float mass_value = MASS[idx];   // Cache MASS value to register
        if (mass_value != 0.0f) {       // Check to avoid division by zero
            WHAT[idx] += AMOUNT * WITH[idx] / mass_value;
        }
    }
}