#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define DISP_MAX 256

__global__ void Normalize_get_norm_(float *input, float *norm, int size1, int size23, int size023)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size023) {
        int dim23 = id % size23;
        int dim0 = id / size23;

        float sum = 0.0;

        // Use pointers to reduce complex indexing in the loop
        float* input_ptr = input + dim0 * size1 * size23 + dim23;
        for (int dim1 = 0; dim1 < size1; dim1++) {
            float x = *input_ptr;
            sum += x * x;
            input_ptr += size23; // Move to the next element in the same column
        }
        norm[dim0 * size23 + dim23] = sum + 1e-5;
    }
}