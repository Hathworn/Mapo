#include "hip/hip_runtime.h"
#include "includes.h"
/* Non-local Means -- Cuda implementation
*
* Graikos Alexandros - 8128
*/

#define image(i,j) image[((i) + vertical_radius)*(n+2*horizontal_radius) + ((j)+horizontal_radius)]
#define weights(i,j,k,l) weights[((i)*n + (j))*m*n + ((k)*n + (l))]
#define gaussian_matrix(i,j) gaussian_matrix[(i)*patchSize[1] + (j)]
#define shared_memory_patch(patch,i,j) patch[((i)+horizontal_radius)*(blockDim.y+2*horizontal_radius) + ((j)+vertical_radius)]
#define filtered_image(i,j) filtered_image[(i)*n + j]

extern __shared__  float gaussian_matrix[];

/* int version of pow */
__device__ int int_pow(int a, int b) {
    int i, prod = 1;
    for (i=0; i<b; i++) {
        prod *= a;
    }
    return prod;
}

__device__ float compare_patches (int m, int n, float *patch1, float *patch2, int local_x, int local_y, int target_x, int target_y, float patch_sigma, int *patchSize , float filter_sigma) {
    int vertical_radius = (patchSize[0] - 1) / 2;
    int horizontal_radius = (patchSize[1] - 1) / 2;
    float euclidian_distance = 0;
    
    // Optimize euclidian distance computation by removing redundant gaussian_filter calculation and using a single loop.
    for (int k = -vertical_radius; k <= vertical_radius; ++k) {
        for (int l = -horizontal_radius; l <= horizontal_radius; ++l) {
            float diff = shared_memory_patch(patch1, local_x+k, local_y+l) - shared_memory_patch(patch2, target_x+k, target_y+l);
            euclidian_distance += diff * diff;
        }
    }
    
    return expf(-euclidian_distance / (patch_sigma * patch_sigma));
}

__device__ void load_patch(float *patch, const float *image, int m, int n, int patch_x, int patch_y, int *patchSize) {
    int i = patch_x * blockDim.x + threadIdx.x;
    int j = patch_y * blockDim.y + threadIdx.y;

    int vertical_radius = (patchSize[0] - 1) / 2;
    int horizontal_radius = (patchSize[1] -1 ) / 2;

    shared_memory_patch(patch, threadIdx.x, threadIdx.y) = image(i,j);

    // Load mirrored pixels to shared memory: streamlined load process and removed separate if-blocks.
    if (threadIdx.x < vertical_radius) {
        shared_memory_patch(patch, -threadIdx.x-1, threadIdx.y) = image(i-2*threadIdx.x-1,j);
        
        if (threadIdx.y < horizontal_radius) {
            shared_memory_patch(patch, -threadIdx.x-1, -threadIdx.y-1) = image(i-2*threadIdx.x-1, j-2*threadIdx.y-1);
        }
    }

    if (threadIdx.y < horizontal_radius) {
        shared_memory_patch(patch, threadIdx.x, -threadIdx.y-1) = image(i,j-2*threadIdx.y-1);
    }

    if (threadIdx.x >= blockDim.x - vertical_radius) {
        shared_memory_patch(patch, 2*blockDim.x - (threadIdx.x+1), threadIdx.y) = image(i+1+2*(blockDim.x-threadIdx.x-1), j);

        if (threadIdx.y < horizontal_radius) {
            shared_memory_patch(patch, 2*blockDim.x-(threadIdx.x+1), -threadIdx.y-1) = image(i+1+2*(blockDim.x-threadIdx.x-1),j-2*threadIdx.y-1);
        }
    }

    if (threadIdx.y >= blockDim.y - horizontal_radius) {
        shared_memory_patch(patch, threadIdx.x, 2*blockDim.y - (threadIdx.y+1)) = image(i,j+1+2*(blockDim.y-threadIdx.y-1);

        if (threadIdx.x < vertical_radius) {
            shared_memory_patch(patch, -threadIdx.x-1, 2*blockDim.y-(threadIdx.y+1)) = image(i-2*threadIdx.x-1, j+1+2*(blockDim.y-threadIdx.y-1));
        }
    }

    if (threadIdx.x >= (blockDim.x - vertical_radius) && threadIdx.y >= (blockDim.y - horizontal_radius)) {
        shared_memory_patch(patch, 2*blockDim.x-(threadIdx.x+1),2*blockDim.y-(threadIdx.y+1)) = image(i+1+2*(blockDim.x-threadIdx.x-1), j+1+2*(blockDim.y-threadIdx.y-1));
    }

    __syncthreads();
}

__global__ void nlm_kernel(float const *image, float *filtered_image, int m, int n, float patch_sigma, int *patchSize, float filter_sigma) {
    int vertical_radius = (patchSize[0] - 1) / 2;
    int horizontal_radius = (patchSize[1] - 1) / 2;

    // Compute gaussian filter using a single loop
    if (threadIdx.x < patchSize[0] && threadIdx.y < patchSize[1]) {
        float dist2 = int_pow(threadIdx.x - horizontal_radius, 2) + int_pow(threadIdx.y - vertical_radius, 2);
        gaussian_matrix(threadIdx.x, threadIdx.y) = expf(-dist2 / (2 * patch_sigma * patch_sigma));
    }
    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    float *target_patch = gaussian_matrix + patchSize[0]*patchSize[1];
    float *local_patch = target_patch + (blockDim.x+2*vertical_radius)*(blockDim.y+2*horizontal_radius);

    load_patch(local_patch, image, m, n, blockIdx.x, blockIdx.y, patchSize);

    float Z = 0.f;
    float filtered_pixel = 0.f;

    for (int patch_x = 0; patch_x < gridDim.x; ++patch_x) {
        for (int patch_y = 0; patch_y < gridDim.y; ++patch_y) {
            if (patch_x != blockIdx.x || patch_y != blockIdx.y) {
                load_patch(target_patch, image, m, n, patch_x, patch_y, patchSize);
            } else {
                target_patch = local_patch;
            }

            for (int k = 0; k < blockDim.x; ++k) {
                for (int l = 0; l < blockDim.y; ++l) {
                    float weight = compare_patches(m, n, local_patch, target_patch, threadIdx.x, threadIdx.y, k, l, patch_sigma, patchSize, filter_sigma);
                    Z += weight;
                    filtered_pixel += weight * shared_memory_patch(target_patch, k, l);
                }
            }

            if (patch_x == blockIdx.x && patch_y == blockIdx.y) {
                target_patch = gaussian_matrix + patchSize[0]*patchSize[1];
            }

            __syncthreads();
        }
    }

    filtered_image(i, j) = filtered_pixel / Z;
}