#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void dscores_kernel_init(int * y, double * dscores, int size)
{
    // Optimize by calculating the linear index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Boundary check for valid index
    if (i < gridDim.x) {
        dscores[i * size + y[i]] -= 1;
    }
}