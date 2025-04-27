#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_vec_equals_vec1_plus_alpha_times_vec2(double *vec, double *vec1, double alpha, double *d_a1, double *vec2, int numElements)
{
    // Calculate the global thread ID
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    if (gid < numElements) {
        // Use a single variable for combined alpha calculation
        double effective_alpha = alpha;
        if (d_a1) effective_alpha *= *d_a1;

        // Perform the vector operation
        vec[gid] = vec1[gid] + effective_alpha * vec2[gid];
    }
}