#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void brickSort(int* array, int arrayLen, int p) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if idx is out of bounds or not applicable for the current phase
    if (idx >= arrayLen - 1 || (idx % 2 != p % 2)) 
        return;

    // Swap elements if out of order
    if (array[idx] > array[idx + 1]) {
        int tmp = array[idx + 1];
        array[idx + 1] = array[idx];
        array[idx] = tmp;
    }
}