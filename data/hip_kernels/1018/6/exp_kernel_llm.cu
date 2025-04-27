#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_kernel(float *array, unsigned int size) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride for improved memory access pattern
    int stride = gridDim.x * blockDim.x;
    
    for (int i = index; i < size; i += stride) {
        array[i] = exp(array[i]);
    }
}