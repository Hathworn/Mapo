#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_array_log(float* array, float* groundTruth, int size)
{
    int thread_index = threadIdx.x + blockIdx.x * blockDim.x;
    int num_threads = blockDim.x * gridDim.x;

    // Loop unrolling for improved performance
    for(int i = thread_index; i < size; i += num_threads)
    {
        groundTruth[i] = logf(array[i]) * groundTruth[i];  // Use logf for floating-point
    }
}