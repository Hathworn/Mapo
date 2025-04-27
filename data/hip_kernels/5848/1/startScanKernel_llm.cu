#include "hip/hip_runtime.h"
#include "includes.h"
// risky
#define dfloat double

#define p_eps 1e-6

#define p_Nsamples 1

// ratio of importance in sampling primary ray versus random rays
#define p_primaryWeight 2.f

#define p_intersectDelta 0.1f

#define p_shadowDelta 0.15f
#define p_projectDelta 1e-2

#define p_maxLevel 5
#define p_maxNrays (2<<p_maxLevel)
#define p_apertureRadius 20.f
#define NRANDOM 10000

hipEvent_t startTimer, endTimer;

__global__ void startScanKernel(const int N, const int *v, int *scanv, int *starts){

  extern __shared__ int sharedData[];
  int *s_v0 = sharedData;
  int *s_v1 = sharedData + BLOCKSIZE;

  int j = threadIdx.x;
  int b = blockIdx.x;
  int n = j + b * BLOCKSIZE;

  // Use a single block-wise load operation instead of two separate
  s_v0[j] = (n < N) ? v[n] : 0;

  int offset = 1;
  
  // Optimize loop by combining reduction and propagation stages
  for (; offset < BLOCKSIZE; offset *= 2) {
    __syncthreads();
    int value = (j >= offset) ? s_v0[j - offset] : 0;
    s_v1[j] = s_v0[j] + value;
    
    __syncthreads();
    // Swap pointers to avoid extra copy
    int *temp = s_v0;
    s_v0 = s_v1;
    s_v1 = temp;
  }

  if (n < N) {
    scanv[n + 1] = s_v0[j];
  }

  if (j == (BLOCKSIZE - 1)) {
    starts[b + 1] = s_v0[j];
  }
}