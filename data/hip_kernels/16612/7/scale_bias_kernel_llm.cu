#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to apply scale and bias
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    
    if(offset < size) {
        // Perform calculations using registers for efficiency
        int index = (batch * n + filter) * size + offset;
        float bias = biases[filter];
        output[index] *= bias;
    }
}