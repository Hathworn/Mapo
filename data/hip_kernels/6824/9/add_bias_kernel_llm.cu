```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Iterate through elements with stride to cover all
    for (int idx = index; idx < n * size * batch; idx += stride) {
        int i = idx % size;
        int temp_idx = idx / size;
        int j = temp_idx % n;
        int k = temp_idx / n;
        
        output[(k * n + j) * size + i] += biases[j];
    }
}