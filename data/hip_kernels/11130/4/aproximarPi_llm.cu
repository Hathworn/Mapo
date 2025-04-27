#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aproximarPi(float *x, float *y, int *z, int tam) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;
    int index = j + i * tam;

    if (index < tam * tam) { // Ensure index is within bounds
        float x_val = x[index];
        float y_val = y[index];
        
        // Reduce repeated calculations
        if ((x_val * x_val + y_val * y_val) <= 1.0f) {
            atomicAdd(z, 1); // Efficiently use atomicAdd
        }
    }
}