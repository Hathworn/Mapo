#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_value(float value, float *array, unsigned int size) {
    // Calculate global index using blockIdx and threadIdx
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to handle larger arrays
    for (int i = index; i < size; i += blockDim.x * gridDim.x) {
        array[i] = value;
    }
}