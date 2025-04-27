#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int clamp(int value, int bound)
{
    if (value < 0) return 1;
    if (value < bound) return value;
    return bound - 1;
}

__device__ int index(int x, int y, int width)
{
    return (y * width) + x;
}

__device__ const int FILTER_SIZE = 9;
__device__ const int FILTER_HALFSIZE = FILTER_SIZE >> 1;

__device__ void sort_bubble(float *x, int n_size)
{
    for (int i = 0; i < n_size - 1; i++)
    {
        for (int j = 0; j < n_size - i - 1; j++)
        {
            if (x[j] > x[j+1])
            {
                float temp = x[j];
                x[j] = x[j+1];
                x[j+1] = temp;
            }
        }
    }
}

__global__ void median_filter_2d_sm(unsigned char* input, unsigned char* output, int width, int height)
{
    __shared__ int sharedPixels[BLOCKDIM + FILTER_SIZE][BLOCKDIM + FILTER_SIZE];

    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    int sharedIdxX = threadIdx.x + FILTER_HALFSIZE;
    int sharedIdxY = threadIdx.y + FILTER_HALFSIZE;
    int globalIdx = index(clamp(x, width), clamp(y, height), width);
    
    // Load pixels into shared memory
    sharedPixels[sharedIdxX][sharedIdxY] = input[globalIdx];
    
    // Ensure threads have all loaded their data before proceeding
    __syncthreads();

    // Compute the median filter only if within image bounds
    if ((x < width) && (y < height))
    {
        const int color_tid = y * width + x;
        float windowMedian[FILTER_SIZE * FILTER_SIZE];
        int windowElements = 0;

        #pragma unroll
        for (int x_iter = -FILTER_HALFSIZE; x_iter <= FILTER_HALFSIZE; x_iter++)
        {
            #pragma unroll
            for (int y_iter = -FILTER_HALFSIZE; y_iter <= FILTER_HALFSIZE; y_iter++)
            {
                if (0 <= x + x_iter && x + x_iter < width && 0 <= y + y_iter && y + y_iter < height)
                {
                    windowMedian[windowElements++] = sharedPixels[sharedIdxX + x_iter][sharedIdxY + y_iter];
                }
            }
        }
        
        sort_bubble(windowMedian, windowElements);
        output[color_tid] = windowMedian[windowElements / 2];
    }
}