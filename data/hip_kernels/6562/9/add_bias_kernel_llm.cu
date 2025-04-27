#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to allow blocks to handle more work
    int stride = blockDim.x * gridDim.x;

    for (int idx = index; idx < n * size * batch; idx += stride) {
        int i = idx % size;
        int j = (idx / size) % n;
        int k = idx / (n * size);

        output[(k * n + j) * size + i] += biases[j];
    }
}