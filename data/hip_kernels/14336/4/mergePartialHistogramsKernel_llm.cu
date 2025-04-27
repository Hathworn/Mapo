#include "hip/hip_runtime.h"
#include "includes.h"

#define UMUL(a, b) ( (a) * (b) )
#define UMAD(a, b, c) ( UMUL((a), (b)) + (c) )

typedef unsigned int uint;
typedef unsigned short ushort;
typedef unsigned char uchar;

#define SHARED_MEMORY_SIZE 49152
#define MERGE_THREADBLOCK_SIZE 128

static uint *d_PartialHistograms;

/*
*	Function that maps value to bin in range 0 inclusive to binCOunt exclusive
*/
__global__ void mergePartialHistogramsKernel(uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount, uint binCount)
{
    // Optimize bin iteration using blockDim.x for better parallelism 
    for (uint bin = blockIdx.x * blockDim.x + threadIdx.x; bin < binCount; bin += gridDim.x * blockDim.x)
    {
        uint sum = 0;
        for (uint histogramIndex = threadIdx.y; histogramIndex < histogramCount; histogramIndex += blockDim.y)
        {
            sum += d_PartialHistograms[bin + histogramIndex * binCount];
        }

        __shared__ uint data[MERGE_THREADBLOCK_SIZE];
        data[threadIdx.y * blockDim.x + threadIdx.x] = sum;

        for (uint stride = blockDim.y / 2; stride > 0; stride >>= 1)
        {
            __syncthreads();
            // Simplified reduction within the warp
            if (threadIdx.y < stride)
            {
                data[(threadIdx.y) * blockDim.x + threadIdx.x] += data[(threadIdx.y + stride) * blockDim.x + threadIdx.x];
            }
        }
        
        if (threadIdx.y == 0 && threadIdx.x == 0)
        {
            d_Histogram[bin] = data[0];
        }
    }
}