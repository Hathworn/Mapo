#include "hip/hip_runtime.h"
#include "includes.h"

#define DIVUP(m,n)		((m)/(n)+((m)%(n)>0))
int const threadsPerBlock = (sizeof(unsigned long long) * 8);

/*
* Device code
*/
__device__ inline float devIoU(float const * const a, float const * const b)
{
    float left = max(a[0], b[0]), right = min(a[2], b[2]);
    float top = max(a[1], b[1]), bottom = min(a[3], b[3]);
    float width = max(right - left + 1, 0.f), height = max(bottom - top + 1, 0.f);
    float interS = width * height;
    float Sa = (a[2] - a[0] + 1) * (a[3] - a[1] + 1);
    float Sb = (b[2] - b[0] + 1) * (b[3] - b[1] + 1);
    return interS / (Sa + Sb - interS);
}

__global__ void nms_kernel(const int n_boxes, const float nms_overlap_thres, const float *dev_boxes, unsigned long long *dev_mask)
{
    const int row_start = blockIdx.y, col_start = blockIdx.x;
    const int row_size = min(n_boxes - row_start * threadsPerBlock, threadsPerBlock), col_size = min(n_boxes - col_start * threadsPerBlock, threadsPerBlock);

    // Use shared memory efficiently by loading the necessary box data only
    __shared__ float block_boxes[threadsPerBlock * 5];
    if (threadIdx.x < col_size)
    {
        const int box_offset = (threadsPerBlock * col_start + threadIdx.x) * 5;
        #pragma unroll
        for (int j = 0; j < 5; j++)
        {
            block_boxes[threadIdx.x * 5 + j] = dev_boxes[box_offset + j];
        }
    }
    __syncthreads();

    if (threadIdx.x < row_size)
    {
        const int cur_box_idx = threadsPerBlock * row_start + threadIdx.x;
        const float *cur_box = dev_boxes + cur_box_idx * 5;
        unsigned long long t = 0;
        int start = row_start == col_start ? threadIdx.x + 1 : 0;
        for (int i = start; i < col_size; i++)
        {
            if (devIoU(cur_box, block_boxes + i * 5) > nms_overlap_thres)
            {
                t |= 1ULL << i;
            }
        }
        const int col_blocks = DIVUP(n_boxes, threadsPerBlock);
        dev_mask[cur_box_idx * col_blocks + col_start] = t;
    }
}