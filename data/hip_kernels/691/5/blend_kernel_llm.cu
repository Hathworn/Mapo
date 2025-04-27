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
    // Calculate the global thread index
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    if (_id < c * size) {
        // Unroll calculations for id and dc
        int id = _id % size, dc = _id / size;

        // Use precomputation for array indexing
        float m_val = M[id];
        float weight = m_val < 0.05f ? 0.f : alpha;

        // Optimize memory accesses by reducing array calculations
        int offset = dc * size + id;
        AP[offset] = A[offset] * weight + BP[offset] * (1.f - weight);
    }
}