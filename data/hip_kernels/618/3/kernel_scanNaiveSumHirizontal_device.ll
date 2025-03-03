; ModuleID = '../data/hip_kernels/618/3/main.cu'
source_filename = "../data/hip_kernels/618/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }

@texInImage = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@texIntegralImage = protected addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@keypointsCount = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture.0 addrspace(1)* @texIntegralImage to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29kernel_scanNaiveSumHirizontalPjii(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = alloca [1024 x i32], align 16, addrspace(5)
  %5 = bitcast [1024 x i32] addrspace(5)* %4 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4096, i8 addrspace(5)* %5) #4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp sgt i32 %2, 0
  br i1 %7, label %8, label %30

8:                                                ; preds = %3
  %9 = load <4 x i32>*, <4 x i32>* addrspace(1)* bitcast (%struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture.0, %struct.texture.0 addrspace(1)* @texIntegralImage, i64 0, i32 0, i32 11) to <4 x i32>* addrspace(1)*), align 8
  %10 = addrspacecast <4 x i32>* %9 to <4 x i32> addrspace(4)*
  %11 = load <4 x i32>, <4 x i32> addrspace(4)* %10, align 16, !tbaa !5
  %12 = and i32 %2, 7
  %13 = icmp ult i32 %2, 8
  br i1 %13, label %16, label %14

14:                                               ; preds = %8
  %15 = and i32 %2, -8
  br label %41

16:                                               ; preds = %41, %8
  %17 = phi i32 [ 0, %8 ], [ %91, %41 ]
  %18 = icmp eq i32 %12, 0
  br i1 %18, label %30, label %19

19:                                               ; preds = %16, %19
  %20 = phi i32 [ %27, %19 ], [ %17, %16 ]
  %21 = phi i32 [ %28, %19 ], [ 0, %16 ]
  %22 = mul nsw i32 %20, %1
  %23 = add nsw i32 %22, %6
  %24 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %23, i32 0, i32 0, i32 0)
  %25 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %20
  %26 = bitcast i32 addrspace(5)* %25 to float addrspace(5)*
  store float %24, float addrspace(5)* %26, align 4, !tbaa !8
  %27 = add nuw nsw i32 %20, 1
  %28 = add i32 %21, 1
  %29 = icmp eq i32 %28, %12
  br i1 %29, label %30, label %19, !llvm.loop !12

30:                                               ; preds = %16, %19, %3
  %31 = icmp sgt i32 %2, 1
  br i1 %31, label %32, label %108

32:                                               ; preds = %30
  %33 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 0
  %34 = load i32, i32 addrspace(5)* %33, align 16, !tbaa !8
  %35 = add i32 %2, -1
  %36 = add i32 %2, -2
  %37 = and i32 %35, 7
  %38 = icmp ult i32 %36, 7
  br i1 %38, label %94, label %39

39:                                               ; preds = %32
  %40 = and i32 %35, -8
  br label %114

41:                                               ; preds = %41, %14
  %42 = phi i32 [ 0, %14 ], [ %91, %41 ]
  %43 = phi i32 [ 0, %14 ], [ %92, %41 ]
  %44 = mul nsw i32 %42, %1
  %45 = add nsw i32 %44, %6
  %46 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %45, i32 0, i32 0, i32 0)
  %47 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %42
  %48 = bitcast i32 addrspace(5)* %47 to float addrspace(5)*
  store float %46, float addrspace(5)* %48, align 16, !tbaa !8
  %49 = or i32 %42, 1
  %50 = mul nsw i32 %49, %1
  %51 = add nsw i32 %50, %6
  %52 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %51, i32 0, i32 0, i32 0)
  %53 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %49
  %54 = bitcast i32 addrspace(5)* %53 to float addrspace(5)*
  store float %52, float addrspace(5)* %54, align 4, !tbaa !8
  %55 = or i32 %42, 2
  %56 = mul nsw i32 %55, %1
  %57 = add nsw i32 %56, %6
  %58 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %57, i32 0, i32 0, i32 0)
  %59 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %55
  %60 = bitcast i32 addrspace(5)* %59 to float addrspace(5)*
  store float %58, float addrspace(5)* %60, align 8, !tbaa !8
  %61 = or i32 %42, 3
  %62 = mul nsw i32 %61, %1
  %63 = add nsw i32 %62, %6
  %64 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %63, i32 0, i32 0, i32 0)
  %65 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %61
  %66 = bitcast i32 addrspace(5)* %65 to float addrspace(5)*
  store float %64, float addrspace(5)* %66, align 4, !tbaa !8
  %67 = or i32 %42, 4
  %68 = mul nsw i32 %67, %1
  %69 = add nsw i32 %68, %6
  %70 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %69, i32 0, i32 0, i32 0)
  %71 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %67
  %72 = bitcast i32 addrspace(5)* %71 to float addrspace(5)*
  store float %70, float addrspace(5)* %72, align 16, !tbaa !8
  %73 = or i32 %42, 5
  %74 = mul nsw i32 %73, %1
  %75 = add nsw i32 %74, %6
  %76 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %75, i32 0, i32 0, i32 0)
  %77 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %73
  %78 = bitcast i32 addrspace(5)* %77 to float addrspace(5)*
  store float %76, float addrspace(5)* %78, align 4, !tbaa !8
  %79 = or i32 %42, 6
  %80 = mul nsw i32 %79, %1
  %81 = add nsw i32 %80, %6
  %82 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %81, i32 0, i32 0, i32 0)
  %83 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %79
  %84 = bitcast i32 addrspace(5)* %83 to float addrspace(5)*
  store float %82, float addrspace(5)* %84, align 8, !tbaa !8
  %85 = or i32 %42, 7
  %86 = mul nsw i32 %85, %1
  %87 = add nsw i32 %86, %6
  %88 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %11, i32 %87, i32 0, i32 0, i32 0)
  %89 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %85
  %90 = bitcast i32 addrspace(5)* %89 to float addrspace(5)*
  store float %88, float addrspace(5)* %90, align 4, !tbaa !8
  %91 = add nuw nsw i32 %42, 8
  %92 = add i32 %43, 8
  %93 = icmp eq i32 %92, %15
  br i1 %93, label %16, label %41, !llvm.loop !14

