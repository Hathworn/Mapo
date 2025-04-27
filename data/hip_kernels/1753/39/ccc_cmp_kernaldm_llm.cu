#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ccc_cmp_kernaldm(const float* __restrict__ data1, const float* __restrict__ data2, const float* __restrict__ dm, float* __restrict__ device_soln, const int size, const int num_calcs, const int num_threads, const int offset)
{
    // Use registers for accumulated values
    float avg1 = 0.0f;
    float avg2 = 0.0f;
    float var1 = 0.0f;
    float var2 = 0.0f;
    float ccc = 0.0f;
    float nnn = 0.0f;

    const uint x = threadIdx.x;
    const uint y = blockIdx.x;
    int idx = x + y * num_threads + offset;

    // Unroll loop for better performance
    #pragma unroll
    for(int i = 0; i < size; i++) {
        int index = i * size + idx % size + ((idx / size) * size * size); // For coalescing

        if(dm[index] > 0.5) {
            const float val1 = data1[index];
            const float val2 = data2[index];

            avg1 += val1;
            avg2 += val2;
            var1 += val1 * val1;
            var2 += val2 * val2;
            ccc += val1 * val2;
            nnn += 1.0f;
        }
    }

    // Avoid division by zero
    if (nnn > 0.0f) {
        device_soln[idx] = avg1 / nnn;
        device_soln[idx + num_calcs] = avg2 / nnn;
        device_soln[idx + 2 * num_calcs] = var1 / nnn;
        device_soln[idx + 3 * num_calcs] = var2 / nnn;
        device_soln[idx + 4 * num_calcs] = ccc / nnn;
    }
}