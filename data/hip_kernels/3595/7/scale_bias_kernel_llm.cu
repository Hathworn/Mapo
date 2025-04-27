#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    
    // Ensure the index is within boundary
    if(offset < size) {
        // Use shared memory to cache biases for better performance
        __shared__ float shared_biases[512];
        
        if (threadIdx.x == 0) {
            shared_biases[filter] = biases[filter];
        }
        __syncthreads();
        
        // Perform the operation
        output[(batch * n + filter) * size + offset] *= shared_biases[filter];
    }
}