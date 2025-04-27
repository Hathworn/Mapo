#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a cleaner operation by reducing atomic operation and handling edge case
    if (N != 0) {
        *accuracy = __fdividef(*accuracy, N); // Use faster float division intrinsic
    }
}