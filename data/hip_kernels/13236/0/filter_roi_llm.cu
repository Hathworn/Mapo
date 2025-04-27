#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM_small 64
#define BLOCK_DIM 256

static const unsigned int threads = 512;
bool print_intermediate_arrays = false;
const char *BASE_PATH = "/home/giuliano/git/cuda/reduction";

const char *kern_0 = "filter_roi";
const char *kern_1 = "imperviousness_change_histc_sh_4";
const char *kern_2 = "imperviousness_change";
char buffer[255];

const char *FIL_ROI = "/media/DATI/db-backup/ssgci-data/testing/ssgci_roi.tif";
const char *FIL_BIN1 = "/media/DATI/db-backup/ssgci-data/testing/ssgci_bin.tif";
const char *FIL_BIN2 = "/media/DATI/db-backup/ssgci-data/testing/ssgci_bin2.tif";

const char *FIL_LTAKE_grid = "/home/giuliano/git/cuda/reduction/data/LTAKE_map.tif";
const char *FIL_LTAKE_count = "/home/giuliano/git/cuda/reduction/data/LTAKE_count.txt";

__global__ void filter_roi(unsigned char *BIN, const unsigned char *ROI, unsigned int map_len) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int gridSize = blockDim.x * gridDim.x;

    // Loop with grid-stride to cover entire data range
    for (; i < map_len; i += gridSize) {
        BIN[i] = static_cast<unsigned char>(static_cast<int>(BIN[i]) * static_cast<int>(ROI[i]));
    }
}