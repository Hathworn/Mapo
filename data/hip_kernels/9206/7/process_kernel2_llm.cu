#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void process_kernel2(const float* input, float* output, int numElements) {
    // Calculate a unique thread index within the grid
    int globalThreadId = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
                       + blockIdx.y * blockDim.x * blockDim.z
                       + blockIdx.z * blockDim.x
                       + threadIdx.z * blockDim.x * blockDim.y
                       + threadIdx.y * blockDim.x
                       + threadIdx.x;

    // Perform operation only for valid global thread IDs
    if(globalThreadId < numElements) {
        output[globalThreadId] = logf(fabsf(input[globalThreadId])); // Utilize logf and fabsf for performance improvements
    }
}