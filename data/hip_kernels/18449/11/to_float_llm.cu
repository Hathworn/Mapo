#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void to_float(float *out, int *in, int size) {
    int element = threadIdx.x + blockDim.x * blockIdx.x;
    // Unroll loop to process elements in chunks for better memory throughput
    for (int i = element; i < size; i += blockDim.x * gridDim.x) {
        out[i] = __int2float_rn(in[i]); // Use intrinsic for integer to float conversion
    }
}