#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ccc_cmp_kernal(const float* data1, const float* data2, float* device_soln, const int size, const int num_calcs, const int num_threads, const int offset)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_mem[];

    float* shared_data1 = shared_mem;
    float* shared_data2 = shared_mem + size;

    float avg1 = 0.0f;
    float avg2 = 0.0f;
    float var1 = 0.0f;
    float var2 = 0.0f;
    float ccc = 0.0f;

    const uint x = threadIdx.x;
    const uint y = blockIdx.x;
    int idx = x + y * num_threads + offset;

    // Load data into shared memory
    for(int i = x; i < size; i += num_threads) {
        int index = i * size + idx % size + ((idx / size) * size * size);
        shared_data1[i] = data1[index];
        shared_data2[i] = data2[index];
    }
    __syncthreads();

    // Perform calculations using shared memory
    for(int i = 0; i < size; i++){
        avg1 += shared_data1[i];
        avg2 += shared_data2[i];
        var1 += shared_data1[i] * shared_data1[i];
        var2 += shared_data2[i] * shared_data2[i];
        ccc += shared_data1[i] * shared_data2[i];
    }

    device_soln[idx] = avg1 / size;
    device_soln[idx + num_calcs] = avg2 / size;
    device_soln[idx + 2 * num_calcs] = var1 / size;
    device_soln[idx + 3 * num_calcs] = var2 / size;
    device_soln[idx + 4 * num_calcs] = ccc / size;
}