94:                                               ; preds = %114, %32
  %95 = phi i32 [ %34, %32 ], [ %148, %114 ]
  %96 = phi i32 [ 1, %32 ], [ %149, %114 ]
  %97 = icmp eq i32 %37, 0
  br i1 %97, label %108, label %98

98:                                               ; preds = %94, %98
  %99 = phi i32 [ %104, %98 ], [ %95, %94 ]
  %100 = phi i32 [ %105, %98 ], [ %96, %94 ]
  %101 = phi i32 [ %106, %98 ], [ 0, %94 ]
  %102 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %100
  %103 = load i32, i32 addrspace(5)* %102, align 4, !tbaa !8
  %104 = add i32 %103, %99
  store i32 %104, i32 addrspace(5)* %102, align 4, !tbaa !8
  %105 = add nuw nsw i32 %100, 1
  %106 = add i32 %101, 1
  %107 = icmp eq i32 %106, %37
  br i1 %107, label %108, label %98, !llvm.loop !16

108:                                              ; preds = %94, %98, %30
  br i1 %7, label %109, label %167

109:                                              ; preds = %108
  %110 = and i32 %2, 7
  %111 = icmp ult i32 %2, 8
  br i1 %111, label %152, label %112

112:                                              ; preds = %109
  %113 = and i32 %2, -8
  br label %168

114:                                              ; preds = %114, %39
  %115 = phi i32 [ %34, %39 ], [ %148, %114 ]
  %116 = phi i32 [ 1, %39 ], [ %149, %114 ]
  %117 = phi i32 [ 0, %39 ], [ %150, %114 ]
  %118 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %116
  %119 = load i32, i32 addrspace(5)* %118, align 4, !tbaa !8
  %120 = add i32 %119, %115
  store i32 %120, i32 addrspace(5)* %118, align 4, !tbaa !8
  %121 = add nuw nsw i32 %116, 1
  %122 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %121
  %123 = load i32, i32 addrspace(5)* %122, align 4, !tbaa !8
  %124 = add i32 %123, %120
  store i32 %124, i32 addrspace(5)* %122, align 4, !tbaa !8
  %125 = add nuw nsw i32 %116, 2
  %126 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %125
  %127 = load i32, i32 addrspace(5)* %126, align 4, !tbaa !8
  %128 = add i32 %127, %124
  store i32 %128, i32 addrspace(5)* %126, align 4, !tbaa !8
  %129 = add nuw nsw i32 %116, 3
  %130 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %129
  %131 = load i32, i32 addrspace(5)* %130, align 4, !tbaa !8
  %132 = add i32 %131, %128
  store i32 %132, i32 addrspace(5)* %130, align 4, !tbaa !8
  %133 = add nuw nsw i32 %116, 4
  %134 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %133
  %135 = load i32, i32 addrspace(5)* %134, align 4, !tbaa !8
  %136 = add i32 %135, %132
  store i32 %136, i32 addrspace(5)* %134, align 4, !tbaa !8
  %137 = add nuw nsw i32 %116, 5
  %138 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %137
  %139 = load i32, i32 addrspace(5)* %138, align 4, !tbaa !8
  %140 = add i32 %139, %136
  store i32 %140, i32 addrspace(5)* %138, align 4, !tbaa !8
  %141 = add nuw nsw i32 %116, 6
  %142 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %141
  %143 = load i32, i32 addrspace(5)* %142, align 4, !tbaa !8
  %144 = add i32 %143, %140
  store i32 %144, i32 addrspace(5)* %142, align 4, !tbaa !8
  %145 = add nuw nsw i32 %116, 7
  %146 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %145
  %147 = load i32, i32 addrspace(5)* %146, align 4, !tbaa !8
  %148 = add i32 %147, %144
  store i32 %148, i32 addrspace(5)* %146, align 4, !tbaa !8
  %149 = add nuw nsw i32 %116, 8
  %150 = add i32 %117, 8
  %151 = icmp eq i32 %150, %40
  br i1 %151, label %94, label %114, !llvm.loop !17

