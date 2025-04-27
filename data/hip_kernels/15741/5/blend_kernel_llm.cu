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

__global__ void blend_kernel(float *A, float *BP, float *M, float *AP, float alpha, int c, int h, int w)
{
    // Calculate unique thread ID
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    // Precompute the total size
    int size = h * w;

    // Ensure calculations only happen within valid bounds
    if (_id < c * size) {
        // Efficiently calculate id and dc
        int id = _id % size;
        int dc = _id / size;

        // Simplify weight calculation using ternary operator
        float weight = (M[id] < 0.05f) ? 0.f : alpha;

        // Direct computation for output assignment
        AP[_id] = A[_id] * weight + BP[_id] * (1.f - weight);
    }
}