#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void doGPUWork(int numData, int *data) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx < numData) { // Check global thread index
        data[idx] = idx; // Use global thread index
    }
}