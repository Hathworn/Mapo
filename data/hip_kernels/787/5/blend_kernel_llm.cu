#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 0.1

#undef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))

#undef MAX
#define MAX(a, b) ((a) > (b) ? (a) : (b))


__global__ void blend_kernel(float *A, float *BP, float *M, float *AP, float alpha, int c, int h, int w) {
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    // Check if thread index is within bounds
    if (_id < c * size) {
        int id = _id % size;
        int dc = _id / size;
        float weight = (M[id] < 0.05f) ? 0.f : alpha;

        // Perform blending operations
        AP[_id] = A[_id] * weight + BP[_id] * (1.f - weight);
    }
}