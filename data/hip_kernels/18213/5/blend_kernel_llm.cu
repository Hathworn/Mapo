#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 256
#define EPS 0.1

#undef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))

#undef MAX
#define MAX(a, b) ((a) > (b) ? (a) : (b))

__global__ void blend_kernel(float *A, float *BP, float *M, float *AP, float alpha, int c, int h, int w)
{
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    // Use shared memory to improve memory access efficiency
    __shared__ float shared_M[TB];
    
    if (_id < size) {
        shared_M[threadIdx.x] = M[_id];
    }
    __syncthreads();

    if (_id < c * size) {
        int id = _id % size, dc = _id / size;
        
        // Cache M[id] read from shared memory
        float current_M = shared_M[id % TB];
        float weight = current_M < 0.05f ? 0.f : alpha;

        AP[_id] = A[_id] * weight + BP[_id] * (1.f - weight);
    }
}