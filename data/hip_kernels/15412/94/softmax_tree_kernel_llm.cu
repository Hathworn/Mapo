#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    int thread_id = threadIdx.x;
    extern __shared__ float shared_data[];
    float* s_max = &shared_data[0];
    float* s_sum = &shared_data[1];

    float largest = -INFINITY;
    for (int i = thread_id; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax(&largest, val);  // Use atomic to find max in parallel
    }

    if (thread_id == 0) *s_max = largest;
    __syncthreads();

    float max_val = *s_max;
    float sum = 0;
    for (int i = thread_id; i < n; i += blockDim.x) {
        float e = expf(input[i * stride] / temp - max_val / temp);
        sum += e;
        output[i * stride] = e;
    }

    atomicAdd(s_sum, sum);  // Accumulate sums in shared memory

    __syncthreads();

    sum = *s_sum;  // Only read once all reductions are completed
    for (int i = thread_id; i < n; i += blockDim.x) {
        output[i * stride] /= sum;  // Normalize the outputs
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int thread_id = threadIdx.x;
    extern __shared__ float shared_data[];
    float* s_max = &shared_data[0];
    float* s_sum = &shared_data[1];

    float largest = -INFINITY;
    for (int i = thread_id; i < n; i += blockDim.x) {
        float val = input[i];
        atomicMax(&largest, val);  // Use atomic to find max in parallel
    }

    if (thread_id == 0) *s_max = largest;
    __syncthreads();

    float max_val = *s_max;
    float sum = 0;
    for (int i = thread_id; i < n; i += blockDim.x) {
        float e = expf(input[i] / temp - max_val / temp);
        sum += e;
        output[i] = e;
    }

    atomicAdd(s_sum, sum);  // Accumulate sums in shared memory

    __syncthreads();

    sum = *s_sum;  // Only read once all reductions are completed
    for (int i = thread_id; i < n; i += blockDim.x) {
        output[i] /= sum;  // Normalize the outputs
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    softmax_device_new_api(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}