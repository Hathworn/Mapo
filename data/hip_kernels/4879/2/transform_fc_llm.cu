#include "hip/hip_runtime.h"
#include "includes.h"

#define CUDA_CHECK_ERROR

#define CudaSafeCall(err) __CudaSafeCall(err, __FILE__, __LINE__)
#define CudaCheckError() __CudaCheckError(__FILE__, __LINE__)

__global__ void transform_fc(float *input, const float *raw_input, const int width, const int channels)
{
    int thread_id = threadIdx.x;
    int size = width * width;
    int total_size = size * channels;
    
    // Loop unrolling for better performance
    for (int s = thread_id; s < total_size; s += channels)
    {
        input[s] = raw_input[(s % size) * channels + thread_id];
    }

    // Use first thread of the first block to set the last element
    if (blockIdx.x == 0 && thread_id == 0)
    {
        input[total_size] = 1;
    }
}