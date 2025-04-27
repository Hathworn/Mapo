#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int glb_hist[COLORS];

__global__ void calc_histogram(unsigned char * img_in, int offset_start, int offset_end){
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    const int gridW = gridDim.x * blockDim.x;

    __shared__ int hist[COLORS];

    if (threadIdx.x < COLORS) {
        hist[threadIdx.x] = 0; // Initialize shared histogram
    }
    __syncthreads();

    int num_iterations = (offset_end - offset_start + gridW - 1) / gridW; // Calculate iterations handling leftovers
    for (int iter = 0; iter < num_iterations; iter++) {
        int pos = iter * gridW + ix;
        if (pos < (offset_end - offset_start)) {
            atomicAdd(&hist[img_in[pos + offset_start]], 1); // Accumulate local histogram
        }
    }
    __syncthreads();

    if (threadIdx.x < COLORS) {
        atomicAdd(&glb_hist[threadIdx.x], hist[threadIdx.x]); // Merge local histogram to global
    }
}

__global__ void calc_histogram(int * hist_out, unsigned char * img_in, int img_size, int nbr_bin){
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    const int gridW = gridDim.x * blockDim.x;
    int img_position = iy * gridW + ix; // Calculate image position

    if (img_position < nbr_bin) {
        hist_out[img_position] = 0; // Initialize histogram output
    }
    __syncthreads();

    if(img_position < img_size){
        atomicAdd(&hist_out[img_in[img_position]], 1); // Accumulate histogram
    }
    __syncthreads();
}