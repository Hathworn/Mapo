#include "hip/hip_runtime.h"
#include "includes.h"

// Global histogram for all colors
__device__ int glb_hist[COLORS];

// Kernel for computing histogram between offsets
__global__ void calc_histogram(unsigned char *img_in, int offset_start, int offset_end) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    const int gridW = gridDim.x * blockDim.x;
    int pos;

    // Declare shared memory for block histograms
    __shared__ int hist[COLORS];

    // Initialize shared histogram to zero
    if (threadIdx.x < COLORS) {
        hist[threadIdx.x] = 0;
    }
    __syncthreads();

    // Calculate number of rows each thread will process
    int total_pixels = offset_end - offset_start;
    int pixels_per_thread = total_pixels / gridW;
    int start_pixel = ix * pixels_per_thread;
    int end_pixel = start_pixel + pixels_per_thread;
    
    // Process pixels assigned to this thread
    for (int i = start_pixel; i < end_pixel; ++i) {
        atomicAdd(&hist[img_in[i + offset_start]], 1);
    }

    // Handle remaining pixels
    if (ix < total_pixels % gridW) {
        pos = pixels_per_thread * gridW + ix;
        atomicAdd(&hist[img_in[pos + offset_start]], 1);
    }
    __syncthreads();

    // Update global histogram with block results
    if (threadIdx.x < COLORS) {
        atomicAdd(&glb_hist[threadIdx.x], hist[threadIdx.x]);
    }
}

// Kernel for computing histogram of an image
__global__ void calc_histogram(int *hist_out, unsigned char *img_in, int img_size, int nbr_bin) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    const int gridW = gridDim.x * blockDim.x;
    int img_position = iy * gridW + ix;

    // Initialize histogram output to zero
    if (img_position < nbr_bin) {
        hist_out[img_position] = 0;
    }
    __syncthreads();

    // Accumulate histogram for each pixel
    if (img_position < img_size) {
        atomicAdd(&hist_out[img_in[img_position]], 1);
    }
    __syncthreads();
}