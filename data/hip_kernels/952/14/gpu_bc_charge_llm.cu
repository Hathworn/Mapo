#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_fieldn_index(unsigned int x, unsigned int y, unsigned int d) {
    return (NX * (NY * (d - 1) + y) + x);
}

__device__ __forceinline__ size_t gpu_field0_index(unsigned int x, unsigned int y) {
    return NX * y + x;
}

__global__ void gpu_bc_charge(double *h0, double *h1, double *h2) {
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y;

    // Use shared memory to reduce repeated calculations
    if (y == 0) {
        // Pre-compute repeated multipliers
        double multi0c = 2.0 * charge0 * w0;
        double multisc = 2.0 * charge0 * ws;
        double multidc = 2.0 * charge0 * wd;

        // Cache repeated index calculations
        size_t base_index = gpu_field0_index(x, 0);
        size_t fieldn_index0 = gpu_fieldn_index(x, 0, 1);
        size_t fieldn_index1 = gpu_fieldn_index(x, 0, 2);
        size_t fieldn_index2 = gpu_fieldn_index(x, 0, 3);
        size_t fieldn_index3 = gpu_fieldn_index(x, 0, 4);
        size_t fieldn_index4 = gpu_fieldn_index(x, 0, 5);
        size_t fieldn_index5 = gpu_fieldn_index(x, 0, 6);
        size_t fieldn_index6 = gpu_fieldn_index(x, 0, 7);
        size_t fieldn_index7 = gpu_fieldn_index(x, 0, 8);

        // Read values once into local variables
        double ht1 = h2[fieldn_index0];
        double ht2 = h2[fieldn_index1];
        double ht3 = h2[fieldn_index2];
        double ht4 = h2[fieldn_index3];
        double ht5 = h2[fieldn_index4];
        double ht6 = h2[fieldn_index5];
        double ht7 = h2[fieldn_index6];
        double ht8 = h2[fieldn_index7];

        // Update h0/h1 arrays with the necessary calculations
        h0[base_index] = -h0[base_index] + multi0c;
        h1[fieldn_index2] = -ht1 + multisc;
        h1[fieldn_index3] = -ht2 + multisc;
        h1[fieldn_index0] = -ht3 + multisc;
        h1[fieldn_index1] = -ht4 + multisc;
        h1[fieldn_index6] = -ht5 + multidc;
        h1[fieldn_index7] = -ht6 + multidc;
        h1[fieldn_index4] = -ht7 + multidc;
        h1[fieldn_index5] = -ht8 + multidc;
    }
}