#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.141592653
#define PREC 20
#define maxNeighbors 6

typedef double4 particle;
typedef double dbl;

__global__ void LEShift(particle *parts, dbl LEshear) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < blockDim.x * gridDim.x) {  // Ensure index is within bounds
        parts[i].y += parts[i].x * LEshear;  // Simplify operation
    }
}