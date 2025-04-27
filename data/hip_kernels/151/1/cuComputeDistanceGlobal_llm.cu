#include "hip/hip_runtime.h"
#include "includes.h"

// If the code is used in Matlab, set MATLAB_CODE to 1. Otherwise, set MATLAB_CODE to 0.
#define MATLAB_CODE 0

// Includes
#if MATLAB_CODE == 1
#else
#endif

// Constants used by the program
#define MAX_PITCH_VALUE_IN_BYTES       262144
#define MAX_TEXTURE_WIDTH_IN_BYTES     65536
#define MAX_TEXTURE_HEIGHT_IN_BYTES    32768
#define MAX_PART_OF_FREE_MEMORY_USED   0.9
#define BLOCK_DIM                      16

// Texture containing the reference points (if it is possible)
texture<float, 2, hipReadModeElementType> texA;

//-----------------------------------------------------------------------------------------------//
//                                            KERNELS                                            //
//-----------------------------------------------------------------------------------------------//

/**
* Computes the distance between two matrix A (reference points) and
* B (query points) containing respectively wA and wB points.
*
* @param A     pointer on the matrix A
* @param wA    width of the matrix A = number of points in A
* @param pA    pitch of matrix A given in number of columns
* @param B     pointer on the matrix B
* @param wB    width of the matrix B = number of points in B
* @param pB    pitch of matrix B given in number of columns
* @param dim   dimension of points = height of matrices A and B
* @param AB    pointer on the matrix containing the wA*wB distances computed
*/

// Optimized kernel: remove unnecessary shared variable declarations
__global__ void cuComputeDistanceGlobal(float* A, int wA, int pA, float* B, int wB, int pB, int dim, float* AB) {
  __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
  __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

  int tx = threadIdx.x;
  int ty = threadIdx.y;

  float ssd = 0;
  int begin_A = BLOCK_DIM * blockIdx.y;
  int begin_B = BLOCK_DIM * blockIdx.x;
  int step_A  = BLOCK_DIM * pA;
  int step_B  = BLOCK_DIM * pB;
  int end_A   = begin_A + (dim - 1) * pA;

  bool cond0 = (begin_A + tx < wA); 
  bool cond1 = (begin_B + tx < wB);
  bool cond2 = (begin_A + ty < wA);

  for (int a = begin_A, b = begin_B; a <= end_A; a += step_A, b += step_B) {
    // Optimized with ternary operators for readability and performance
    shared_A[ty][tx] = ((a/pA + ty < dim) && cond0) ? A[a + pA * ty + tx] : 0;
    shared_B[ty][tx] = ((a/pA + ty < dim) && cond1) ? B[b + pB * ty + tx] : 0;

    __syncthreads();

    if (cond2 && cond1) {
      #pragma unroll // Performance optimization: unroll loop
      for (int k = 0; k < BLOCK_DIM; ++k) {
        float tmp = shared_A[k][ty] - shared_B[k][tx];
        ssd += tmp * tmp;
      }
    }
    __syncthreads();
  }

  if (cond2 && cond1) {
    AB[(begin_A + ty) * pB + begin_B + tx] = ssd;
  }
}