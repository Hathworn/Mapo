#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float function_a_appli(float x);

__global__ void mandelbrot (int nb_ligne, int nb_col, float seuil, float x_min, float x_max, float y_min, float y_max, float* res) {
    int max_ITER = 10000;
    int index_col = threadIdx.x + blockDim.x * blockIdx.x;
    int index_ligne = threadIdx.y + blockDim.y * blockIdx.y;

    // Utilize shared memory to reduce global memory access
    __shared__ float shared_x_min;
    __shared__ float shared_x_max;
    __shared__ float shared_y_min;
    __shared__ float shared_y_max;
    
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        shared_x_min = x_min;
        shared_x_max = x_max;
        shared_y_min = y_min;
        shared_y_max = y_max;
    }

    __syncthreads();

    if ((index_col >= nb_col) || (index_ligne >= nb_ligne)) return;

    int global_index = index_ligne * nb_col + index_col;

    float x0 = ((float)index_col / (float)nb_col) * (shared_x_max - shared_x_min) + shared_x_min;
    float y0 = ((float)(nb_ligne - index_ligne) / (float)nb_ligne) * (shared_y_max - shared_y_min) + shared_y_min;
    
    float x = 0, y = 0, xtemp;
    int iter = 0;

    // Unroll loop for better performance on GPU
    #pragma unroll 4
    while ((x * x + y * y <= seuil) && (iter < max_ITER)) {
        xtemp = x * x - y * y + x0;
        y = 2 * x * y + y0;
        x = xtemp;
        iter++;
    }

    res[global_index] = ((float)iter / (float)max_ITER);
}