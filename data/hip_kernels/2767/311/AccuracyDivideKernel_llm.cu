#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division on the host side before kernel launch for efficiency
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index == 0) { // Ensure that only one thread performs the division
        *accuracy /= N;
    }
}