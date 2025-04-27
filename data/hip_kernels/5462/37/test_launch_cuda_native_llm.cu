#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void test_launch_cuda_native(float * scalar, float * vector, int sxy, int sx , int sy , int sz , int stride)
{
    int id_x = threadIdx.x + blockIdx.x * blockDim.x;
    int id_y = threadIdx.y + blockIdx.y * blockDim.y;
    int id_z = threadIdx.z + blockIdx.z * blockDim.z;

    if (id_x >= sx || id_y >= sy || id_z >= sz) return; // Combine bounds check

    int idx = id_z * sxy + id_y * sx + id_x; // Compute linear index once for reuse

    float s = scalar[idx];

    float v[3];
    v[0] = vector[idx + 0 * stride];
    v[1] = vector[idx + 1 * stride];
    v[2] = vector[idx + 2 * stride];

    printf("Grid point from CUDA %d %d %d     scalar: %f  vector: %f %f %f \n", id_x, id_y, id_z, s, v[0], v[1], v[2]);
}