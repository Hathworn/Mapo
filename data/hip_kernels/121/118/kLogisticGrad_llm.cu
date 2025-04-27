#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticGrad(float* mat, float* targets, float* out_grad, unsigned int numEls) {
    // Utilize shared memory for faster access (if applicable, modify as needed)
    __shared__ float shared_data[256];  // Assume this size according to available resources
    
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate total number of threads
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Loop over elements using thread stride
    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Calculate gradient
        out_grad[i] = (targets[i] < 0) ? 0.0f : (mat[i] - targets[i]);
    }
}