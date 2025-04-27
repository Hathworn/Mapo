#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _hSigmoidKer(float const *in, float *out, int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {  // Use a single if condition to improve readability and reduce branching
        float val = in[index];  // Reduce redundant memory access
        if (val > 3)
            out[index] = 1;
        else if (val < -3)
            out[index] = 0;
        else
            out[index] = (val + 3) / 6;  // Use the stored value
    }
}