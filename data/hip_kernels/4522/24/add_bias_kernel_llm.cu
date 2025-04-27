#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size) 
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using shared memory for biases and loop tiling
    extern __shared__ float shared_biases[];
    int bias_offset = threadIdx.x;
    if (bias_offset < n) {
        shared_biases[bias_offset] = biases[bias_offset];
    }
    __syncthreads();
    
    int total_threads = blockDim.x * gridDim.x;

    for (int idx = index; idx < n * size * batch; idx += total_threads) {
        int i = idx % size;
        int j = (idx / size) % n;
        int k = idx / (size * n);

        // Use shared memory biases
        output[(k * n + j) * size + i] += shared_biases[j];
    }
}