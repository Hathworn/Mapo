#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void down_sweep_512(uint* data_block) {
    for (uint i = 512; i >= 2; i >>= 1) {
        for (uint j = 0; j * blockDim.x + threadIdx.x < 512; ++j) {  // Simplified loop bounds
            const auto element = 511 - (j * blockDim.x + threadIdx.x) * i;
            if (element < 512) {
                const auto other_element = element - (i >> 1);
                const auto value = data_block[other_element];
                data_block[other_element] = data_block[element];
                data_block[element] += value;
            }
        }
        __syncthreads();
    }
}

__device__ void up_sweep_512(uint* data_block) {
    uint starting_elem = 1;
    for (uint i = 2; i <= 512; i <<= 1) {
        for (uint j = 0; j * blockDim.x + threadIdx.x < 512; ++j) {  // Simplified loop bounds
            const uint element = starting_elem + (j * blockDim.x + threadIdx.x) * i;
            if (element < 512) {
                data_block[element] += data_block[element - (i >> 1)];
            }
        }
        starting_elem += i;
        __syncthreads();
    }
}

__global__ void prefix_sum_reduce(uint* dev_main_array, uint* dev_auxiliary_array, const uint array_size) {
    __shared__ uint data_block[512];
    const uint last_block = array_size >> 9;

    if (blockIdx.x < last_block) {
        const uint first_elem = blockIdx.x << 9;
        data_block[threadIdx.x] = dev_main_array[first_elem + threadIdx.x];
        data_block[threadIdx.x + blockDim.x] = dev_main_array[first_elem + threadIdx.x + blockDim.x];
        __syncthreads();

        up_sweep_512(data_block);

        if (threadIdx.x == 0) {
            dev_auxiliary_array[blockIdx.x] = data_block[511];
            data_block[511] = 0;
        }
        __syncthreads();

        down_sweep_512(data_block);

        dev_main_array[first_elem + threadIdx.x] = data_block[threadIdx.x];
        dev_main_array[first_elem + threadIdx.x + blockDim.x] = data_block[threadIdx.x + blockDim.x];
        __syncthreads();
    } else {
        const auto elements_remaining = array_size & 0x1FF;
        if (elements_remaining > 0) {
            const auto first_elem = array_size - elements_remaining;
            data_block[threadIdx.x] = 0;
            data_block[threadIdx.x + blockDim.x] = 0;

            const auto elem_index = first_elem + threadIdx.x;
            if (elem_index < array_size) {
                data_block[threadIdx.x] = dev_main_array[elem_index];
            }
            if ((elem_index + blockDim.x) < array_size) {
                data_block[threadIdx.x + blockDim.x] = dev_main_array[elem_index + blockDim.x];
            }
            __syncthreads();

            up_sweep_512(data_block);

            if (threadIdx.x == 0) {
                dev_auxiliary_array[blockIdx.x] = data_block[511];
                data_block[511] = 0;
            }
            __syncthreads();

            down_sweep_512(data_block);

            if (elem_index < array_size) {
                dev_main_array[elem_index] = data_block[threadIdx.x];
            }
            if ((elem_index + blockDim.x) < array_size) {
                dev_main_array[elem_index + blockDim.x] = data_block[threadIdx.x + blockDim.x];
            }
        }
    }
}