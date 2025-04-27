#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_softmax_layer_kernel(int n, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b >= batch) return;

    // Find the largest element to improve numerical stability
    float sum = 0.0f;
    float largest = -INFINITY;
    for(int i = 0; i < n; ++i){
        largest = max(largest, input[i + b * n]);
    }

    // Compute the sum of exponentials
    for(int i = 0; i < n; ++i){
        sum += expf((input[i + b * n] - largest) / temp);
    }

    // Normalize the output with the calculated sum
    float expSum = largest + temp * logf(sum);
    for(int i = 0; i < n; ++i){
        output[i + b * n] = expf((input[i + b * n] - expSum) / temp);
    }
}