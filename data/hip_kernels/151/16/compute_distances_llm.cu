#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void compute_distances(float * ref, int ref_width, int ref_pitch, float * query, int query_width, int query_pitch, int height, float * dist) {

    // Declaration of the shared memory arrays As and Bs used to store the sub-matrix of A and B
    __shared__ float shared_A[BLOCK_DIM][BLOCK_DIM];
    __shared__ float shared_B[BLOCK_DIM][BLOCK_DIM];

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Block index
    int blockX = blockIdx.x;
    int blockY = blockIdx.y;

    // Initializarion of the SSD for the current thread
    float ssd = 0.f;

    // Loop parameters
    int begin_A = BLOCK_DIM * blockY * ref_pitch;
    int begin_B = BLOCK_DIM * blockX * query_pitch;

    // Conditions
    int cond0 = (tx + BLOCK_DIM * blockY < ref_width); // used to write in shared memory
    int cond1 = (tx + BLOCK_DIM * blockX < query_width); // used to write in shared memory & to computations and to write in output array
    int cond2 = (ty + BLOCK_DIM * blockY < ref_width); // used to computations and to write in output matrix

    // Loop over all the sub-matrices of A and B required to compute the block sub-matrix
    for (int a = begin_A, b = begin_B, end_A = begin_A + (height - 1) * ref_pitch; a <= end_A; a += BLOCK_DIM * ref_pitch, b += BLOCK_DIM * query_pitch) {

        // Load the matrices from device memory to shared memory; each thread loads one element of each matrix
        if (a / ref_pitch + ty < height) {
            shared_A[ty][tx] = (cond0) ? ref[a + ref_pitch * ty + tx] : 0;
            shared_B[ty][tx] = (cond1) ? query[b + query_pitch * ty + tx] : 0;
        }
        else {
            shared_A[ty][tx] = 0;
            shared_B[ty][tx] = 0;
        }

        // Synchronize to make sure the matrices are loaded
        __syncthreads();

        // Compute the difference between the two matrices; each thread computes one element of the block sub-matrix
        if (cond2 && cond1) {
            #pragma unroll  // Unroll the loop for better performance
            for (int k = 0; k < BLOCK_DIM; ++k) {
                float tmp = shared_A[k][ty] - shared_B[k][tx];
                ssd += tmp*tmp;
            }
        }

        // Synchronize to make sure that the preceding computation is done before loading two new sub-matrices of A and B in the next iteration
        __syncthreads();
    }

    // Write the block sub-matrix to device memory; each thread writes one element
    if (cond2 && cond1) {
        dist[(BLOCK_DIM * blockY + ty) * query_pitch + BLOCK_DIM * blockX + tx] = ssd;
    }
}