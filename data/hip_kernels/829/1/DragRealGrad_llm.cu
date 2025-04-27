#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DragRealGrad(float2 *ORIGIN, float *DEST, float *VEC) {
// Calculate the global thread index
int idx = blockIdx.x * blockDim.x + threadIdx.x;

// Load variables into registers to minimize global memory access
float origin_x = ORIGIN[idx].x;
float vec_val = VEC[idx];

// Calculate DEST value
DEST[idx] = origin_x / sqV - vec_val;
}