#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumup_kernal(const float * data, float * device_stats, const int size, const int dim2size, const int num_threads, const int offset)
{
    float sum = 0.0f;

    const uint x = threadIdx.x;
    const uint y = blockIdx.x;

    int idx = x + y * num_threads + offset;

    // Unroll loop for optimization
    for (int i = 0; i < size; i += 4) { 
        int index1 = i * dim2size + idx % dim2size;
        sum += data[index1];

        // Preventing out-of-bounds access with conditional loading
        if (i+1 < size) {
            int index2 = (i+1) * dim2size + idx % dim2size;
            sum += data[index2];
        }

        if (i+2 < size) {
            int index3 = (i+2) * dim2size + idx % dim2size;
            sum += data[index3];
        }

        if (i+3 < size) {
            int index4 = (i+3) * dim2size + idx % dim2size;
            sum += data[index4];
        }
    }

    // Store the result in global memory
    device_stats[idx] = sum / size;
}