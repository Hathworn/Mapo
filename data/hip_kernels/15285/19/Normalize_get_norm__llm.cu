#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void Normalize_get_norm_(float *input, float *norm, int size1, int size23, int size023)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size023) {
        int dim23 = id % size23;
        int dim0 = id / size23;

        float sum = 0.0;

        // Utilize loop unrolling for efficiency
        int dim1;
        for (dim1 = 0; dim1 < size1 - 3; dim1 += 4) {
            float x0 = input[(dim0 * size1 + dim1) * size23 + dim23];
            float x1 = input[(dim0 * size1 + dim1 + 1) * size23 + dim23];
            float x2 = input[(dim0 * size1 + dim1 + 2) * size23 + dim23];
            float x3 = input[(dim0 * size1 + dim1 + 3) * size23 + dim23];
            sum += x0 * x0 + x1 * x1 + x2 * x2 + x3 * x3;
        }
        // Handle remaining iterations
        for (; dim1 < size1; dim1++) {
            float x = input[(dim0 * size1 + dim1) * size23 + dim23];
            sum += x * x;
        }

        norm[dim0 * size23 + dim23] = sum + 1e-5;
    }
}