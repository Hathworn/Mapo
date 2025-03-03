; ModuleID = '../data/hip_kernels/5686/2/main.cu'
source_filename = "../data/hip_kernels/5686/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E15instanceCounter = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8neighbor = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8instance = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdY = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E5value = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosX = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosX = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosY = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosY = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i64 %1, i32 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture readonly %3, i64 addrspace(1)* nocapture readonly %4, i64 %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i64 %8, i64 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i64 %12, i64 addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture readonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = sext i32 %17 to i64
  %19 = icmp ult i64 %18, %5
  br i1 %19, label %20, label %380

20:                                               ; preds = %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = icmp eq i32 %21, 0
  %23 = trunc i64 %8 to i32
  %24 = trunc i64 %12 to i32
  %25 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E5value, i32 0, i32 %21
  %26 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %21
  %27 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdY, i32 0, i32 %21
  %28 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 12
  %32 = bitcast i8 addrspace(4)* %31 to i32 addrspace(4)*
  %33 = load i32, i32 addrspace(4)* %32, align 4, !tbaa !5
  %34 = load i16, i16 addrspace(4)* %30, align 4, !range !14, !invariant.load !15
  %35 = zext i16 %34 to i32
  %36 = udiv i32 %33, %35
  %37 = mul i32 %36, %35
  %38 = icmp ugt i32 %33, %37
  %39 = zext i1 %38 to i32
  %40 = lshr i16 %34, 1
  %41 = zext i16 %40 to i32
  %42 = icmp ult i16 %34, 2
  %43 = and i32 %21, 31
  %44 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %43
  %45 = add nuw nsw i32 %21, 1
  %46 = and i32 %45, 31
  %47 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %46
  %48 = add nuw nsw i32 %21, 2
  %49 = and i32 %48, 31
  %50 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %49
  %51 = add nuw nsw i32 %21, 3
  %52 = and i32 %51, 31
  %53 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %52
  %54 = add nuw nsw i32 %21, 4
  %55 = and i32 %54, 31
  %56 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %55
  %57 = add nuw nsw i32 %21, 5
  %58 = and i32 %57, 31
  %59 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %58
  %60 = add nuw nsw i32 %21, 6
  %61 = and i32 %60, 31
  %62 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %61
  %63 = add nuw nsw i32 %21, 7
  %64 = and i32 %63, 31
  %65 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %64
  %66 = add nuw nsw i32 %21, 8
  %67 = and i32 %66, 31
  %68 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %67
  %69 = add nuw nsw i32 %21, 9
  %70 = and i32 %69, 31
  %71 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %70
  %72 = add nuw nsw i32 %21, 10
  %73 = and i32 %72, 31
  %74 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %73
  %75 = add nuw nsw i32 %21, 11
  %76 = and i32 %75, 31
  %77 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %76
  %78 = add nuw nsw i32 %21, 12
  %79 = and i32 %78, 31
  %80 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %79
  %81 = add nuw nsw i32 %21, 13
  %82 = and i32 %81, 31
  %83 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %82
  %84 = add nuw nsw i32 %21, 14
  %85 = and i32 %84, 31
  %86 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %85
  %87 = add nuw nsw i32 %21, 15
  %88 = and i32 %87, 31
  %89 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %88
  %90 = add nuw nsw i32 %21, 16
  %91 = and i32 %90, 31
  %92 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %91
  %93 = add nuw nsw i32 %21, 17
  %94 = and i32 %93, 31
  %95 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %94
  %96 = add nuw nsw i32 %21, 18
  %97 = and i32 %96, 31
  %98 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %97
  %99 = add nuw nsw i32 %21, 19
  %100 = and i32 %99, 31
  %101 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %100
  %102 = add nuw nsw i32 %21, 20
  %103 = and i32 %102, 31
  %104 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %103
  %105 = add nuw nsw i32 %21, 21
  %106 = and i32 %105, 31
  %107 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %106
  %108 = add nuw nsw i32 %21, 22
  %109 = and i32 %108, 31
  %110 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %109
  %111 = add nuw nsw i32 %21, 23
  %112 = and i32 %111, 31
  %113 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %112
  %114 = add nuw nsw i32 %21, 24
  %115 = and i32 %114, 31
  %116 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %115
  %117 = add nuw nsw i32 %21, 25
  %118 = and i32 %117, 31
  %119 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %118
  %120 = add nuw nsw i32 %21, 26
  %121 = and i32 %120, 31
  %122 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %121
  %123 = add nuw nsw i32 %21, 27
  %124 = and i32 %123, 31
  %125 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %124
  %126 = add nuw nsw i32 %21, 28
  %127 = and i32 %126, 31
  %128 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %127
  %129 = add nuw nsw i32 %21, 29
  %130 = and i32 %129, 31
  %131 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %130
  %132 = add nuw nsw i32 %21, 30
  %133 = and i32 %132, 31
  %134 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %133
  %135 = add nuw nsw i32 %21, 31
  %136 = and i32 %135, 31
  %137 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 %136
  br label %138

