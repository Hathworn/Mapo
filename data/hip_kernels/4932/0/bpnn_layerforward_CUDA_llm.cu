#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bpnn_layerforward_CUDA(float *input_cuda, float *output_hidden_cuda, float *input_hidden_cuda, float *hidden_partial_sum, int in, int hid)
{
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int index = (hid + 1) * HEIGHT * by + (hid + 1) * ty + tx + 1 + (hid + 1);
    int index_in = HEIGHT * by + ty + 1;

    __shared__ float input_node[HEIGHT];
    __shared__ float weight_matrix[HEIGHT][WIDTH];

    if (tx == 0) 
        input_node[ty] = input_cuda[index_in];

    __syncthreads();

    weight_matrix[ty][tx] = input_hidden_cuda[index];

    __syncthreads();

    weight_matrix[ty][tx] *= input_node[ty]; // Multiply in shared memory

    __syncthreads();

    // Unroll reduction loop for efficiency
    for (int stride = HEIGHT / 2; stride > 0; stride >>= 1) {
        if (ty < stride)
            weight_matrix[ty][tx] += weight_matrix[ty + stride][tx];
        __syncthreads();
    }

    if (ty == 0) {
        input_hidden_cuda[index] = weight_matrix[0][tx]; // Store final result per thread
    }

    __syncthreads();

    if (tx == 0) {
        hidden_partial_sum[by * hid + ty] = weight_matrix[ty][0]; // Store row-wise result
    }
}
```
