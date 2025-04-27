#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_update_sign(int *G, double *w, int *neighbors, int k, int n, int *temp, int *flag, int it_b, int it_t)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ double shared_w[];
    
    // Load weights into shared memory
    int tid = threadIdx.x;
    for (int i = tid; i < k*k; i += blockDim.x) {
        shared_w[i] = w[i];
    }
    __syncthreads();
    
    int buf = 0;
    
    // Reduce loop iterations using stride technique
    int stride_b = gridDim.x * it_b;
    int stride_t = blockDim.x * it_t;
    
    for (int off1 = blockIdx.x; off1 < n; off1 += stride_b) {
        for (int off2 = threadIdx.x; off2 < n; off2 += stride_t) {
            int result;
            double sum = 0.0;
    
            int x = off1;
            int y = off2;
    
            if (x < n && y < n) {
                for (int i = 0; i < k; i++) {
                    for (int j = 0; j < k; j++) {
                        sum += ((double)G[neighbors[x*n*k*k+y*k*k+i*k+j]]) * shared_w[i*k+j];
                    }
                }
    
                if (sum > 1e-6) {
                    result = 1;
                    if (result != G[neighbors[x*n*k*k+y*k*k+12]])
                        buf++;
                } else if (sum < -(1e-6)) {
                    result = -1;
                    if (result != G[neighbors[x*n*k*k+y*k*k+12]])
                        buf++;
                } else {
                    result = G[neighbors[x*n*k*k+y*k*k+12]];
                }
                temp[x*n+y] = result;
            }
        }
    }
    
    // Use atomic addition to update the flag
    atomicAdd(flag, buf);
}