138:                                              ; preds = %20, %375
  %139 = phi i64 [ %18, %20 ], [ %378, %375 ]
  %140 = trunc i64 %139 to i32
  br i1 %22, label %141, label %146

141:                                              ; preds = %138
  %142 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %139
  %143 = load i64, i64 addrspace(1)* %142, align 8, !tbaa !16
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !20
  store i32 %145, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8neighbor, align 4, !tbaa !20
  store i32 0, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E15instanceCounter, align 4, !tbaa !20
  br label %146

146:                                              ; preds = %141, %138
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E15instanceCounter, align 4, !tbaa !20
  %148 = sext i32 %147 to i64
  %149 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8neighbor, align 4, !tbaa !20
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %150
  %152 = load i64, i64 addrspace(1)* %151, align 8, !tbaa !16
  %153 = icmp ugt i64 %152, %148
  br i1 %153, label %154, label %375

154:                                              ; preds = %146
  %155 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %139
  br label %156

156:                                              ; preds = %154, %367
  %157 = phi i64 [ %150, %154 ], [ %371, %367 ]
  %158 = phi i32 [ %149, %154 ], [ %370, %367 ]
  %159 = phi i64 [ %148, %154 ], [ %369, %367 ]
  br i1 %22, label %160, label %178

160:                                              ; preds = %156
  %161 = load i64, i64 addrspace(1)* %155, align 8, !tbaa !16
  %162 = add i64 %161, %159
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !20
  store i32 %164, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8instance, align 4, !tbaa !20
  %165 = mul i32 %158, %23
  store i32 %165, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosX, align 4, !tbaa !20
  %166 = mul i64 %157, %8
  %167 = getelementptr inbounds i64, i64 addrspace(1)* %9, i64 %157
  %168 = load i64, i64 addrspace(1)* %167, align 8, !tbaa !16
  %169 = add i64 %168, %166
  %170 = trunc i64 %169 to i32
  store i32 %170, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosX, align 4, !tbaa !20
  %171 = mul i32 %164, %24
  store i32 %171, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosY, align 4, !tbaa !20
  %172 = sext i32 %164 to i64
  %173 = mul i64 %172, %12
  %174 = getelementptr inbounds i64, i64 addrspace(1)* %13, i64 %172
  %175 = load i64, i64 addrspace(1)* %174, align 8, !tbaa !16
  %176 = add i64 %175, %173
  %177 = trunc i64 %176 to i32
  store i32 %177, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosY, align 4, !tbaa !20
  br label %178

178:                                              ; preds = %160, %156
  store float 0.000000e+00, float addrspace(3)* %25, align 4, !tbaa !22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %179 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosX, align 4, !tbaa !20
  %180 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosX, align 4, !tbaa !20
  %181 = add nsw i32 %180, 32
  %182 = srem i32 %180, 32
  %183 = sub i32 %181, %182
  %184 = icmp slt i32 %179, %183
  br i1 %184, label %185, label %330

