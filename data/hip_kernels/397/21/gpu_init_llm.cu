#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_init(int *mapad, int max, int size) {

    // Calculate global thread index
    int position = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x * blockDim.y +
                   threadIdx.y * blockDim.x + threadIdx.x;

    // Initialize if position is within bounds
    if (position < size) {
        mapad[position] = max;
    }
}