#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_int8_to_f32(int8_t* input_int8, size_t size, float *output_f32, float multipler)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop

    // Use grid-stride loop to improve performance and handle larger arrays
    for (int i = idx; i < size; i += stride) {
        output_f32[i] = input_int8[i] * multipler;
    }
}