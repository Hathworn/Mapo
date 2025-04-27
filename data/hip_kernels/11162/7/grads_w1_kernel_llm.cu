#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void grads_w1_kernel(double * grads_W1, double * W1, double reg, int size)
{
    // Compute global thread index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    if (globalIdx < size * gridDim.x) // Ensure global index is within bounds
    {
        grads_W1[globalIdx] += W1[globalIdx] * reg; // Efficient computation using global thread index
    }
}