185:                                              ; preds = %178, %323
  %186 = phi i32 [ %324, %323 ], [ %179, %178 ]
  %187 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosY, align 4, !tbaa !20
  %188 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosY, align 4, !tbaa !20
  %189 = add nsw i32 %188, 32
  %190 = srem i32 %188, 32
  %191 = sub i32 %189, %190
  %192 = icmp slt i32 %187, %191
  br i1 %192, label %193, label %330

193:                                              ; preds = %185
  %194 = add i32 %186, %21
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !20
  store i32 %197, i32 addrspace(3)* %26, align 4, !tbaa !20
  %198 = add i32 %187, %21
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %199
  %201 = load i32, i32 addrspace(1)* %200, align 4, !tbaa !20
  store i32 %201, i32 addrspace(3)* %27, align 4, !tbaa !20
  %202 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !20
  %203 = icmp eq i32 %202, %201
  br i1 %203, label %297, label %204

204:                                              ; preds = %193
  %205 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !20
  %206 = icmp eq i32 %205, %201
  br i1 %206, label %297, label %207

207:                                              ; preds = %204
  %208 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !20
  %209 = icmp eq i32 %208, %201
  br i1 %209, label %297, label %210

210:                                              ; preds = %207
  %211 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !20
  %212 = icmp eq i32 %211, %201
  br i1 %212, label %297, label %213

213:                                              ; preds = %210
  %214 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !20
  %215 = icmp eq i32 %214, %201
  br i1 %215, label %297, label %216

216:                                              ; preds = %213
  %217 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !20
  %218 = icmp eq i32 %217, %201
  br i1 %218, label %297, label %219

219:                                              ; preds = %216
  %220 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !20
  %221 = icmp eq i32 %220, %201
  br i1 %221, label %297, label %222

222:                                              ; preds = %219
  %223 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !20
  %224 = icmp eq i32 %223, %201
  br i1 %224, label %297, label %225

225:                                              ; preds = %222
  %226 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !20
  %227 = icmp eq i32 %226, %201
  br i1 %227, label %297, label %228

228:                                              ; preds = %225
  %229 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !20
  %230 = icmp eq i32 %229, %201
  br i1 %230, label %297, label %231

231:                                              ; preds = %228
  %232 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !20
  %233 = icmp eq i32 %232, %201
  br i1 %233, label %297, label %234

234:                                              ; preds = %231
  %235 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !20
  %236 = icmp eq i32 %235, %201
  br i1 %236, label %297, label %237

237:                                              ; preds = %234
  %238 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !20
  %239 = icmp eq i32 %238, %201
  br i1 %239, label %297, label %240

240:                                              ; preds = %237
  %241 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !20
  %242 = icmp eq i32 %241, %201
  br i1 %242, label %297, label %243

243:                                              ; preds = %240
  %244 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !20
  %245 = icmp eq i32 %244, %201
  br i1 %245, label %297, label %246

246:                                              ; preds = %243
  %247 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !20
  %248 = icmp eq i32 %247, %201
  br i1 %248, label %297, label %249

249:                                              ; preds = %246
  %250 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !20
  %251 = icmp eq i32 %250, %201
  br i1 %251, label %297, label %252

252:                                              ; preds = %249
  %253 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !20
  %254 = icmp eq i32 %253, %201
  br i1 %254, label %297, label %255

255:                                              ; preds = %252
  %256 = load i32, i32 addrspace(3)* %98, align 4, !tbaa !20
  %257 = icmp eq i32 %256, %201
  br i1 %257, label %297, label %258

258:                                              ; preds = %255
  %259 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !20
  %260 = icmp eq i32 %259, %201
  br i1 %260, label %297, label %261

261:                                              ; preds = %258
  %262 = load i32, i32 addrspace(3)* %104, align 4, !tbaa !20
  %263 = icmp eq i32 %262, %201
  br i1 %263, label %297, label %264

264:                                              ; preds = %261
  %265 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !20
  %266 = icmp eq i32 %265, %201
  br i1 %266, label %297, label %267

267:                                              ; preds = %264
  %268 = load i32, i32 addrspace(3)* %110, align 4, !tbaa !20
  %269 = icmp eq i32 %268, %201
  br i1 %269, label %297, label %270

