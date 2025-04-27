#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void blockXOR(int size, const char *input, char *output, long key) {
    // Optimize memory access and reduce redundant calculations
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    const long idx = ix * 8;
    if (idx < size) {
        long *out = reinterpret_cast<long*>(output);
        const long *in = reinterpret_cast<const long*>(input);
        out[ix] = in[ix] ^ key;
    }
}