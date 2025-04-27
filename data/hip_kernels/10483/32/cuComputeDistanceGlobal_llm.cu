```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuComputeDistanceGlobal( float* A, int wA, int pA, float* B, int wB, int pB, int dim,  float* AB){

// Declaration of the shared memory arrays As and Bs used to store the sub-matrix of A and B
__shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
__shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

// Thread index
int tx = threadIdx.x;
int ty = threadIdx.y;

// Block index
int row = BLOCK_DIM * blockIdx.y + ty;
int col = BLOCK_DIM * blockIdx.x + tx;

// Other variables
float tmp;
float ssd = 0;

// Loop over all the sub-matrices of A and B required to compute the block sub-matrix
for (int m = 0; m < dim; m += BLOCK_DIM) {
    
  // Load the matrices from device memory to shared memory; each thread loads one element of each matrix
  if ((row < wA) && (m + tx < dim))
      shared_A[ty][tx] = A[row * pA + m + tx];
  else
      shared_A[ty][tx] = 0;
  
  if ((col < wB) && (m + ty < dim))
      shared_B[ty][tx] = B[(m + ty) * pB + col];
  else
      shared_B[ty][tx] = 0;

  // Synchronize to make sure the matrices are loaded
  __syncthreads();

  // Compute the difference between the two matrices; each thread computes one element of the block sub-matrix
  for (int k = 0; k < BLOCK_DIM; ++k) {
    tmp = shared_A[ty][k] - shared_B[k][tx];
    ssd += tmp*tmp;
  }

  // Synchronize to make sure that the preceding computation is done before loading two new sub-matrices 
  __syncthreads();
}

// Write the block sub-matrix to device memory; each thread writes one element
if (row < wA && col < wB)
  AB[row * pB + col] = ssd;
}