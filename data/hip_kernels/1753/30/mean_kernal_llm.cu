#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernal(const float * data, float * device_stats, const int size, const int num_calcs, const int num_threads, const int offset)
{
    // Precompute repeated operations outside the loop for efficiency
    const uint x = threadIdx.x;
    const uint y = blockIdx.x;
    int base_idx = x + y * num_threads + offset;
    int base_stride = base_idx / size * size * size;
    int base_mod_size = base_idx % size;

    float mean = 0.0f;

    // Loop unrolling and memory coalescing
    for (int i = 0; i < size; i += 4) {
        int index = i * size + base_mod_size + base_stride;
        mean += data[index];
        if (i + 1 < size) mean += data[index + size];
        if (i + 2 < size) mean += data[index + 2 * size];
        if (i + 3 < size) mean += data[index + 3 * size];
    }

    device_stats[base_idx] = mean / size;
}