#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    extern __shared__ float shared_data[];  // Shared memory for reduction
    float *s_input = shared_data;
    float *s_output = &shared_data[n];
    
    int tid = threadIdx.x;
    float sum = 0;
    float largest = -INFINITY;
    
    // Use multiple threads to find the largest value
    for (int i = tid; i < n; i += blockDim.x) {
        float val = input[i*stride];
        s_input[i] = val;
        atomicMax((int*)&largest, __float_as_int(val));
    }
    __syncthreads();
    
    // Compute exponentials and sum
    for (int i = tid; i < n; i += blockDim.x) {
        float e = expf(s_input[i] / temp - largest / temp);
        sum += e;
        s_output[i] = e;
    }
    __syncthreads();
    
    // Use atomicAdd to accumulate the sum across threads
    atomicAdd(&s_output[0], sum);
    __syncthreads();
    
    sum = s_output[0];
    
    // Normalize output
    for (int i = tid; i < n; i += blockDim.x) {
        output[i * stride] = s_output[i] / sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial*batch*groups) return;
    
    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Launch softmax device function with shared memory
    int n = group_size[g];
    softmax_device<<<1, min(n, 1024), 2 * n * sizeof(float)>>>(input + goff + boff + s, n, temp, spatial, output + goff + boff + s);
}