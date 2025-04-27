#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TopForcing(double ppt, double *eff_rain, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Precompute stride to reduce redundant calculations
    for (int i = tid; i < size; i += stride) {
        eff_rain[i] = ppt; // Maintain memory coalescence by processing contiguous indices
    }
}