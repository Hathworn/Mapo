#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int GPUKernel_Position(int i, int j) {
    // Simplified conditional logic for position calculation
    return (i < j) ? j * (j + 1) / 2 + i : i * (i + 1) / 2 + j;
}

__global__ void GPUKernel_Vp(int a, int v, double* in, double* out) {
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit early if id is out of valid range
    if (id >= v * v * v) return;

    // Simplify variable calculations using integer division and modulus directly
    int d = id % v;
    int b = (id / v) % v;
    int c = id / (v * v);

    // Additional conditions to filter out invalid combinations
    if (b < a || d > c) return;

    // Calculate new indices based on position function
    int cd = GPUKernel_Position(c, d);
    int vtri = v * (v + 1) / 2;

    // Compute output based on in and calculated indices
    out[(b - a) * vtri + cd] = in[(b - a) * v * v + d * v + c] + in[(b - a) * v * v + c * v + d];
}