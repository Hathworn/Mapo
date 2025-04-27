#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void identity(int *size, const int *input, int *output) {
    // Replace long with int for improved performance; GPU architecture favors int calculations
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    if (ix < *size) {
        output[ix] = input[ix];
    }
}