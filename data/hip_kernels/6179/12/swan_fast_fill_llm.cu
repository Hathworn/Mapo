#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to fill uint4 values
__global__ void swan_fast_fill( uint4 *ptr, int len ) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Use loop unrolling and stride for better memory coalescing
    for (int i = idx; i < len; i += stride) {
        ptr[i] = make_uint4(0, 0, 0, 0);
    }
}