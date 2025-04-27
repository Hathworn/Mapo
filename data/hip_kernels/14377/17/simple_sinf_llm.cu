```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_sinf(float* out, const size_t _data_size, int fnCode, const float _dx, const float _frange_start) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < _data_size) {
        float x = _frange_start + i * _dx;
        int idx = 2 * i;
        out[idx] = x;

        // Use a lookup table for function selection to enhance performance.
        float (*func_ptr)(float);
        switch (fnCode) {
            case 0: func_ptr = sinf; break;
            case 1: func_ptr = cosf; break;
            case 2: func_ptr = tanf; break;
            case 3: func_ptr = log10f; break;
            default: func_ptr = sinf; break; // Default case for safety.
        }
        out[idx + 1] = func_ptr(x);
    }
}