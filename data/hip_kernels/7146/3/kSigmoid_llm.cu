#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSigmoid(const int nThreads, float const *input, float *output) {
    /* Compute the value of the sigmoid function f(x) = 1/(1 + e^-x) efficiently */
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (; i < nThreads; i += stride) {
        output[i] = 1.0f / (1.0f + __expf(-input[i])); // Use fast intrinsic function for exp
    }
}