#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatterSum(int N, float *input, float *output) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return;

    // No need for a temporary variable 'a'
    // Simplify atomic operation within loop
    for(int j = 0; j < N; ++j) {
        int index = (j + i) % N;
        atomicAdd(&output[index], input[i]);
    }
    return;
}