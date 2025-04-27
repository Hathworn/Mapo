#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBesselRatioActivationContinuedFraction(float* mat, float* target, float order, int num_terms, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    unsigned int i = idx;
    while (i < len) {  // Optimize loop using while instead of for
        float k = mat[i];
        float result = 2 * (order + num_terms) / k;
        
        // Use shared memory to store intermediate results (if possible)
        // __shared__ float sharedResult;
        // sharedResult = result;
        
        for(int j = num_terms - 1; j > 0; j--) {
            result = 2 * (order + j) / k + 1 / result;
        }
        target[i] = 1 / result;
        i += numThreads;
    }
}