#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_bias(float *a, float *bias, float *out, int size_x, int size_y, int size_z)
{
    // Calculate global thread indices
    const int i = blockIdx.y * blockDim.y + threadIdx.y;
    const int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (i < size_x && j < size_y)
    {
        // Precompute the starting index
        int k = (i * size_y + j) * size_z;

        // Use a pointer for iteration to reduce indexing computation
        float* out_ptr = &out[k];
        float* a_ptr = &a[k];

        // Use loop unrolling for better performance (assuming size_z is known)
        for (int c = 0; c < size_z; ++c)
        {
            out_ptr[c] = a_ptr[c] + bias[c];
        }
    }
}