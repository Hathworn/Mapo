#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findPartIndicesKernel(int size, int *array, int *partIndices) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size - 1) { // Prevents unnecessary checks for the last index
        int value = array[idx];
        int nextValue = array[idx + 1];
        if (value != nextValue) {
            partIndices[value + 1] = idx + 1;
        }
    } else if (idx == size - 1) { // Handles the boundary condition for the last index
        int value = array[idx];
        partIndices[value + 1] = idx + 1;
    }
}