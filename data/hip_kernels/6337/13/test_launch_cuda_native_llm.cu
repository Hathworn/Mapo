#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test_launch_cuda_native(float * scalar, float * vector, int sxy, int sx , int sy , int sz , int stride)
{
    int id[3] = {
        threadIdx.x + blockIdx.x * blockDim.x,
        threadIdx.y + blockIdx.y * blockDim.y,
        threadIdx.z + blockIdx.z * blockDim.z
    };

    // Exit early if any index is out of bounds
    if (id[0] >= sx || id[1] >= sy || id[2] >= sz) { return; }

    int index = id[2] * sxy + id[1] * sx + id[0];
    float s = scalar[index];

    // Precompute vector base index for efficiency
    int vector_index_base = index;
    
    float v[3] = {
        vector[vector_index_base + 0 * stride],
        vector[vector_index_base + 1 * stride],
        vector[vector_index_base + 2 * stride]
    };

    printf("Grid point from CUDA %d %d %d     scalar: %f  vector: %f %f %f \n", id[0], id[1], id[2], s, v[0], v[1], v[2]);
}