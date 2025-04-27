#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if pointer is valid and avoid potential division errors
    if (accuracy != nullptr && N != 0) {
        *accuracy /= N;
    }
}