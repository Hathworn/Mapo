```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void median_reduce_shuffle_gpu(const float *d_in, float *d_out, float *d_random_numbers, int n_in) {

    // Compute global index
    int g_ind = blockIdx.x * MED_BLOCK_SIZE + threadIdx.x;

    // Allocate shared memory
    extern __shared__ float DATA[];

    // Load stage with random sampling
    int sample_ind = floorf(d_random_numbers[g_ind] * (float)n_in);
    DATA[threadIdx.x] = d_in[sample_ind];

    __syncthreads();

    /*******************/
    /* Reduction stage */
    /*******************/

    for (int s = 1; s < MED_BLOCK_SIZE; s *= 3) {

        int index = 3 * s * threadIdx.x;

        if (index + 2 * s < MED_BLOCK_SIZE) { // Ensure valid range for fetching values

            // Fetch three values
            float value1 = DATA[index];
            float value2 = DATA[index + s];
            float value3 = DATA[index + 2 * s];

            // Extract the middle value (median)
            float smallest = fminf(value1, value2);
            value2 = fmaxf(value1, value2);
            value1 = smallest;

            value3 = fmaxf(value1, value3);
            value2 = fminf(value2, value3);

            DATA[index] = value2;
        }

        __syncthreads();
    }

    // Write stage
    if (threadIdx.x == 0) {
        d_out[blockIdx.x] = DATA[0];
    }
}