152:                                              ; preds = %168, %109
  %153 = phi i32 [ 0, %109 ], [ %226, %168 ]
  %154 = icmp eq i32 %110, 0
  br i1 %154, label %167, label %155

155:                                              ; preds = %152, %155
  %156 = phi i32 [ %164, %155 ], [ %153, %152 ]
  %157 = phi i32 [ %165, %155 ], [ 0, %152 ]
  %158 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %156
  %159 = load i32, i32 addrspace(5)* %158, align 4, !tbaa !8
  %160 = mul nsw i32 %156, %1
  %161 = add nsw i32 %160, %6
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %162
  store i32 %159, i32 addrspace(1)* %163, align 4, !tbaa !8
  %164 = add nuw nsw i32 %156, 1
  %165 = add i32 %157, 1
  %166 = icmp eq i32 %165, %110
  br i1 %166, label %167, label %155, !llvm.loop !18

167:                                              ; preds = %152, %155, %108
  call void @llvm.lifetime.end.p5i8(i64 4096, i8 addrspace(5)* %5) #4
  ret void

168:                                              ; preds = %168, %112
  %169 = phi i32 [ 0, %112 ], [ %226, %168 ]
  %170 = phi i32 [ 0, %112 ], [ %227, %168 ]
  %171 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %169
  %172 = load i32, i32 addrspace(5)* %171, align 16, !tbaa !8
  %173 = mul nsw i32 %169, %1
  %174 = add nsw i32 %173, %6
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %175
  store i32 %172, i32 addrspace(1)* %176, align 4, !tbaa !8
  %177 = or i32 %169, 1
  %178 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %177
  %179 = load i32, i32 addrspace(5)* %178, align 4, !tbaa !8
  %180 = mul nsw i32 %177, %1
  %181 = add nsw i32 %180, %6
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %182
  store i32 %179, i32 addrspace(1)* %183, align 4, !tbaa !8
  %184 = or i32 %169, 2
  %185 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %184
  %186 = load i32, i32 addrspace(5)* %185, align 8, !tbaa !8
  %187 = mul nsw i32 %184, %1
  %188 = add nsw i32 %187, %6
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %189
  store i32 %186, i32 addrspace(1)* %190, align 4, !tbaa !8
  %191 = or i32 %169, 3
  %192 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %191
  %193 = load i32, i32 addrspace(5)* %192, align 4, !tbaa !8
  %194 = mul nsw i32 %191, %1
  %195 = add nsw i32 %194, %6
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %196
  store i32 %193, i32 addrspace(1)* %197, align 4, !tbaa !8
  %198 = or i32 %169, 4
  %199 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %198
  %200 = load i32, i32 addrspace(5)* %199, align 16, !tbaa !8
  %201 = mul nsw i32 %198, %1
  %202 = add nsw i32 %201, %6
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %203
  store i32 %200, i32 addrspace(1)* %204, align 4, !tbaa !8
  %205 = or i32 %169, 5
  %206 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %205
  %207 = load i32, i32 addrspace(5)* %206, align 4, !tbaa !8
  %208 = mul nsw i32 %205, %1
  %209 = add nsw i32 %208, %6
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %210
  store i32 %207, i32 addrspace(1)* %211, align 4, !tbaa !8
  %212 = or i32 %169, 6
  %213 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %212
  %214 = load i32, i32 addrspace(5)* %213, align 8, !tbaa !8
  %215 = mul nsw i32 %212, %1
  %216 = add nsw i32 %215, %6
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %217
  store i32 %214, i32 addrspace(1)* %218, align 4, !tbaa !8
  %219 = or i32 %169, 7
  %220 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %4, i32 0, i32 %219
  %221 = load i32, i32 addrspace(5)* %220, align 4, !tbaa !8
  %222 = mul nsw i32 %219, %1
  %223 = add nsw i32 %222, %6
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %224
  store i32 %221, i32 addrspace(1)* %225, align 4, !tbaa !8
  %226 = add nuw nsw i32 %169, 8
  %227 = add i32 %170, 8
  %228 = icmp eq i32 %227, %113
  br i1 %228, label %152, label %168, !llvm.loop !19
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32>, i32, i32, i32, i32 immarg) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !15}
