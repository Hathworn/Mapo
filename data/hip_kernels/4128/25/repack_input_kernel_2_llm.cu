#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repack_input_kernel_2(float *input, float *re_packed_input, int w, int h, int c)
{
    // Optimize memory access by using shared memory
    __shared__ float shared_input[32];

    int index = blockIdx.x * blockDim.x + threadIdx.x;

    const int items_per_channel = w * h;

    int c_pack = index % 32;
    int chan_index = index / 32;
    int chan = (chan_index * 32) % c;
    int i = (chan_index * 32) / c;

    if (i < items_per_channel)
    {
        // Load data into shared memory
        shared_input[c_pack] = input[(chan + c_pack) * items_per_channel + i];
        __syncthreads(); // Ensure all threads load their data

        // Write from shared memory to global memory
        re_packed_input[chan * items_per_channel + i * 32 + c_pack] = shared_input[c_pack];
    }
}