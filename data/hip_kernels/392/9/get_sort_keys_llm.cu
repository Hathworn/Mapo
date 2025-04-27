#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_sort_keys(unsigned char* d_hashes, uint32_t *d_sort_keys, uint32_t *d_sort_indices, uint32_t r, uint32_t num_keys) 
{
    uint32_t index = blockDim.x * blockIdx.x + threadIdx.x;
    if (index < num_keys) {
        d_sort_indices[index] = index;

        // Optimize memory access by reducing pointer arithmetic and using local variable
        unsigned char* input = d_hashes + index * 30 + 3 * r;
        uint32_t byte0 = input[0];
        uint32_t byte1 = input[1];
        uint32_t byte2 = input[2];

        // Create sort_key with direct bit shifting and OR operation
        uint32_t sort_key = (byte0 << 16) | (byte1 << 8) | byte2;
        d_sort_keys[index] = sort_key;
    }
}