#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum_V ( float *V, float *V_s, int num_atom, int num_atom2, int *Ele, float *vdW) {

    // Use a single loop to handle both operations and avoid multiple __syncthreads()
    int ii = blockIdx.x * blockDim.x + threadIdx.x;
    if (ii < num_atom2) {
        if (ii < num_atom) {
            int atomi = Ele[ii];
            if (atomi > 5) atomi = 0;
            V_s[ii] = V[ii] * 4.0 * PI * vdW[atomi] * vdW[atomi];
        } else {
            V_s[ii] = 0.0;
        }
    }

    // Improved reduction using a binary tree pattern
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        __syncthreads();
        if (threadIdx.x < stride && (threadIdx.x + stride) < num_atom2) {
            V_s[threadIdx.x] += V_s[threadIdx.x + stride];
        }
    }
    __syncthreads();

    // Output result from the first thread
    if (threadIdx.x == 0 && blockIdx.x == 0) printf("Convex contact area = %.3f A^2.\n", V_s[0]);
}