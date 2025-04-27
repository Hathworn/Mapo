#include "hip/hip_runtime.h"
#include "includes.h"

#define TRUE (1)
#define FALSE (0)
#define NUM_OF_GLOBAL_ROWS (16000)
#define NUM_OF_GLOBAL_COLS (16000)
#define BLOCK_SIZE (32)
#define KERNEL_SIZE (2)
#define NUM_OF_LOCAL_ROWS (BLOCK_SIZE + (2 * KERNEL_SIZE))
#define NUM_OF_LOCAL_COLS (BLOCK_SIZE + (2 * KERNEL_SIZE))

typedef enum Status_Tag
{
PASSED,
FAILED
}Status_T;

typedef enum Cuda_Event_Tag
{
ALLOCATE_DEVICE_MATRIX_A,
ALLOCATE_DEVICE_MATRIX_B,
COPY_MATRIX_A_FROM_HOST_TO_DEVICE,
LAUNCH_KERNEL_CONV2DDEVICE,
DEVICE_SYNCHRONIZATION,
COPY_MATRIX_B_FROM_DEVICE_TO_HOST,
FREE_DEVICE_MATRIX_A,
FREE_DEVICE_MATRIX_B
}Cuda_Event_T;

typedef enum Corner_Cell_Name_Tag
{
LEFT_TOP_PADDING_CORNER,
RIGHT_TOP_PADDING_CORNER,
LEFT_BOTTOM_PADDING_CORNER,
RIGHT_BOTTOM_PADDING_CORNER,
NUM_OF_CORNERS
}Corner_Cell_Name_T;

typedef enum Ver_Side_Cell_Name_Tag
{
LEFT_PADDING_CELL,
RIGHT_PADDING_CELL,
NUM_OF_VER_SIDES
}Ver_Side_Cell_Name_T;

typedef enum Hor_Side_Cell_Name_Tag
{
TOP_PADDING_CELL,
BOTTOM_PADDING_CELL,
NUM_OF_HOR_SIDES
}Hor_Side_Cell_Name_T;

typedef struct Result_Tag
{
Status_T status;
int index;
}Result_T;

typedef struct Cell_Tag
{
int r_idx;
int c_idx;
}Cell_T;

#define MATRIX_TO_ARRAY_INDEX(r_idx, c_idx, num_cols) ((r_idx*num_cols) + c_idx)

__global__ void conv2DDevice(const int *in, int *out)
{
    int g_col_idx = blockDim.x * blockIdx.x + threadIdx.x;
    int g_row_idx = blockDim.y * blockIdx.y + threadIdx.y;
    int l_col_idx = threadIdx.x + KERNEL_SIZE;
    int l_row_idx = threadIdx.y + KERNEL_SIZE;

    __shared__ int local[NUM_OF_LOCAL_ROWS * NUM_OF_LOCAL_COLS];

    int g_idx = MATRIX_TO_ARRAY_INDEX(g_row_idx, g_col_idx, NUM_OF_GLOBAL_COLS);
    int l_idx = MATRIX_TO_ARRAY_INDEX(l_row_idx, l_col_idx, NUM_OF_LOCAL_COLS);

    if ((g_row_idx < NUM_OF_GLOBAL_ROWS) && (g_col_idx < NUM_OF_GLOBAL_COLS))
    {
        // Load central region into shared memory
        local[l_idx] = in[g_idx];

        // Load left and right padding
        if (threadIdx.x < KERNEL_SIZE)
        {
            if (g_col_idx >= KERNEL_SIZE) {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx, l_col_idx - KERNEL_SIZE, NUM_OF_LOCAL_COLS)] = in[g_idx - KERNEL_SIZE];
            } else {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx, l_col_idx - KERNEL_SIZE, NUM_OF_LOCAL_COLS)] = 0;
            }

            if (g_col_idx + BLOCK_SIZE < NUM_OF_GLOBAL_COLS) {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx, l_col_idx + BLOCK_SIZE, NUM_OF_LOCAL_COLS)] = in[g_idx + BLOCK_SIZE];
            } else {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx, l_col_idx + BLOCK_SIZE, NUM_OF_LOCAL_COLS)] = 0;
            }
        }

        // Load top and bottom padding
        if (threadIdx.y < KERNEL_SIZE)
        {
            if (g_row_idx >= KERNEL_SIZE) {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx - KERNEL_SIZE, l_col_idx, NUM_OF_LOCAL_COLS)] = in[g_idx - (KERNEL_SIZE * NUM_OF_GLOBAL_COLS)];
            } else {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx - KERNEL_SIZE, l_col_idx, NUM_OF_LOCAL_COLS)] = 0;
            }

            if (g_row_idx + BLOCK_SIZE < NUM_OF_GLOBAL_ROWS) {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx + BLOCK_SIZE, l_col_idx, NUM_OF_LOCAL_COLS)] = in[g_idx + (BLOCK_SIZE * NUM_OF_GLOBAL_COLS)];
            } else {
                local[MATRIX_TO_ARRAY_INDEX(l_row_idx + BLOCK_SIZE, l_col_idx, NUM_OF_LOCAL_COLS)] = 0;
            }
        }

        // Load corners
        if ((threadIdx.x < KERNEL_SIZE) && (threadIdx.y < KERNEL_SIZE))
        {
            // preload and pre-zero all corners
            int corners[4] = {0};
            
            int x_offsets[4] = {-KERNEL_SIZE, BLOCK_SIZE, -KERNEL_SIZE, BLOCK_SIZE};
            int y_offsets[4] = {-KERNEL_SIZE, -KERNEL_SIZE, BLOCK_SIZE, BLOCK_SIZE};

            for (int i = 0; i < 4; ++i) {
                int c_row_idx = g_row_idx + y_offsets[i];
                int c_col_idx = g_col_idx + x_offsets[i];
                if (c_row_idx >= 0 && c_col_idx >= 0 && c_row_idx < NUM_OF_GLOBAL_ROWS && c_col_idx < NUM_OF_GLOBAL_COLS) {
                    corners[i] = in[g_idx + (y_offsets[i] * NUM_OF_GLOBAL_COLS) + x_offsets[i]];
                }
                int c_local_idx = MATRIX_TO_ARRAY_INDEX(l_row_idx + y_offsets[i], l_col_idx + x_offsets[i], NUM_OF_LOCAL_COLS);
                local[c_local_idx] = corners[i];
            }
        }
    }

    __syncthreads();

    // Convolution result accumulation
    int result = 0;
    for (int row_offset = -KERNEL_SIZE; row_offset <= KERNEL_SIZE; ++row_offset)
    {
        for (int col_offset = -KERNEL_SIZE; col_offset <= KERNEL_SIZE; ++col_offset)
        {
            int l_ele_idx = MATRIX_TO_ARRAY_INDEX((l_row_idx + row_offset), (l_col_idx + col_offset), NUM_OF_LOCAL_COLS);
            result += local[l_ele_idx];
        }
    }

    out[g_idx] = result;
}