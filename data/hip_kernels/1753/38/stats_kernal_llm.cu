#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stats_kernal(const float *data, float *device_soln, const int size, const int num_calcs, const int num_threads, const int offset)
{
    // Declare shared memory for block-level reduction
    extern __shared__ float shared_data[];

    float sum = 0.0f;
    float sum_sq = 0.0f;

    int idx = threadIdx.x + blockIdx.x * num_threads + offset;

    for (int i = 0; i < size; i++)
    {
        int index = i * size + idx % size + ((idx / size) * size * size); 
        float datum = data[index];
        sum += datum;
        sum_sq += datum * datum;
    }

    shared_data[threadIdx.x] = sum;
    shared_data[threadIdx.x + blockDim.x] = sum_sq;

    __syncthreads();

    // Reduction in shared memory
    if (threadIdx.x == 0)
    {
        for (int i = 1; i < blockDim.x; i++)
        {
            sum += shared_data[i];
            sum_sq += shared_data[i + blockDim.x];
        }
        device_soln[idx] = sum;
        device_soln[idx + num_calcs] = sum_sq;
    }
}