#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void array_set_kernel(float *array, float value, int n) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread ID is within bounds
    if (index < n) {
        // Assign value to the array element
        array[index] = value;
    }
}