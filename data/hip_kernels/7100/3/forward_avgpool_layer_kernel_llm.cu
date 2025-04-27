#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c;
    int b = id / c;

    // Utilize shared memory for temporary storage
    extern __shared__ float shared_input[];
    int out_index = k + c * b;
    shared_input[threadIdx.x] = 0;

    // Coalesce global memory access by aligning memory access patterns
    for (int i = threadIdx.x; i < w * h; i += blockDim.x) {
        int in_index = i + h * w * (k + b * c);
        shared_input[threadIdx.x] += input[in_index];
    }

    // Perform a reduction within the block
    __syncthreads();
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shared_input[threadIdx.x] += shared_input[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result to global memory
    if(threadIdx.x == 0){
        output[out_index] = shared_input[0] / (w * h);
    }
}