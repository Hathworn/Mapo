#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBesselRatioActivationContinuedFraction(float* mat, float* target, float order, int num_terms, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Use a stride to ensure better memory access pattern

    for (unsigned int i = idx; i < len; i += stride) {
        float k = mat[i];
        float reciprocal_k = 1.0f / k; // Precompute reciprocal of k for efficiency
        float result = 2.0f * (order + num_terms) * reciprocal_k;

        for (int j = num_terms - 1; j > 0; j--) {
            result = 2.0f * (order + j) * reciprocal_k + 1.0f / result;
        }

        target[i] = 1.0f / result;
    }
}