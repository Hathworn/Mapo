#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_support(float * vec_input, float * vec, const int n, int * support_counter)
{
    // Calculate unique thread index for flattened grid
    int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Check within array bounds
    if (xIndex < n) {
        // Combine conditions to reduce branching
        bool input_non_zero = (vec_input[xIndex] != 0);
        bool vec_non_zero = (vec[xIndex] != 0);

        // Use unified branching for atomic add operations
        if (input_non_zero && vec_non_zero) {
            atomicAdd(support_counter, 1);
        } else if (!input_non_zero && !vec_non_zero) {
            atomicAdd(support_counter + 1, 1);
        }
    }
}