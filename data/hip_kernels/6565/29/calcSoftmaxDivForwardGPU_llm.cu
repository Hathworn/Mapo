#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcSoftmaxDivForwardGPU(float *out, float *sum, int batch_size, int in_size_x, unsigned int n)
{
    // Use optimized calculation with CUDA's built-in vectorization capability.
    unsigned int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (index < n) {
        float sumVal = *(sum + blockIdx.x);
        if (sumVal > 0.0) {
            // Vectorized division operation
            out[index] /= sumVal;
        }
    }
}