#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel_vec_equals_vec1_plus_alpha_times_vec2(double *vec, double *vec1, double alpha, double *d_a1, double *vec2, int numElements)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Single if condition to ensure valid gid
    if (gid < numElements) {
        double a = alpha * (d_a1 ? *d_a1 : 1.0); // Inline check for d_a1 and calculate a

        vec[gid] = vec1[gid] + a * vec2[gid];    // Perform computation
    }
}