270:                                              ; preds = %267
  %271 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !20
  %272 = icmp eq i32 %271, %201
  br i1 %272, label %297, label %273

273:                                              ; preds = %270
  %274 = load i32, i32 addrspace(3)* %116, align 4, !tbaa !20
  %275 = icmp eq i32 %274, %201
  br i1 %275, label %297, label %276

276:                                              ; preds = %273
  %277 = load i32, i32 addrspace(3)* %119, align 4, !tbaa !20
  %278 = icmp eq i32 %277, %201
  br i1 %278, label %297, label %279

279:                                              ; preds = %276
  %280 = load i32, i32 addrspace(3)* %122, align 4, !tbaa !20
  %281 = icmp eq i32 %280, %201
  br i1 %281, label %297, label %282

282:                                              ; preds = %279
  %283 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !20
  %284 = icmp eq i32 %283, %201
  br i1 %284, label %297, label %285

285:                                              ; preds = %282
  %286 = load i32, i32 addrspace(3)* %128, align 4, !tbaa !20
  %287 = icmp eq i32 %286, %201
  br i1 %287, label %297, label %288

288:                                              ; preds = %285
  %289 = load i32, i32 addrspace(3)* %131, align 4, !tbaa !20
  %290 = icmp eq i32 %289, %201
  br i1 %290, label %297, label %291

291:                                              ; preds = %288
  %292 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !20
  %293 = icmp eq i32 %292, %201
  br i1 %293, label %297, label %294

294:                                              ; preds = %291
  %295 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !20
  %296 = icmp eq i32 %295, %201
  br i1 %296, label %297, label %308

297:                                              ; preds = %294, %291, %288, %285, %282, %279, %276, %273, %270, %267, %264, %261, %258, %255, %252, %249, %246, %243, %240, %237, %234, %231, %228, %225, %222, %219, %216, %213, %210, %207, %204, %193
  %298 = phi i32 [ %43, %193 ], [ %46, %204 ], [ %49, %207 ], [ %52, %210 ], [ %55, %213 ], [ %58, %216 ], [ %61, %219 ], [ %64, %222 ], [ %67, %225 ], [ %70, %228 ], [ %73, %231 ], [ %76, %234 ], [ %79, %237 ], [ %82, %240 ], [ %85, %243 ], [ %88, %246 ], [ %91, %249 ], [ %94, %252 ], [ %97, %255 ], [ %100, %258 ], [ %103, %261 ], [ %106, %264 ], [ %109, %267 ], [ %112, %270 ], [ %115, %273 ], [ %118, %276 ], [ %121, %279 ], [ %124, %282 ], [ %127, %285 ], [ %130, %288 ], [ %133, %291 ], [ %136, %294 ]
  %299 = add i32 %298, %186
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %7, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !22
  %303 = getelementptr inbounds float, float addrspace(1)* %11, i64 %199
  %304 = load float, float addrspace(1)* %303, align 4, !tbaa !22
  %305 = fmul contract float %302, %304
  %306 = load float, float addrspace(3)* %25, align 4, !tbaa !22
  %307 = fadd contract float %306, %305
  store float %307, float addrspace(3)* %25, align 4, !tbaa !22
  br label %308

308:                                              ; preds = %294, %297
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %309, label %323

309:                                              ; preds = %308
  %310 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdX, i32 0, i32 31), align 4, !tbaa !20
  %311 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10featureIdY, i32 0, i32 31), align 4, !tbaa !20
  %312 = icmp eq i32 %310, %311
  br i1 %312, label %313, label %316

313:                                              ; preds = %309
  %314 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosY, align 4, !tbaa !20
  %315 = add nsw i32 %314, 32
  store i32 %315, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosY, align 4, !tbaa !20
  br label %319

316:                                              ; preds = %309
  %317 = icmp slt i32 %310, %311
  %318 = select i1 %317, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosX, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosY
  br label %319

