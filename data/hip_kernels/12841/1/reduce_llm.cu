#include "hip/hip_runtime.h"
#include "includes.h"

// Macros
#define min(a, b) ( (a)<(b)? (a): (b) )
#define max(a, b) ( (a)>(b)? (a): (b) )

// Constants
#define MAX_VECTOR_COUNT 5

// Vector structure
typedef struct {
    float e[3];
} Vec3f;

// Global array
Vec3f vecArray[MAX_VECTOR_COUNT];
Vec3f newvecArray[MAX_VECTOR_COUNT];

// Forward declarations

__global__ void reduce(Vec3f *input, Vec3f *output) {
    extern __shared__ Vec3f sdata[];

    // Each thread loadsome element from global to shared mem
    unsigned int tid = threadIdx.x;
    unsigned int i = threadIdx.x + blockIdx.x * blockDim.x;
    sdata[tid] = input[i];
    __syncthreads();

    // Perform reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {  // Use bitwise shift and reverse loop direction
        if (tid < s) {
            // Summing
            sdata[tid].e[0] += sdata[tid + s].e[0];
            sdata[tid].e[1] += sdata[tid + s].e[1];
            sdata[tid].e[2] += sdata[tid + s].e[2];
        }
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) output[blockIdx.x] = sdata[0];
}