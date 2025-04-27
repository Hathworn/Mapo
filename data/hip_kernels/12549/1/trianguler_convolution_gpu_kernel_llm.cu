#include "hip/hip_runtime.h"
#include "includes.h"

//#define __OUTPUT_PIX__

#define BLOCK_SIZE 32
__constant__ __device__ float lTable_const[1064];
__constant__ __device__ float mr_const[3];
__constant__ __device__ float mg_const[3];
__constant__ __device__ float mb_const[3];

__global__ void trianguler_convolution_gpu_kernel(float *dev_I, float *dev_O, float *T0, float *T1, float *T2, int wd, int ht, float nrm, float p) {
    unsigned int x_pos = threadIdx.x + (blockDim.x * blockIdx.x);
    unsigned int y_pos = threadIdx.y + (blockDim.y * blockIdx.y);

    if ((x_pos < wd) && (y_pos < ht)) {
        // Use registers for intermediate calculations
        float It0, It1, It2, Im0, Im1, Im2, Ib0, Ib1, Ib2;
        float Ot0, Ot1, Ot2;
        float T00, T10, T20;

        // Compute read offsets
        unsigned int offset = (y_pos * wd) + x_pos;
        unsigned int offset_prev_row = offset - wd;
        unsigned int offset_next_row = offset + wd;

        // Read input
        Im0 = dev_I[offset];
        Im1 = dev_I[offset + ht * wd];
        Im2 = dev_I[offset + 2 * ht * wd];

        if (y_pos > 0) {
            It0 = dev_I[offset_prev_row];
            It1 = dev_I[offset_prev_row + ht * wd];
            It2 = dev_I[offset_prev_row + 2 * ht * wd];
        } else {
            It0 = Im0; It1 = Im1; It2 = Im2;
        }

        if (y_pos < ht - 1) {
            Ib0 = dev_I[offset_next_row];
            Ib1 = dev_I[offset_next_row + ht * wd];
            Ib2 = dev_I[offset_next_row + 2 * ht * wd];
        } else {
            Ib0 = Im0; Ib1 = Im1; Ib2 = Im2;
        }

        // Perform convolution
        T00 = nrm * (It0 + (p * Im0) + Ib0);
        T10 = nrm * (It1 + (p * Im1) + Ib1);
        T20 = nrm * (It2 + (p * Im2) + Ib2);

        __syncthreads(); // Ensure all threads have calculated T values

        // Compute output
        if (x_pos == 0) {
            Ot0 = ((1 + p) * T00) + T0[offset + 1];
            Ot1 = ((1 + p) * T10) + T1[offset + 1];
            Ot2 = ((1 + p) * T20) + T2[offset + 1];
        } else if (x_pos == wd - 1) {
            Ot0 = T0[offset - 1] + ((1 + p) * T00);
            Ot1 = T1[offset - 1] + ((1 + p) * T10);
            Ot2 = T2[offset - 1] + ((1 + p) * T20);
        } else {
            Ot0 = T0[offset - 1] + (p * T00) + T0[offset + 1];
            Ot1 = T1[offset - 1] + (p * T10) + T1[offset + 1];
            Ot2 = T2[offset - 1] + (p * T20) + T2[offset + 1];
        }

        // Write output
        dev_O[offset] = Ot0;
        dev_O[offset + ht * wd] = Ot1;
        dev_O[offset + 2 * ht * wd] = Ot2;

        __syncthreads();
    }
}