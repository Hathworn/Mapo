#include "hip/hip_runtime.h"
#include "includes.h"

#define klog2(n) ((n<8)?2:((n<16)?3:((n<32)?4:((n<64)?5:((n<128)?6:((n<256)?7:((n<512)?8:((n<1024)?9:((n<2048)?10:((n<4096)?11:((n<8192)?12:((n<16384)?13:0))))))))))))

#ifndef DYNAMIC
#define MANAGED __managed__
#define dh_checkCuda checkCuda
#define dh_get_globaltime get_globaltime
#define dh_get_timer_period get_timer_period
#else
#define dh_checkCuda d_checkCuda
#define dh_get_globaltime d_get_globaltime
#define dh_get_timer_period d_get_timer_period
#define MANAGED
#endif

#define kmin(x,y) ((x<y)?x:y)
#define kmax(x,y) ((x>y)?x:y)

#ifndef USE_TEST_MATRIX
#ifdef _n_
const int n = _n_;
const int range = _range_;
const int user_n = n;
const int n_tests = 100;
#else
const int user_n = 1000;
const int n = 1<<(klog2(user_n)+1);
const int range = n;
const int n_tests = 10;
#endif

const int log2_n = klog2(n);
const int n_threads = kmin(n,64);
const int n_threads_reduction = kmin(n, 256);
const int n_blocks_reduction = kmin(n, 256);
const int n_threads_full = kmin(n, 512);
const int seed = 45345;

#else
const int n = 4;
const int log2_n = 2;
const int n_threads = 2;
const int n_threads_reduction = 2;
const int n_blocks_reduction = 2;
const int n_threads_full = 2;
#endif

const int n_blocks = n / n_threads;
const int n_blocks_full = n * n / n_threads_full;
const int row_mask = (1 << log2_n) - 1;
const int nrows = n, ncols = n;
const int max_threads_per_block = 1024;
const int columns_per_block_step_4 = 512;
const int n_blocks_step_4 = kmax(n / columns_per_block_step_4, 1);
const int data_block_size = columns_per_block_step_4 * n;
const int log2_data_block_size = log2_n + klog2(columns_per_block_step_4);

#ifndef CHAR_DATA_TYPE
typedef int data;
#define MAX_DATA INT_MAX
#define MIN_DATA INT_MIN
#else
typedef unsigned char data;
#define MAX_DATA 255
#define MIN_DATA 0
#endif

#ifndef USE_TEST_MATRIX
data h_cost[ncols][nrows];
#else
data h_cost[n][n] = { { 1, 2, 3, 4 }, { 2, 4, 6, 8 }, { 3, 6, 9, 12 }, { 4, 8, 12, 16 } };
#endif
int h_column_of_star_at_row[nrows];
int h_zeros_vector_size;
int h_n_matches;
bool h_found;
bool h_goto_5;

__device__ data slack[nrows*ncols];
__device__ data min_in_rows[nrows];
__device__ data min_in_cols[ncols];
__device__ int zeros[nrows*ncols];
__device__ int zeros_size_b[n_blocks_step_4];

__device__ int row_of_star_at_column[ncols];
__device__ int column_of_star_at_row[nrows];
__device__ int cover_row[nrows];
__device__ int cover_column[ncols];
__device__ int column_of_prime_at_row[nrows];
__device__ int row_of_green_at_column[ncols];

__device__ data max_in_mat_row[nrows];
__device__ data min_in_mat_col[ncols];
__device__ data d_min_in_mat_vect[n_blocks_reduction];
__device__ data d_min_in_mat;

MANAGED __device__ int zeros_size;
MANAGED __device__ int n_matches;
MANAGED __device__ bool goto_5;
MANAGED __device__ bool repeat_kernel;
#if defined(DEBUG) || defined(_DEBUG)
MANAGED __device__ int n_covered_rows;
MANAGED __device__ int n_covered_columns;
#endif

__shared__ extern data sdata[];

__global__ void step_1_col_sub()
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int c = i >> log2_n;
    
    if (i < nrows * ncols) {
        // Avoid accessing out of bounds
        slack[i] -= min_in_cols[c]; // Efficient column subtraction
    }
    
    if (i == 0) zeros_size = 0;
    if (i < n_blocks_step_4) zeros_size_b[i] = 0;
}