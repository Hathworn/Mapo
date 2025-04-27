#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void dscore_cal_kernel(double * dscores, int num_inputs, int size)
{
    // Optimized indexing for improved global memory coalescing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < num_inputs * size) {
        dscores[idx] /= num_inputs;
    }
}