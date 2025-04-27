#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Calculate the unique thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Determine the channel and batch index
    int k = id % c;
    id /= c;
    int b = id;

    // Compute the output index
    int out_index = (k + c * b);
    output[out_index] = 0.0f;

    // Perform accumulation using shared memory to reduce global memory operations
    extern __shared__ float shared_input[];
    int shared_idx = threadIdx.x;
    for (int i = shared_idx; i < w * h; i += blockDim.x) {
        int in_index = i + h * w * (k + b * c);
        shared_input[shared_idx] += input[in_index];
    }
    __syncthreads();

    // Sum up the shared memory results for final output computation
    if (shared_idx == 0) {
        for (int i = 0; i < blockDim.x; ++i) {
            output[out_index] += shared_input[i];
        }
        output[out_index] /= (w * h);
    }
}