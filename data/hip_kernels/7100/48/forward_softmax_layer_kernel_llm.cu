```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32

__global__ void forward_softmax_layer_kernel(int n, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if (b >= batch) return;

    float sum = 0;
    float largest = -INFINITY;

    // Compute largest value in warp for numerical stability
    for (int i = threadIdx.x; i < n; i += WARP_SIZE) {
        float val = input[i + b * n];
        largest = max(largest, val);
    }

    largest = warpReduceMax(largest); // Efficient max reduction using warp functions

    // Compute softmax sum
    for (int i = threadIdx.x; i < n; i += WARP_SIZE) {
        sum += exp(input[i + b * n] / temp - largest / temp);
    }

    sum = warpReduceSum(sum); // Efficient sum reduction using warp functions

    sum = max(sum, INFINITY); // Ensuring sum is never zero

    float offset = largest / temp + log(sum);

    // Calculate softmax output
    for (int i = threadIdx.x; i < n; i += WARP_SIZE) {
        output[i + b * n] = exp(input[i + b * n] / temp - offset);
    }
}

// Warp reduction functions
__device__ float warpReduceMax(float val) {
    for (int offset = WARP_SIZE / 2; offset > 0; offset /= 2) {
        val = max(val, __shfl_down(val, offset));
    }
    return val;
}

__device__ float warpReduceSum(float val) {
    for (int offset = WARP_SIZE / 2; offset > 0; offset /= 2) {
        val += __shfl_down(val, offset);
    }
    return val;
}
```
