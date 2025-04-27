#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x; // Optimize: Remove unnecessary blockIdx.y and gridDim.x calculations
    if (s >= size) return;

    float mean = 0.0f;
    for (int i = 0; i < n; ++i){
        mean += fabsf(input[i * size + s]);
    }
    mean /= n;

    float threshold = mean; // Optimize: Cache the computed mean value for reuse
    for (int i = 0; i < n; ++i){
        float inputValue = input[i * size + s];
        binary[i * size + s] = (inputValue > 0.0f) ? threshold : -threshold;
    }
}