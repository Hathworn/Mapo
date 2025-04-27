#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixSum(float* arr, int step) {

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient boundary check
    if (i >= step) {
        arr[i] += arr[i - step];
    }
}