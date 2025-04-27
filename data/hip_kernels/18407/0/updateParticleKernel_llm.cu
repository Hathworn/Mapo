#include "hip/hip_runtime.h"
#include "includes.h"

const float REAL_VALUE_MAX = 1000000.0f;
const int NUM_THREADS = 32;
const int SIZE = 10000;
const int DIMENSION = 2;

__device__ float clamp(float v, float mn = -REAL_VALUE_MAX, float mx = REAL_VALUE_MAX) {
    return v < mn ? mn : v > mx ? mx : v;
}

__global__ void updateParticleKernel(float* P, float* V, float* PB, float* GB, float momentum, float introvert, float extrovert, float clamp_min, float clamp_max) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= SIZE * DIMENSION) return; // Early exit for out-of-bounds indices

    // Pre-compute reused indices to minimize redundant calculations
    int dimIdx = idx % DIMENSION;

    // Optimize memory access by using registers
    float p = P[idx];
    float v = V[idx];
    float pb = PB[idx];
    float gb = GB[dimIdx];

    // Update particle position and velocity with clamping
    p = clamp(p + v, clamp_min, clamp_max);
    v = clamp(momentum * v + introvert * (pb - p) + extrovert * (gb - p), clamp_min, clamp_max);

    // Write back results
    P[idx] = p;
    V[idx] = v;
}