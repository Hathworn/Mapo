#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void longKernel(float *data, int N, float value) {
    // Calculate the global index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use the global index to directly access and modify data
    if (idx < N) {
        data[idx] += value;
    }
}