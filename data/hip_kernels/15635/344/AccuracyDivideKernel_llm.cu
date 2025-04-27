#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division on the device, avoiding race conditions
    if (threadIdx.x == 0) {
        *accuracy /= static_cast<float>(N);
    }
}