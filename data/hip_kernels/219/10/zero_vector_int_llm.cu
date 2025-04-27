#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zero_vector_int(int *vec, const int n)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Use int4 to set four elements at a time
    int4* vec4 = reinterpret_cast<int4*>(vec);
    unsigned int xIndex4 = xIndex / 4;

    if (xIndex4 < n / 4) {
        int4 zeroVal = make_int4(0, 0, 0, 0);
        vec4[xIndex4] = zeroVal;
    }

    // Handle remaining elements if n is not a multiple of 4
    if (xIndex < n) {
        vec[xIndex] = 0;
    }
}