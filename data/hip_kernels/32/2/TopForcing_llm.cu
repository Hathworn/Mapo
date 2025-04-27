#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TopForcing(double ppt, double *eff_rain, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride once
    for (int i = tid; i < size; i += stride) {  // Use for loop for better readability
        eff_rain[i] = ppt;  // Assign ppt to eff_rain directly
    }
}