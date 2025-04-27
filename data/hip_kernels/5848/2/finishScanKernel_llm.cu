#include "hip/hip_runtime.h"
#include "includes.h"

#define dfloat double

#define p_eps 1e-6
#define p_Nsamples 1
#define p_primaryWeight 2.f
#define p_intersectDelta 0.1f
#define p_shadowDelta 0.15f
#define p_projectDelta 1e-2
#define p_maxLevel 5
#define p_maxNrays (2<<p_maxLevel)
#define p_apertureRadius 20.f
#define NRANDOM 10000

hipEvent_t startTimer, endTimer;

__global__ void finishScanKernel(const int N, int *scanv, int *starts) {
    // Calculate global thread index
    int n = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates within bounds
    if (n < N) {
        // Load start value once per block from shared memory or register
        int start = starts[blockIdx.x]; 
        
        // Perform scan increment
        scanv[n + 1] += start;
    }
}