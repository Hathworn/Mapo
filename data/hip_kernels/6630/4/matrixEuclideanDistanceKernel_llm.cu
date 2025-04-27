#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void matrixEuclideanDistanceKernel(float* in, float* out, int n, int m) {
    extern __shared__ float Rs[];
    float tmp, s;
    int myRow = blockIdx.x * blockDim.x + threadIdx.x;

    for (int r = 0; r < n; r++) { // outer loop
        s = 0;
        int myIdx = threadIdx.x;

        // Unroll the shared memory load loop
        for (int i = myIdx; i < m; i += blockDim.x) {
            Rs[i] = in[r * m + i];
        }

        __syncthreads();

        // Optimize by fully unrolling the loop, calculation only for myRow < n
        if (myRow < n) {
            for (int i = 0; i < m; i++) {
                tmp = Rs[i] - in[myRow * m + i];
                s += tmp * tmp;
            }
            out[myRow * n + r] = s;
        }

        __syncthreads();
    }
}