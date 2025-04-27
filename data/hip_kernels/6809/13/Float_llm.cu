#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Float(float* x, int* y, size_t idxf, size_t idxi, size_t N)
{
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop if i is less than N
    while (i < N) {
        // Directly access and assign values with optimized indexing
        x[idxf * N + i] = static_cast<float>(y[(idxi - 1) * N + i]);
        
        // Increment by the total number of threads
        i += blockDim.x * gridDim.x;
    }
}