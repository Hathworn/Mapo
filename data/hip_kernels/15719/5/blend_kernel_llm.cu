```c
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
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    if (_id < c * size)
    {
        int id = _id % size;
        int dc = _id / size;
        
        // Pre-calculate index to avoid repetition
        int index = dc * size + id;
        
        // Use ternary operator for more concise weight calculation
        float weight = (M[id] < 0.05f) ? 0.f : alpha;
        
        // Reduce repeated arithmetic operations
        AP[index] = A[index] * weight + BP[index] * (1.f - weight);
    }
    return;
}