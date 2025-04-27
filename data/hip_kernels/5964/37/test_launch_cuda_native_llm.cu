#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void test_launch_cuda_native(float * scalar, float * vector, int sxy, int sx , int sy , int sz , int stride)
{
    int id0 = threadIdx.x + blockIdx.x * blockDim.x;
    int id1 = threadIdx.y + blockIdx.y * blockDim.y;
    int id2 = threadIdx.z + blockIdx.z * blockDim.z;

    // Check bounds for all dimensions at once
    if (id0 >= sx || id1 >= sy || id2 >= sz) { return; }

    int index = id2 * sxy + id1 * sx + id0;
    
    // Load scalar and vector elements
    float s = scalar[index];
    float v[3];
    #pragma unroll // Unroll loop for better performance
    for (int i = 0; i < 3; ++i) {
        v[i] = vector[index + i * stride];
    }

    printf("Grid point from CUDA %d %d %d     scalar: %f  vector: %f %f %f \n", id0, id1, id2, s, v[0], v[1], v[2]);
}