#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kpolymap32(int n, float *k, float c, float d) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better occupancy
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        k[i] = powf(k[i] + c, d); // Use powf for single precision
    }
}