319:                                              ; preds = %316, %313
  %320 = phi i32 addrspace(3)* [ @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosX, %313 ], [ %318, %316 ]
  %321 = load i32, i32 addrspace(3)* %320, align 4, !tbaa !20
  %322 = add nsw i32 %321, 32
  store i32 %322, i32 addrspace(3)* %320, align 4, !tbaa !20
  br label %323

323:                                              ; preds = %319, %308
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %324 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E10pStartPosX, align 4, !tbaa !20
  %325 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8pEndPosX, align 4, !tbaa !20
  %326 = add nsw i32 %325, 32
  %327 = srem i32 %325, 32
  %328 = sub i32 %326, %327
  %329 = icmp slt i32 %324, %328
  br i1 %329, label %185, label %330, !llvm.loop !24

330:                                              ; preds = %185, %323, %178
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %42, label %344, label %331

331:                                              ; preds = %330, %340
  %332 = phi i32 [ %341, %340 ], [ %41, %330 ]
  %333 = icmp ult i32 %21, %332
  br i1 %333, label %334, label %340

334:                                              ; preds = %331
  %335 = add nsw i32 %332, %21
  %336 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E5value, i32 0, i32 %335
  %337 = load float, float addrspace(3)* %336, align 4, !tbaa !22
  %338 = load float, float addrspace(3)* %25, align 4, !tbaa !22
  %339 = fadd contract float %337, %338
  store float %339, float addrspace(3)* %25, align 4, !tbaa !22
  br label %340

340:                                              ; preds = %334, %331
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %341 = sdiv i32 %332, 2
  %342 = add nsw i32 %332, 1
  %343 = icmp ult i32 %342, 3
  br i1 %343, label %344, label %331, !llvm.loop !26

344:                                              ; preds = %340, %330
  br i1 %22, label %345, label %367

345:                                              ; preds = %344
  %346 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E5value, i32 0, i32 0), align 16, !tbaa !22
  %347 = load i64, i64 addrspace(1)* %155, align 8, !tbaa !16
  %348 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E15instanceCounter, align 4, !tbaa !20
  %349 = sext i32 %348 to i64
  %350 = add i64 %347, %349
  %351 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %350, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %346, float addrspace(1)* %351, align 4, !tbaa !27
  %352 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8neighbor, align 4, !tbaa !20
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %14, i64 %353
  %355 = load float, float addrspace(1)* %354, align 4, !tbaa !22
  %356 = load i64, i64 addrspace(1)* %155, align 8, !tbaa !16
  %357 = add i64 %356, %349
  %358 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %357, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %355, float addrspace(1)* %358, align 4, !tbaa !27
  %359 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8instance, align 4, !tbaa !20
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds float, float addrspace(1)* %15, i64 %360
  %362 = load float, float addrspace(1)* %361, align 4, !tbaa !22
  %363 = load i64, i64 addrspace(1)* %155, align 8, !tbaa !16
  %364 = add i64 %363, %349
  %365 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %364, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %362, float addrspace(1)* %365, align 4, !tbaa !27
  %366 = add nsw i32 %348, 1
  store i32 %366, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E15instanceCounter, align 4, !tbaa !20
  br label %367

367:                                              ; preds = %345, %344
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %368 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E15instanceCounter, align 4, !tbaa !20
  %369 = sext i32 %368 to i64
  %370 = load i32, i32 addrspace(3)* @_ZZ18computeDotProductsP15HIP_vector_typeIfLj3EEmPiPmS3_mS2_PfmS3_S2_S4_mS3_S4_S4_E8neighbor, align 4, !tbaa !20
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %371
  %373 = load i64, i64 addrspace(1)* %372, align 8, !tbaa !16
  %374 = icmp ugt i64 %373, %369
  br i1 %374, label %156, label %375, !llvm.loop !28

375:                                              ; preds = %367, %146
  %376 = add i32 %36, %140
  %377 = add i32 %376, %39
  %378 = sext i32 %377 to i64
  %379 = icmp ult i64 %378, %5
  br i1 %379, label %138, label %380, !llvm.loop !29

380:                                              ; preds = %375, %16
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = !{!18, !18, i64 0}
!28 = distinct !{!28, !25}
!29 = distinct !{!29, !25}
