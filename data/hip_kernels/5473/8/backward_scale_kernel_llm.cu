#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unrolling the loop for better performance
    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; i += BLOCK*4){
            int index1 = p + i + size*(filter + n*b);
            int index2 = p + i + BLOCK + size*(filter + n*b);
            int index3 = p + i + 2*BLOCK + size*(filter + n*b);
            int index4 = p + i + 3*BLOCK + size*(filter + n*b);
            sum += (p+i < size) ? delta[index1]*x_norm[index1] : 0;
            sum += (p+i+BLOCK < size) ? delta[index2]*x_norm[index2] : 0;
            sum += (p+i+2*BLOCK < size) ? delta[index3]*x_norm[index3] : 0;
            sum += (p+i+3*BLOCK < size) ? delta[index4]*x_norm[index4] : 0;
        }
    }

    part[p] = sum;
    __syncthreads();
    
    // Use atomic operations to prevent race condition
    if(p == 0) {
        for(int i = 0; i < BLOCK; ++i) atomicAdd(&scale_updates[filter], part[i]);
    }
}