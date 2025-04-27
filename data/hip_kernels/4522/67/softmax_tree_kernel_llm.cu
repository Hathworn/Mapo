#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    extern __shared__ float shared_mem[]; // use shared memory
    float *e_values = shared_mem;
    int thread_id = threadIdx.x;
    float largest = -INFINITY;

    // Calculate largest
    for (int i = thread_id; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax(reinterpret_cast<int*>(&largest), __float_as_int(val));
    }
    __syncthreads();

    // Calculate e_values and sum
    float sum = 0;
    float current_val;
    for (int i = thread_id; i < n; i += blockDim.x) {
        current_val = expf((input[i * stride] - largest) / temp);
        e_values[i] = current_val;
        atomicAdd(&sum, current_val);
    }
    __syncthreads();

    // Normalize to get output
    for (int i = thread_id; i < n; i += blockDim.x) {
        output[i * stride] = e_values[i] / sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}