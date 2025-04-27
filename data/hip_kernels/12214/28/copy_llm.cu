#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy( float *v4, const float *v3, const int n ) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate thread global index

    // Use looping instead of manual unrolling of assignment
    for(int i = idx; i < n; i += blockDim.x * gridDim.x) {
        #pragma unroll  // Hint to compiler for loop unrolling
        for (int j = 0; j < 3; ++j) {
            v4[i*8+j] = v3[i*6+j];            // Efficient assignment
        }
        for (int j = 3; j < 6; ++j) {
            v4[i*8+j+1] = v3[i*6+j];          // Efficient assignment with offset
        }
    }
}