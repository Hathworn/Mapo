#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sd_t_s1_2_kernel(int h1d,int h2d,int h3d,int p4d,int p6d,int p4ld_t2,int h1ld_t2,int h3ld_v2,int h2ld_v2,int p6ld_v2,int h3ld_t3,int h2ld_t3,int h1ld_t3,int p6ld_t3,int p4ld_t3,double *t2_d, double *v2_d,int p4, int total_x, double* t3d) {
    int h1,h2,h3,p6;
    extern __shared__ double t2_shm[]; // Dynamically allocate shared memory

    for(int i=threadIdx.x; i<h1d*p4d; i+=blockDim.x)
        if(i<h1d*p4d)
            t2_shm[i] = t2_d[i]; // Efficiently load t2_d into shared memory

    int rest_x = blockIdx.x;
    int thread_x = T2*T1*rest_x + threadIdx.x;
    __syncthreads(); // Ensure all shared memory loads are complete

    for(int i=thread_x; i<total_x; i+=gridDim.x*blockDim.x) {
        int r = i;
        h3 = r % h3d;
        r /= h3d;
        h2 = r % h2d;
        r /= h2d;
        p6 = r % p6d;

        for(h1=0; h1<h1d; h1++) {
            for(p4=0; p4<p4d; p4++) {
                // Use registers for local computations
                double t2_element = t2_shm[h1 * p4d + p4];
                double v2_element = v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2];

                t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3] -= t2_element * v2_element;
            }
        }
    }
    __syncthreads(); // Ensure all stores are complete before kernel exits
}